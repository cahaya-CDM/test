import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

void main() {
  runApp(const ListMenu());
}

class ListMenu extends StatefulWidget {
  const ListMenu({super.key});

  @override
  State<ListMenu> createState() => _ListMenuState();
}



final List<Map<String, dynamic>> menu = [
  {
    "produk": "Siomay Ayam",
    "gambar":
        "https://i.gojekapi.com/darkroom/gofood-indonesia/v2/images/uploads/64773b25-5dfb-4399-85c5-e89946229392_pangsit_goreng.jpg?auto=format",
    "price": "\$13.000",
    "rating": "4.9",
    "waktu": "60 mnt",
    "lihat": "21,5 rb"
  },
  {
    "produk": "Es Gobak Sodor",
    "gambar":
        "https://i.gojekapi.com/darkroom/gofood-indonesia/v2/images/uploads/7808dc83-61e3-465e-8110-96e7934728eb_es_genderuwo.jpg?auto=format",
    "price": "\$13.000",
    "rating": "4.9",
    "waktu": "60 mnt",
    "lihat": "21,5 rb"
  },
  {
    "produk": "Mie Gacoan LV 4",
    "gambar":
        "https://i.gojekapi.com/darkroom/gofood-indonesia/v2/images/uploads/e820250b-c4ac-4fe3-81ae-b799331cc305_mie_iblis.jpg?auto=format",
    "price": "\$13.000",
    "rating": "4.9",
    "waktu": "60 mnt",
    "lihat": "21,5 rb"
  },
  {
    "produk": "Mie Hompimpa LV 8",
    "gambar":
        "https://i.gojekapi.com/darkroom/gofood-indonesia/v2/images/uploads/91b279b4-25ce-451f-baf9-c4f333574104_mie_setan.jpg?auto=format",
    "price": "\$13.000",
    "rating": "4.9",
    "waktu": "60 mnt",
    "lihat": "21,5 rb"
  }
];

class _ListMenuState extends State<ListMenu> {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Menu Mie Gacoan Hari ini'),
        ),
        body: LayoutBuilder(builder: (context, constraints) {
          double width = constraints.maxWidth;

          int crossAxisCount;

          if (width > 1600) {
            crossAxisCount = 6; // layar monitor besar
          } else if (width > 1200) {
            crossAxisCount = 5; // layar monitor sedang
          } else if (width > 800) {
            crossAxisCount = 3; // tablet
          } else {
            crossAxisCount = 2; // smartphone
          }

          return GridView.builder(
              padding: EdgeInsets.symmetric(
                  horizontal: width * 0.05, vertical: width * 0.02),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: 12.0,
                  mainAxisSpacing: 15.0,
                  mainAxisExtent: width > 1600 ? 320 : 285),
              itemCount: menu.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.amberAccent,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 7,
                        offset: const Offset(0, 3),
                      )
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Judul Kopi kenangan
                      Row(
                        children: [
                          ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(200)),
                            child: Image.network(
                              'https://pbs.twimg.com/profile_images/1496115713022455813/a4UszgN__400x400.jpg',
                              width: width > 1600 ? 30 : 20, // Sesuaikan untuk monitor
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 3),
                            child: Row(
                              children: [
                                Text(
                                  'Mie Gacoan',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: width > 1600 ? 12 : 9), // Sesuaikan ukuran font
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                const Icon(
                                  Icons.verified_rounded,
                                  color: Colors.blue,
                                  size: 8,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),

                      // Gambar produk
                      Padding(
                        padding: const EdgeInsets.only(top: 3.0),
                        child: ClipRRect(
                          borderRadius: const BorderRadius.all(Radius.circular(15)),
                          child: AspectRatio(
                            aspectRatio: 4 / 3,
                            child: Image.network(
                              "${menu.elementAt(index)['gambar']}",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),

                      //konten Produk
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: width > 1600 ? 40 : 30,
                              child: Text(
                                "${menu.elementAt(index)['produk']}",
                                style: TextStyle(
                                    fontSize: width > 1600 ? 18 : 15, // Responsif
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Row(
                              children: [
                                RatingBar.builder(
                                  initialRating: 1,
                                  itemCount: 1,
                                  itemSize: width > 1600 ? 16 : 13, // Responsif
                                  itemPadding: const EdgeInsets.only(right: 4.0),
                                  itemBuilder: (context, _) => Icon(
                                    Icons.star,
                                    color: Colors.amber[800],
                                  ),
                                  onRatingUpdate: (rating) {
                                    // ignore: avoid_print
                                    print(rating);
                                  },
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(),
                                  child: Text(
                                    "${menu.elementAt(index)['rating']}",
                                    style: const TextStyle(
                                        fontSize: 10, color: Colors.white),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Row(
                                    children: [
                                      const Icon(
                                        Icons.access_time_filled_rounded,
                                        color: Colors.white,
                                        size: 13,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 5),
                                        child: Text(
                                          "${menu.elementAt(index)['waktu']}",
                                          style: const TextStyle(
                                              color: Colors.white, fontSize: 10),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Row(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(right: 4),
                                    child: Icon(
                                      Icons.remove_red_eye_rounded,
                                      size: 13,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    "${menu.elementAt(index)['lihat']}",
                                    style: const TextStyle(
                                        fontSize: 10, color: Colors.white),
                                  ),
                                  const Spacer(),
                                  const Align(
                                    alignment: Alignment.centerLeft,
                                    child: Icon(Icons.bookmark_border_outlined, size: 20,),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              });
        }),
      ),
    );
  }
}
