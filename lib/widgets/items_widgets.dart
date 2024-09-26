import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mppl_prak/widgets/singleitems.dart';

class ItemWidget extends StatefulWidget {
  const ItemWidget({Key? key}) : super(key: key);

  @override
  State<ItemWidget> createState() => _ItemWidgetState();
}

class _ItemWidgetState extends State<ItemWidget> {
  List<List<String>> menu = [
    [
      'keripikpedas',
      'Keripik Pedas',
      'Pedas',
      'Rp. 10.000',
      '4.8',
      '115',
      'Kripik khas Madura rasa pedas dengan kemasan 85gram. Sangat cocok untuk Cemal Cemil. Tersedia juga rasa original'
    ],
    [
      'keripikoriginal',
      'Keripik Original',
      'Original',
      'Rp. 10.000',
      '4.8',
      '115',
      'Kripik khas Madura rasa pedas dengan kemasan 85gram. Sangat cocok untuk Cemal Cemil. Tersedia juga rasa original'
    ],
    [
      'keripikpedasmanis',
      'Keripik Pedas Manis',
      'Pedas Manis',
      'Rp. 10.000',
      '4.8',
      '115',
      'Kripik khas Madura rasa pedas dengan kemasan 85gram. Sangat cocok untuk Cemal Cemil. Tersedia juga rasa original'
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      childAspectRatio: (160 / 260),
      children: menu.map((item) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.grey[200],
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 8,
              )
            ],
          ),
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SingleItem(menu: item),
                    ),
                  );
                },
                child: Container(
                  margin: EdgeInsets.all(10),
                  child: Image.asset(
                    "images/${item[0]}.png",
                    width: 120,
                    height: 120,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 8),
                child: Align(
                  alignment: Alignment.center,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        item[1],
                        style: GoogleFonts.robotoCondensed(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        item[2],
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        item[3],
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(height: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.star,
                            color: Color.fromARGB(255, 236, 149, 18),
                          ),
                          SizedBox(width: 5),
                          Text(
                            item[4],
                            style: GoogleFonts.nunitoSans(
                              color: Colors.black54,
                            ),
                          ),
                          SizedBox(width: 15),
                          Text(
                            item[5],
                            style: GoogleFonts.nunitoSans(
                              color: Colors.black54,
                            ),
                          ),
                          SizedBox(width: 2),
                          Text(
                            'sold',
                            style: GoogleFonts.nunitoSans(
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      }).toList(),
    );
  }
}
