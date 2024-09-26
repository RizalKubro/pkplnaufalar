import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mppl_prak/view/home.dart';
import 'package:mppl_prak/widgets/favorite.dart';
import 'package:mppl_prak/widgets/singleitemlauk.dart';
import 'package:shared_preferences/shared_preferences.dart';

class lauk extends StatefulWidget {
  const lauk({super.key});

  @override
  State<lauk> createState() => _laukState();
}

class _laukState extends State<lauk> {
  List<List<String>> menu = [
    [
      'lauk1',
      'Serundeng',
      'Original',
      'Rp. 10.000',
      '4.8',
      '115',
      'Serundeng ini menggunakan bahan berkualitas (tanpa pengawet)'
    ],
    // Add more menu items here if needed
  ];

  List<List<String>> favorites = [];

  @override
  void initState() {
    super.initState();
    loadFavorites();
  }

  Future<void> loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final favoriteList = prefs.getStringList('favorites') ?? [];
    setState(() {
      favorites = favoriteList.map((item) => item.split(',')).toList();
    });
  }

  Future<void> saveFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final favoriteList = favorites.map((item) => item.join(',')).toList();
    prefs.setStringList('favorites', favoriteList);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Home(),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
                  child: Row(
                    children: [
                      const Icon(
                        FontAwesomeIcons.circleArrowLeft,
                        color: Colors.black,
                        size: 35,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        'Lauk',
                        style: GoogleFonts.openSans(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: menu.length,
                  itemBuilder: (context, index) {
                    final isFavorite = favorites.contains(menu[index]);

                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SingleItemlauk(menu: menu[index]),
                          ),
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        width: 400,
                        height: 125,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey[200],
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 185,
                              height: 125,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  image: AssetImage("images/${menu[index][0]}.png"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Flexible(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text(
                                      menu[index][1],
                                      style: const TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text(
                                      menu[index][2],
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text(
                                      menu[index][3],
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.only(top: 5),
                                        child: Icon(
                                          Icons.star,
                                          color: Color.fromARGB(255, 236, 149, 18),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 5, top: 5),
                                        child: Text(
                                          menu[index][4],
                                          style: GoogleFonts.nunitoSans(
                                            color: Colors.black54,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 15),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 5, top: 3),
                                        child: Text(
                                          menu[index][5],
                                          style: GoogleFonts.nunitoSans(
                                            color: Colors.black54,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 2),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 2, top: 3),
                                        child: Text(
                                          'sold',
                                          style: GoogleFonts.nunitoSans(
                                            color: Colors.black54,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 30),
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            if (isFavorite) {
                                              favorites.remove(menu[index]);
                                            } else {
                                              favorites.add(menu[index]);
                                            }
                                            saveFavorites();
                                          });
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.only(left: 5, top: 3),
                                          child: Icon(
                                            isFavorite ? Icons.favorite : Icons.favorite_border,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FavoritePage(favorites: favorites),
            ),
          );
        },
        child: const Icon(Icons.favorite),
      ),
    );
  }
}
