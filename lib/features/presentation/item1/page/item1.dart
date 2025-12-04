import 'package:flutter/material.dart';

import '../../../../generated/l10n.dart';
import '../../detail/page/detail.dart';
import '../../detailItem1/page/detailItem1.dart';

class item1 extends StatefulWidget {
  const item1({Key? key}) : super(key: key);

  @override
  State<item1> createState() => _State();
}

class _State extends State<item1> {
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
    final titles = [
      S.of(context).SecuriteAquatique,
      S.of(context).RoadSafety,
      S.of(context).CriseAasthme,
      S.of(context).CriseEpilepsie,
      S.of(context).CircularDistress
    ];
    final titles2 = [
      S.of(context).Heatwave,
      S.of(context).RoadSafety,
      S.of(context).CriseAasthme,
      S.of(context).CriseEpilepsie,
      S.of(context).CircularDistress
    ];

    final icons = [
      MyIcons.allergieIcon,
      MyIcons.accident,
      MyIcons.brulure,
      MyIcons.chaleur,
      MyIcons.criseAthme,
      MyIcons.criseEpilepsie,
      MyIcons.detresse,
    ];

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true, // ← important !
        title: Text(" Safety and Preparedness "),
      ),
      backgroundColor: Color(0XFFE3E1D2),
      body: FutureBuilder<void>(
        future: _loadDetails,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Afficher le préchargeur pendant le chargement
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            // Une fois le chargement terminé, afficher le contenu de la page
            return Column(
              children: [
                Image.asset(
                  "assets/icon/السلامة_و_الإستعداد2.png",
                  fit: BoxFit.cover,
                  width: 220, // Ajuste la largeur à celle de l'écran
                  height: 200, // Ajuste la hauteur selon vos besoins
                ),
                Container(
                  color: Color(0XFFE3E1D2),
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
                          Icon(
                            Icons.star,
                            size: 50,
                            color: Colors.blue,
                          ),
                          SizedBox(height: 10),
                          Text(
                            S.of(context).plan1item1,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),
                          Center(
                            child: LinearProgressIndicator(
                              value:
                                  0.0, // La valeur de progression, entre 0 et 1
                              backgroundColor: Colors.grey,
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(Colors.blue),
                            ),
                          ),
                          SizedBox(height: 10),
                          Center(child: Text(" 6/0 " + S.of(context).Complet)),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  color: Color(0XFFE3E1D2),
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: 8.0, top: 8.0, bottom: 0.0),
                  child: Text(
                    S.of(context).safety,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
                Expanded(
                  child: Container(
                    // Utilisation d'un Container pour définir le background
                    decoration: BoxDecoration(
                      color: Color(
                          0XFFE3E1D2), // Couleur de fond que vous souhaitez
                    ),
                    child: ListView.builder(
                      itemCount: titles.length,
                      itemBuilder: (context, index) {
                        return Card(
                          color: Colors.white,
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DetailItem1()),
                              );
                            },
                            child: Column(
                              children: [
                                ListTile(
                                  leading: _buildIcon(icons[index]),
                                  title: Text(
                                    titles[index],
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  trailing: Icon(Icons.keyboard_arrow_right),
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: LinearProgressIndicator(
                                        value:
                                            0.5, // Changez la valeur de progression selon vos besoins
                                        backgroundColor: Colors.grey,
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                                Colors.blue),
                                      ),
                                    ),
                                    SizedBox(
                                        width:
                                            10), // Espacement entre la barre de progression et le texte
                                    Text(
                                      "50%", // Texte à afficher à droite de la barre de progression
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blue,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Container(
                  color: Color(0XFFE3E1D2),
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    S.of(context).Preparedness,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Color(
                        0XFFE3E1D2), // Couleur de fond que vous souhaitez définir
                    child: ListView.builder(
                      itemCount: titles.length,
                      itemBuilder: (context, index) {
                        return Card(
                          color: Colors.white,
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DetailItem1()),
                              );
                            },
                            child: Column(
                              children: [
                                ListTile(
                                  leading: _buildIcon(icons[index]),
                                  title: Text(titles2[index]),
                                  trailing: Icon(Icons.keyboard_arrow_right),
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: LinearProgressIndicator(
                                        value:
                                            0.5, // Changez la valeur de progression selon vos besoins
                                        backgroundColor: Colors.grey,
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                                Colors.blue),
                                      ),
                                    ),
                                    SizedBox(
                                        width:
                                            10), // Espacement entre la barre de progression et le texte
                                    Text(
                                      "50%", // Texte à afficher à droite de la barre de progression
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blue,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }

  Widget _buildIcon(dynamic icon) {
    if (icon is IconData) {
      return Icon(icon);
    } else if (icon is String) {
      return Image.asset(icon, width: 24, height: 24);
    } else {
      return Container(); // Fallback for unknown types
    }
  }
}

class MyIcons {
  static const String allergieIcon = 'assets/icon/Allergieicon.png';
  static const String brulure = 'assets/icon/brulure.png';
  static const String chaleur = 'assets/icon/chaleur.png';
  static const String criseAthme = 'assets/icon/criseAthme.png';
  static const String criseEpilepsie = 'assets/icon/criseEpilepsie.png';
  static const String detresse = 'assets/icon/detresse2.png';
  static const String accident = 'assets/icon/accident2.png';
}
