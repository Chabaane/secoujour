import 'package:flutter/material.dart';

class aideHypoglycemie extends StatefulWidget {
  const aideHypoglycemie({super.key});

  @override
  State<aideHypoglycemie> createState() => _aideHypoglycemieState();
}

class _aideHypoglycemieState extends State<aideHypoglycemie> {
  late Future<void> _loadDetails;


  @override
  void initState() {
    super.initState();
    _loadDetails = _loadQuizState();
  }

  Future<void> _loadQuizState() async {
    // Simuler un chargement asynchrone avec un délai de 2 secondes
    await Future.delayed(Duration(seconds: 2));
  }



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
                  _build6Container()
                ],
              ),
            );
          }
        },
      ),
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
                        color:Colors.white,
                        child: InkWell(
                          onTap: () {
                            // Masquer le conteneur principal et afficher un autre conteneur

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
