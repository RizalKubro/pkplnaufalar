import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoritePage extends StatefulWidget {
  final List<List<String>> favorites;

  const FavoritePage({Key? key, required this.favorites}) : super(key: key);

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
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

  Future<void> _confirmDelete(BuildContext context, int index) async {
    final bool? confirm = await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Konfirmasi Penghapusan'),
          content: const Text('Apakah Anda yakin ingin menghapus item ini dari favorit?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text('Batal'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: const Text('Hapus'),
            ),
          ],
        );
      },
    );

    if (confirm == true) {
      setState(() {
        favorites.removeAt(index);
        saveFavorites();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
      ),
      body: Column(
        children: [
          Divider(thickness: 1, color: Colors.grey), // Divider di bawah AppBar
          Expanded(
            child: ListView.builder(
              itemCount: favorites.length,
              itemBuilder: (context, index) {
                return Dismissible(
                  key: Key(favorites[index][0]),
                  onDismissed: (direction) {
                    _confirmDelete(context, index);
                  },
                  background: Container(
                    color: Colors.red,
                    child: const Icon(Icons.delete, color: Colors.white),
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.only(right: 20),
                  ),
                  child: ListTile(
                    leading: Container(
                      width: 120,
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: AssetImage("images/${favorites[index][0]}.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    title: Text(favorites[index][1]),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(favorites[index][2]), // Subtitle
                        Text(favorites[index][3]), // Price
                        Row(
                          children: [
                            Icon(Icons.star, color: Colors.amber, size: 16),
                            SizedBox(width: 5),
                            Text(favorites[index][4]), // Rating
                            SizedBox(width: 15),
                            Text("${favorites[index][5]} sold"), // Sold
                          ],
                        ),
                      ],
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () => _confirmDelete(context, index),
                    ),
                    contentPadding: EdgeInsets.symmetric(vertical: 10), // Menyesuaikan padding vertikal
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
