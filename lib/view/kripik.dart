import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mppl_prak/widgets/favorite.dart';
import 'package:mppl_prak/widgets/singleitems.dart';
import 'package:mppl_prak/view/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Kripik extends StatefulWidget {
  const Kripik({Key? key}) : super(key: key);

  @override
  State<Kripik> createState() => _KripikState();
}

class _KripikState extends State<Kripik> {
  List<List<String>> menu = [
    [
      'Kiripik_Sukun_1',
      'Kripik Sukun',
      'Original',
      'Rp 10.000',
      '4.8',
      '115',
      'Kripik khas Madura rasa pedas dengan kemasan 85gram. Sangat cocok untuk Cemal Cemil. Tersedia juga rasa original'
    ],
    [
      'kripik3',
      'Rengginang Lorjuk',
      'Matang',
      'Rp 10.000',
      '4.8',
      '115',
      'Kripik khas Madura rasa pedas dengan kemasan 85gram. Sangat cocok untuk Cemal Cemil. Tersedia juga rasa original'
    ],
    [
      'kripik2',
      'Rengginang Lorjuk',
      'Mentah',
      'Rp 10.000',
      '4.8',
      '115',
      'Kripik khas Madura rasa pedas dengan kemasan 85gram. Sangat cocok untuk Cemal Cemil. Tersedia juga rasa original'
    ]
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
          padding: EdgeInsets.only(top: 5),
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
                  padding: EdgeInsets.only(left: 10, top: 10, bottom: 10),
                  child: Row(
                    children: [
                      Icon(
                        FontAwesomeIcons.circleArrowLeft,
                        color: Colors.black,
                        size: 35,
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Kripik',
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
                            builder: (context) => SingleItem(menu: menu[index]),
                          ),
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
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
                              offset: Offset(0, 3),
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
                                  image: AssetImage(
                                      "images/${menu[index][0]}.png"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(width: 10),
                            Flexible(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(top: 5),
                                    child: Text(
                                      menu[index][1],
                                      style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 5),
                                    child: Text(
                                      menu[index][2],
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 5),
                                    child: Text(
                                      menu[index][3],
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                          top: 5,
                                        ),
                                        child: Icon(
                                          Icons.star,
                                          color: const Color.fromARGB(
                                              255, 236, 149, 18),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                          left: 5,
                                          top: 5,
                                        ),
                                        child: Text(
                                          menu[index][4],
                                          style: GoogleFonts.nunitoSans(
                                              color: Colors.black54),
                                        ),
                                      ),
                                      SizedBox(width: 15),
                                      Padding(
                                        padding: EdgeInsets.only(
                                          left: 5,
                                          top: 3,
                                        ),
                                        child: Text(
                                          menu[index][5],
                                          style: GoogleFonts.nunitoSans(
                                              color: Colors.black54),
                                        ),
                                      ),
                                      SizedBox(width: 2),
                                      Padding(
                                        padding: EdgeInsets.only(
                                          left: 2,
                                          top: 3,
                                        ),
                                        child: Text(
                                          'sold',
                                          style: GoogleFonts.nunitoSans(
                                              color: Colors.black54),
                                        ),
                                      ),
                                      SizedBox(width: 18),
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
                                          padding: EdgeInsets.only(
                                            left: 5,
                                            top: 3,
                                          ),
                                          child: Icon(
                                            isFavorite
                                                ? Icons.favorite
                                                : Icons.favorite_border,
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
        child: Icon(Icons.favorite),
      ),
    );
  }
}
