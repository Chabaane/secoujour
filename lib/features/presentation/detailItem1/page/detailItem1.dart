import 'package:flutter/material.dart';
import 'package:project1/features/presentation/Le%C3%A7on1intem1/page/Le%C3%A7on1_item1.dart';

class DetailItem1 extends StatefulWidget {
  const DetailItem1({Key? key}) : super(key: key);

  @override
  _DetailItem1State createState() => _DetailItem1State();
}

class _DetailItem1State extends State<DetailItem1> {
  final List<Map<String, String>> items = [
    {"image": "assets/icon/docter.jpg", "title": "امنع و استعد"},
    {"image": "assets/icon/الحفاظ على سلامتك.jpg", "title": "الحفاظ على سلامتك"},
    {"image": "assets/icon/docter.jpg", "title": "الحفاظ على سلامة الاخرين"},
    // Ajoutez d'autres éléments ici
  ];

  late Future<void> _loadDetails;

  @override
  void initState() {
    super.initState();
    _loadDetails = _loadItem1Details();
  }

  Future<void> _loadItem1Details() async {
    // Simuler un chargement asynchrone avec un délai de 2 secondes
    await Future.delayed(Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFE3E1D2),
      body: FutureBuilder<void>(
        future: _loadDetails,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Afficher un préchargeur pendant le chargement
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            // Une fois le chargement terminé, afficher le contenu de la page
            return SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 200.0,
                    width: double.infinity,
                    child: Image.asset("assets/icon/water.jpg", fit: BoxFit.cover),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(),
                      color: Colors.red,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image.asset(
                              "assets/icon/waterIcon.png",
                              width: 50.0,
                            ),
                            SizedBox(height: 10),
                            Text(
                              'السلامة و الإستعداد',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 10),
                            Center(
                              child: LinearProgressIndicator(
                                value: 0.0, // La valeur de progression, entre 0 et 1
                                backgroundColor: Colors.grey,
                                valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                              ),
                            ),
                            SizedBox(height: 10),
                            Center(child: Text("أكمل 6/0")),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    color: Color(0XFFE3E1D2),
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.all(12.0),
                    child: Text(
                      "نظرة عامة",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "السلامة المائية",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                              color: Colors.black
                          ),
                        ),
                        Text(
                          "ان تعلم المهارات الاساسية للسباحة و السلامة المائة هو شي ضروري",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                              color: Colors.black
                          ),
                        ),
                        Text(
                          "ان تعلم المهارات الاساسية للسباحة و السلامة المائة هو شي ضروري",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                              color: Colors.black
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    color: Color(0XFFE3E1D2),
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.all(12.0),
                    child: Text(
                      "دروس",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                          color: Colors.black
                      ),
                    ),
                  ),
                  Container(
                    color: Color(0XFFE3E1D2),
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.all(12.0),
                    child: Container(
                      height: 210, // Ajustez cette hauteur en fonction de la taille de votre image et du titre
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: List.generate(
                            items.length,
                                (index) => Container(
                              color: Color(0xFFE3E4E6),
                              width: 200, // Ajustez cette largeur en fonction de vos besoins
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6.0), // Définir le rayon du border ici
                                  color: Color(0XFFE3E1D2), // Couleur de fond de la Card
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0XFFE3E1D2),
                                      spreadRadius: 2,
                                      blurRadius: 5,
                                      offset: Offset(0, 3), // Changement de la position de l'ombre par rapport à la Card
                                    ),
                                  ],
                                ),
                                  child: GestureDetector(
                                    onTap: () {
                                      // Ajoutez ici l'action à effectuer lors du clic sur la carte
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => ImageAnimationDemo(),
                                        ),
                                      );
                                    },
                                    child: Card(
                                      child: Column(
                                        children: [
                                          Container(
                                            height: 120, // Ajustez cette hauteur en fonction de la taille de votre image
                                            child: Image.asset(
                                              items[index]["image"]!,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          SizedBox(height: 8.0),
                                          Align(
                                            alignment: Alignment.centerLeft,
                                            child: Padding(
                                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                              child: Text(
                                                items[index]["title"]!,
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 8.0),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 4.0),
                                            child: Row(
                                              children: [
                                                Icon(Icons.access_time, color: Colors.red),
                                                SizedBox(width: 80.0),
                                                Text("2دقائق", style: TextStyle(color: Colors.black)),
                                                SizedBox(width: 20.0),
                                                Text(">", style: TextStyle(color: Colors.red, fontSize: 25.0)),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )

                              ),

                                ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
