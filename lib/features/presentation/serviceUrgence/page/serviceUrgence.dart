import 'package:flutter/material.dart';
import 'package:project1/features/presentation/quize/page/page.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../generated/l10n.dart';
import '../../aide/page/aide_widget.dart';
import '../../detail/page/detail.dart';
class ServiceUrgence extends StatefulWidget {
  const ServiceUrgence({super.key});

  @override
  State<ServiceUrgence> createState() => _State();
}

class _State extends State<ServiceUrgence> {
  void _openPhoneApp() async {
    // Pre-filled phone number with the 'tel' scheme
    String phoneNumber = 'tel:23456789';

    // Check if the URL can be launched
    if (await canLaunch(phoneNumber)) {
      // Launch the URL
      await launch(phoneNumber);
    } else {
      // Handle the error if the URL cannot be launched
      throw 'Could not launch $phoneNumber';
    }
  }
  TextEditingController _searchController = TextEditingController();

  Image image1 = Image.asset('assets/icon/en.png', width: 40.0);
  Image image2 = Image.asset('assets/icon/fr.png', width: 40.0);
  Image image3 = Image.asset('assets/icon/tunisie.png', width: 40.0);


  @override
  Widget build(BuildContext context) {
    List<String> yourData = [
      S.of(context).Emergencycontentitem1,
      S.of(context).Chokingchild,
      S.of(context).Etouffement,
      "Quatrième élément",
      "Cinquième élément",
      "Cinquième élément",
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).calandrier,
          style: TextStyle(fontSize: 29.0, color: Colors.white),
        ),
        backgroundColor: Color(0XFF1E1E1E),
      ),
        body: SingleChildScrollView(
          child: Container(
            color: Color(0XFFE3E1D2),
            child: Column(
              children: [
                Container(
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      children: [TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white, // Couleur de la bordure
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          hintText: S.of(context).search,
                          hintStyle: TextStyle(color: Colors.black), // Couleur du texte de l'indicatif
                          prefixIcon: Icon(Icons.search, color: Colors.black), // Icône de recherche avec couleur blanche
                        ),
                      ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    _openPhoneApp();
                  },
                  child: Container(
                    height: 118,
                    width: MediaQuery.of(context).size.width,
                    color: Color(0XFFFC082D),
                    padding: EdgeInsets.symmetric(horizontal: 0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(width: 10),
                            Image.asset(
                              "assets/icon/telephone2.png",
                              width: 50.0,
                              height: 60,
                            ),
                            SizedBox(width: 40),
                            Text(
                              S.of(context).EmergencyCall,
                              style: TextStyle(fontSize: 30, color: Colors.white),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 60),
                          child: Row(
                            children: [
                              SizedBox(width: 27),
                              Text(
                                "190",
                                style: TextStyle(fontSize: 30, color: Colors.white),
                              ),
                              SizedBox(width: 25),
                              Text(
                                S.of(context).tunis,
                                style: TextStyle(fontSize: 30, color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 15,),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: Card(
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
// Section existante
                        Row(
                          mainAxisSize: MainAxisSize.max, // Utiliser MainAxisSize.max pour que la rangée prenne toute la hauteur disponible
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child: Image.asset(
                                'assets/icon/emergency1.png',
                                width: 40,
                                height: 70.0,
                              ),
                            ),
                            SizedBox(width: 20.0),
                            Expanded(
                              flex: 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    S.of(context).Inemergency+'\n '+ S.of(context).Inemergency2,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
// Nouvelle section en bas
                        GestureDetector(
                          onTap: () {
// Ajoutez ici le code à exécuter lorsque le conteneur est cliqué
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => quiz(),
                              ),
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.only(top: 6.0, bottom: 6.0, left: 6, right: 6), // Ajoutez une marge supérieure et inférieure
                            color: Color(0xFFBDB9B8), // Changez cette couleur selon vos besoins
                            child: Row(
                              children: <Widget>[
                                Container(
                                  child: Text(
                                    S.of(context).Startrating,
                                    style: TextStyle(fontSize: 16.0),
                                  ),
                                ),
                                Spacer(),
                                Image.asset(
                                  "assets/icon/supperieur.png",color: Colors.red,
                                  width: 10,
                                  height: 20,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 50.0,
                  color: Color(0XFFE3E1D2),
                  padding: EdgeInsets.only(right: 8.0, top: 7.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end, // Alignement à droite
                    children: [
                      Text(
                          S.of(context).Emergencycontent,
                        style: TextStyle(fontSize: 20.0,color: Colors.black),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: ListView.builder(
                    shrinkWrap: true, // Pour empêcher la liste de dépasser de l'écran
                    physics: NeverScrollableScrollPhysics(), // Pour désactiver le défilement de la liste
                    itemCount: yourData.length,
                    itemBuilder: (context, index) {
                      return Card(
                        color: Colors.white,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => aideWidget()),
                            );
                          },
                          child: ListTile(
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(yourData[index]),
                                Image.asset("assets/icon/supperieur.png",height: 20,width: 10,color: Color(0XFFFC082D),)// Icône à droite
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }



  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
