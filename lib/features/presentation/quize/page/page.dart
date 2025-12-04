import 'package:flutter/material.dart';

import '../../../../generated/l10n.dart';

class quiz extends StatefulWidget {
  const quiz({super.key});

  @override
  State<quiz> createState() => _QuizState();
}

class _QuizState extends State<quiz> {
  late Future<void> _loadDetails;
  bool _showMainContainer = true;
  bool _show2Container = true;
  bool _show3Container = true;// Booléen pour suivre l'état d'affichage
  bool _show4Container = true;
  bool _show5Container = true;

  @override
  void initState() {
    super.initState();
    _loadDetails = _loadQuizState();
  }

  Future<void> _loadQuizState() async {
    // Simuler un chargement asynchrone avec un délai de 2 secondes
    await Future.delayed(Duration(seconds: 2));
  }

  List<String> yourData(BuildContext context) => [
    S.of(context).yes,
    S.of(context).no,
  ];
  List<String> ageData (BuildContext context) => [
    S.of(context).infant,
    S.of(context).child,
    S.of(context).Adult
  ];
  List<String> Data2 (BuildContext context) =>[
    S.of(context).Emergencycontentitem1,
    S.of(context).SevereBleeding
  ];
  List<String> Data3 (BuildContext context) => [
    S.of(context).Chokingchild,
    S.of(context).Etouffement,
    S.of(context).Emergencycontentitem1,
    S.of(context).AbsenceReponse,
    S.of(context).InsensibiliteRespiration,
    S.of(context).InsensibiliteRespiration2
  ];
  List<String> Data4 = [
    "تقوم مؤسستنا وشركاؤها البالغ عددهم 834 شريكًا بتخزين و/أو الوصول إلى المعلومات، مثل معرفات ملفات تعريف الارتباط الفريدة لمعالجة البيانات الشخصية، على الجهاز. ",
    "يمكنك قبول تفضيلاتك أو إدارتها بالنقر أدناه أو في أي وقت على صفحة سياسة الخصوصية. سيتم إبلاغ شركائنا",
    "يمكنك قبول تفضيلاتك أو إدارتها بالنقر أدناه أو في أي وقت على صفحة سياسة الخصوصية. سيتم إبلاغ شركائنا",
    "يمكنك قبول تفضيلاتك أو إدارتها بالنقر أدناه أو في أي وقت على صفحة سياسة الخصوصية. سيتم إبلاغ شركائنا",
    "يمكنك قبول تفضيلاتك أو إدارتها بالنقر أدناه أو في أي وقت على صفحة سياسة الخصوصية. سيتم إبلاغ شركائنا",
    "يمكنك قبول تفضيلاتك أو إدارتها بالنقر أدناه أو في أي وقت على صفحة سياسة الخصوصية. سيتم إبلاغ شركائنا"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFE3E1D2), // Remplacez cette couleur par celle que vous souhaitez
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
                  _showMainContainer ? _buildMainContainer() :_show2Container? _buildDetailContainer():_show3Container?_build3Container():_show4Container? _build4Container():_show5Container?_build5Container():_build6Container()
                ],
              ),
            );
          }
        },
      ),
    );
  }

  Widget _buildMainContainer() {
    return
      Column(
        children: [
          Container(
            height: 100.0,
            padding: EdgeInsets.only(right: 6.0, top: 28.0),
            color: Color(0XFFE3E1D2), // Remplacez cette couleur par celle que vous souhaitez
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Image.asset(
                    "assets/icon/croix2.png",
                    width: 50,
                    height: 50,
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: Colors.red, // Changez la couleur de fond ici
            child: Column(
              children: [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(width: 50.0),
                      Container(
                        padding: EdgeInsets.only(right: 10.0,top: 7), // Espace à droite
                        child: Expanded(
                          child: Text(
                            S.of(context).personRespond,
                            style: TextStyle(fontSize: 20.0,color: Colors.white),
                            textAlign: TextAlign.right,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: yourData(context).length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: InkWell(
                        onTap: () {
                          // Masquer le conteneur principal et afficher un autre conteneur
                          setState(() {
                            _showMainContainer = false;
                            _show2Container=true;
                          });
                        },
                        child: ListTile(
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(yourData(context)[index]),
                              Icon(Icons.arrow_forward), // Icône à droite
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      );

  }


  Widget _buildDetailContainer() {
    return
      Column(
          children: [
            Container(
              height: 100.0,
              padding: EdgeInsets.only(right: 6.0, top: 28.0),
              color: Color(0XFFE3E1D2), // Remplacez cette couleur par celle que vous souhaitez
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _show2Container = false;
                        _showMainContainer=true;
                      });
                    },
                    child: Image.asset(
                      "assets/icon/retoure2.png",
                      width: 50,
                      height: 50,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image.asset(
                      "assets/icon/croix2.png",
                      width: 50,
                      height: 50,
                    ),
                  ),
                ],
              ),
            ),

            Container(
        color: Colors.red, // Changez la couleur de fond ici
        child:Column(
      children: [
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(width: 10.0),
              Container(
                padding: EdgeInsets.only(right: 10.0,top: 7), // Espace à droite
                child: Expanded(
                  child: Text(
                    S.of(context).breathingNormally,
                    style: TextStyle(fontSize: 20.0,color: Colors.white),
                    textAlign: TextAlign.right,
                  ),
                ),
              ),
            ],
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: yourData(context).length,
          itemBuilder: (context, index) {
            return Card(
              child: InkWell(
                onTap: () {
                  // Masquer le conteneur principal et afficher un autre conteneur
                  setState(() {
                    _show2Container = false;
                  });
                },
                child: ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(yourData(context)[index]),
                      Icon(Icons.arrow_forward), // Icône à droite
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ],
    )
    )
          ]
    );
  }
  Widget _build3Container() {
    return Column(
        children: [
          Container(
            height: 100.0,
            padding: EdgeInsets.only(right: 6.0, top: 28.0),
            color: Color(0XFFE3E1D2), // Remplacez cette couleur par celle que vous souhaitez
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _show2Container = true;
                    });
                  },
                  child: Image.asset(
                    "assets/icon/retoure2.png",
                    width: 50,
                    height: 50,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Image.asset(
                    "assets/icon/croix2.png",
                    width: 50,
                    height: 50,
                  ),
                ),
              ],
            ),
          ),

          Container(
        color: Colors.red, // Changez la couleur de fond ici
        child:Column(
      children: [
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(width: 50.0),
              Container(
                padding: EdgeInsets.only(right: 10.0,top: 7), // Espace à droite
                child: Expanded(
                  child: Text(
                    S.of(context).breathingHeavily,
                    style: TextStyle(fontSize: 20.0,color: Colors.white),
                    textAlign: TextAlign.right,
                  ),
                ),
              ),
            ],
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: yourData(context).length,
          itemBuilder: (context, index) {
            return Card(
              child: InkWell(
                onTap: () {
                  // Masquer le conteneur principal et afficher un autre conteneur
                  setState(() {
                    _show3Container=false;
                  });
                },
                child: ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(yourData(context)[index]),
                      Icon(Icons.arrow_forward), // Icône à droite
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ],
    )
    )
        ]
    );
  }
  Widget _build4Container() {
    return Column(
        children: [
          Container(
            height: 100.0,
            padding: EdgeInsets.only(right: 6.0, top: 28.0),
            color: Color(0XFFE3E1D2), // Remplacez cette couleur par celle que vous souhaitez
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _show3Container = true;
                      _show2Container = false;
                    });
                  },
                  child: Image.asset(
                    "assets/icon/retoure2.png",
                    width: 50,
                    height: 50,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Image.asset(
                    "assets/icon/croix2.png",
                    width: 50,
                    height: 50,
                  ),
                ),
              ],
            ),
          ),

          Container(
              color: Colors.red, // Changez la couleur de fond ici
              child:Column(
                children: [
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(width: 50.0),
                        Container(
                          padding: EdgeInsets.only(right: 10.0,top: 7), // Espace à droite
                          child: Expanded(
                            child: Text(
                              S.of(context).age,
                              style: TextStyle(fontSize: 20.0,color: Colors.white),
                              textAlign: TextAlign.right,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: ageData(context).length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: InkWell(
                          onTap: () {
                            // Masquer le conteneur principal et afficher un autre conteneur
                            setState(() {
                              _show4Container = false;
                            });
                          },
                          child: ListTile(
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(ageData(context)[index]),
                                Icon(Icons.arrow_forward), // Icône à droite
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              )
          )
        ]
    );
  }
  Widget _build5Container() {
    return Column(
        children: [
          Container(
            height: 100.0,
            padding: EdgeInsets.only(right: 6.0, top: 28.0),
            color: Color(0XFFE3E1D2), // Remplacez cette couleur par celle que vous souhaitez
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _show4Container = true;
                    });
                  },
                  child: Image.asset(
                    "assets/icon/retoure2.png",
                    width: 50,
                    height: 50,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Image.asset(
                    "assets/icon/croix2.png",
                    width: 50,
                    height: 50,
                  ),
                ),
              ],
            ),
          ),

          Container(
              child:Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.only(right: 10.0), // Espace à droite
                          child: Text(
                            S.of(context).emergencyFirstAid+" \n",
                            textAlign: TextAlign.right,

                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.only(right: 10.0,top: 15), // Espace à droite
                          child: Text(
                            S.of(context).RecommendedDirections,
                            textAlign: TextAlign.right,
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                    ],
                  ),

                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: Data2(context).length,
                    itemBuilder: (context, index) {
                      return Card(
                        color: Colors.white,
                        child: InkWell(
                          onTap: () {
                            // Masquer le conteneur principal et afficher un autre conteneur
                            setState(() {
                              _show5Container = false;
                            });
                          },
                          child: ListTile(
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(Data2(context)[index]),
                                Icon(Icons.arrow_forward), // Icône à droite
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.only(right: 10.0,top: 15), // Espace à droite
                          child: Text(
                            S.of(context).AllEmergencyDirections,
                            style: TextStyle(fontSize: 20.0),
                            textAlign: TextAlign.right,
                          ),
                        ),
                      ),
                    ],
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: Data3(context).length,
                    itemBuilder: (context, index) {
                      return Card(
                        color: Colors.white,
                        child: InkWell(
                          onTap: () {
                            // Masquer le conteneur principal et afficher un autre conteneur
                            setState(() {
                              _show5Container = false;
                            });
                          },
                          child: ListTile(
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(Data3(context)[index]),
                                Icon(Icons.arrow_forward), // Icône à droite
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),


                ],
              )
          )
        ]
    );
  }

  Widget _build6Container() {
    return Column(
        children: [
          Container(
            height: 100.0,
            padding: EdgeInsets.only(right: 6.0, top: 28.0),
            color: Color(0XFFE3E1D2), // Remplacez cette couleur par celle que vous souhaitez
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _show5Container = true;
                    });
                  },
                  child: Image.asset(
                    "assets/icon/retoure2.png",
                    width: 50,
                    height: 50,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Image.asset(
                    "assets/icon/croix2.png",
                    width: 50,
                    height: 50,
                  ),
                ),
              ],
            ),
          ),

          Container(
              child:Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.only(right: 80.0,left: 20), // Espace à droite
                          child: Text(
                            " تقديم المساعدة في حالات الطوارئ",
                            style: TextStyle(fontSize: 20.0),
                            textAlign: TextAlign.right,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.only(right: 30.0,top: 15), // Espace à droite
                          child: Text(
                            "الإختناق لدى الطفل",
                            style: TextStyle(fontSize: 20.0),
                            textAlign: TextAlign.right,
                          ),
                        ),
                      ),
                    ],
                  ),

                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: Data4.length,
                    itemBuilder: (context, index) {
                      return Card(
                        color: Colors.white,
                        child: InkWell(
                          onTap: () {
                            // Masquer le conteneur principal et afficher un autre conteneur
                            setState(() {
                              _show5Container = false;
                            });
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.all(16.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Numérotation
                                    Text(
                                      '${index + 1}.', // Ajoutez 1 pour commencer à partir de 1 au lieu de 0
                                      style: TextStyle(fontSize: 16.0,color: Colors.red),
                                    ),
                                    SizedBox(width: 8), // Ajoutez un espace entre le numéro et le texte
                                    // Texte de l'élément
                                    Expanded(
                                      child: Text(
                                        Data4[index],
                                        style: TextStyle(fontSize: 16.0),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // Ajoutez ici ce que vous voulez inclure après le texte
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  Container(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, 48),
                        // Définir la couleur de fond du bouton
                       backgroundColor: Colors.red, // Changez la couleur ici selon vos besoins
                      ), onPressed: () {  },
                      child: Text('إتصل', style: TextStyle(fontSize: 29.0),),
                    ),
                  )



                ],
              )
          )
        ]
    );
  }

}
