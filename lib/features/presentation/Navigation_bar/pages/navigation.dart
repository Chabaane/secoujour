import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:project1/features/presentation/malaise/page/malaise.dart';
import 'package:project1/generated/l10n.dart';

import '../../aboutUs/page/aboutUs.dart';
import '../../chaleur/page/chaleur.dart';
import '../../item1/page/item1.dart';
import 'package:project1/features/presentation/login/page/login.dart';
import 'package:project1/features/presentation/registre/page/registre.dart';
import 'package:project1/features/presentation/plan/page/plan.dart';
import 'package:project1/features/presentation/gestion/page/gestion.dart';
import 'package:project1/features/presentation/my_bloc/Home/Home.dart';
import 'package:project1/features/presentation/profile/page/profile.dart';
import 'package:project1/features/presentation/calendrier/page/calendrier.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project1/features/presentation/serviceUrgence/page/serviceUrgence.dart';

import '../../lesionsCutanees/page/lesionsCutanees.dart';

class NavigationWidget extends StatefulWidget {

  final Function(Locale) changeLanguage;


  NavigationWidget({required this.changeLanguage});

  @override
  // ignore: library_private_types_in_public_api
  _NavigationWidgetState createState() => _NavigationWidgetState();
}

class _NavigationWidgetState extends State<NavigationWidget> {
  final nav=Home();

 final ThemeData theme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  colorScheme: const ColorScheme(
    brightness: Brightness.dark,

    // OBLIGATOIRES
    primary: Colors.red,
    onPrimary: Colors.white,

    secondary: Colors.red,
    onSecondary: Colors.white,

    background: Color(0xFFE3E1D2),
    onBackground: Colors.black,

    surface: Colors.red,
    onSurface: Colors.white,

    error: Colors.red,
    onError: Colors.white,
  ),
);

  int _selectedIndex = 0;
  Locale _selectedLocale = const Locale('en', 'US'); // Language initiale en anglais
  static List<Widget> _widgetOptions(BuildContext context) => [
    SingleChildScrollView (
      child: Container(
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              decoration: const BoxDecoration(
                 // Couleur de fond du conteneur
              ),
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: TextField(
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


            ),
            StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
                return ClipRRect(
                  borderRadius: BorderRadius.only(
                  ),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 0, vertical: 16),
                    decoration: BoxDecoration(
                      color: Color(0XFFFC082D),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 6, vertical: 16),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(left: 5.0),
                                  child: Image.asset(
                                    'assets/icon/aideplan2.png',
                                    width: 100.0,
                                    height: 100.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: <Widget>[
                                Text(
                                  S.of(context).plan, // Utilisation correcte de S.of(context).plan
                                  style: TextStyle(color: Colors.white, fontSize: 25),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
                ;
              },
            ),
            StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
              return
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),

                );
            }),
            SizedBox(height: 13.0,),
            SingleChildScrollView(
              child: Container(
                child: Column(
                  children: <Widget>[
                    StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
                      bool _isHovered = false; // Move _isHovered here
                      return MouseRegion(
                          onEnter: (_) {
                            setState(() {
                              _isHovered = true;
                            });
                          },
                          child: InkWell(
                            onTap: () {
                              // Action à effectuer lorsque la carte est cliquée
                            },
                            child: MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const item1(),
                                    ),
                                  );
                                },
                                child: Container(
                                  width: 360.0, // Largeur du Container
                                  child: Card(
                                    elevation: 4,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: <Widget>[
                                        ClipRRect(
                                          child: Container(
                                            width: 190,
                                            height: 160.0, // Hauteur fixe du Container
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage('assets/icon/السلامة_و_الإستعداد2.png'),
                                                fit: BoxFit.cover, // Choisir le fit approprié ici
                                              ),
                                              borderRadius: BorderRadius.circular(8.0),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          color: Color(0XFF4B4848), // Couleur de fond du conteneur
                                          padding: EdgeInsets.all(8.0),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Text(
                                                S.of(context).plan1,
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              Icon(Icons.arrow_forward, color: Colors.white), // Flèche vers la droite
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ));
                    }),
                    StatefulBuilder(
                      builder: (BuildContext context, StateSetter setState) {
                        return Column(
                          children: <Widget>[
                            // Espacement entre les deux cartes
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const Malaise(),
                                  ),
                                );
                                // Action à effectuer lors du clic sur la Card 2
                              },
                        child:Container(
                          width:360,
                          child: Card(
                                elevation: 5,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Center(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                                    child: Image.asset(
                                      'assets/icon/malaise2.png',
                                      width: 250,
                                      height: 160.0,
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ),
                                ),
                                Container(
                                  color: Color(0XFF4B4848), // Couleur de fond du conteneur
                                  padding: EdgeInsets.zero, // Supprime le padding autour du Row
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                                          child: Text(
                                            "Les Malaise",
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(right: 16.0),
                                        child: Icon(Icons.arrow_forward, color: Colors.white), // Flèche vers la droite
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                              ),
                        ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const Chaleur(),
                                  ),
                                );
                                // Action à effectuer lors du clic sur la Card 2
                              },
                              child: Container(
                                width:360,
                                  child: Card(
                                elevation: 5,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Center(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                                      child: Image.asset(
                                        'assets/icon/EffetChaleure.png',
                                        width: 250,
                                        height: 160.0,
                                        fit: BoxFit.fitWidth,
                                      ),
                                    ),),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Color(0XFF4B4848), // Couleur de fond du conteneur
                                      ),
                                      padding: EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text(
                                            "Effets de la chaleur",
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white, // Couleur du texte
                                            ),
                                          ),
                                          Icon(Icons.arrow_forward, color: Colors.white), // Flèche vers la droite avec couleur blanche
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const LesionsCutanees(),
                                  ),
                                );
                                // Action à effectuer lors du clic sur la Card 2
                              },
                              child: Container(
                                width:360,
                              child: Card(
                                elevation: 5,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                   Center(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                                      child: Image.asset(
                                        'assets/icon/blessureCutanees.png',
                                        width: 360,
                                        height: 160.0,
                                        fit: BoxFit.fitWidth,
                                      ),
                                    ),
                                   ),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Color(0XFF4B4848),
                                        // Couleur de fond du conteneur
                                      ),
                                      padding: EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text(
                                            S.of(context).plan3,
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white, // Couleur du texte
                                            ),
                                          ),
                                          Icon(Icons.arrow_forward, color: Colors.white), // Flèche vers la droite avec couleur blanche
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              ),
                            ),
                            SizedBox(height: 16),

                          ],
                        );
                      },
                    ),

                  ],
                ),
              ),
            ),




          ],
        ),
      ),),
    ServiceUrgence(),
    AboutUsPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _changeLanguage(Locale locale) {
    setState(() {
      _selectedLocale = locale;
      widget.changeLanguage(locale);
    });
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      color: Colors.black,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,

      // Langue initiale de l'application
      locale: _selectedLocale,

      // Callback pour résoudre la langue
      localeResolutionCallback: (locale, supportedLocales) {
        // Si la langue actuelle est supportée, on la retourne
        for (var supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale?.languageCode &&
              supportedLocale.countryCode == locale?.countryCode) {
            return supportedLocale;
          }
        }
        // Sinon, on retourne la première langue supportée par défaut (anglais)
        return supportedLocales.first;
      },

      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0XFF171717),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  IconButton(
                    padding: const EdgeInsets.all(0),
                    icon: Image.asset('assets/icon/cifr2.png'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Home()),
                      );
                    },
                  ),
                ],
              ),
              Text(
                S.of(context).apprendre,
                style: TextStyle(fontSize: 30.0, color: Colors.white),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Row(
                    children: [
                      // Dropdown pour changer de langue
                      DropdownButton<Locale>(
                        value: _selectedLocale,
                        elevation: 0, // Ajoutez cette ligne pour annuler le flash
                        items: [
                          DropdownMenuItem(
                            value: Locale('en', 'US'),
                            child: Row(
                              children: [
                                Image.asset(
                                  'assets/icon/en2.png',
                                  width: 24,
                                ),
                                SizedBox(width: 8),
                              ],
                            ),
                          ),
                          DropdownMenuItem(
                            value: Locale('fr', 'FR'),
                            child: Row(
                              children: [
                                Image.asset(
                                  'assets/icon/fr2.png',
                                  width: 24,
                                ),
                                SizedBox(width: 8)
                              ],
                            ),
                          ),
                          DropdownMenuItem(
                            value: Locale('ar', 'AR'),
                            child: Row(
                              children: [
                                Image.asset(
                                  'assets/icon/tunisie2.png',
                                  width: 24,
                                ),
                                SizedBox(width: 8),
                              ],
                            ),
                          ),
                        ],
                        onChanged: (Locale? locale) {
                          if (locale != null) {
                            _changeLanguage(locale);
                          }
                        },
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const loginWidget()),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 5),
                          child: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: S.of(context).login,
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const RegistreWidget()),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Image.asset(
                            "assets/icon/registre2.png",
                            width: 34,
                            height: 37,color: Colors.blueGrey,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        body: Container(
          color: this.theme.colorScheme.background, // Couleur de fond du corps
          child: Center(
            child: _widgetOptions(context).elementAt(_selectedIndex),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Color(0XFF171717),
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: S.of(context).home,
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('assets/icon/care.png'),
                size: 25,
                color: _selectedIndex == 1 ? Colors.red : Colors.white,
              ),
              label: S.of(context).calandrier,
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('assets/icon/teamwork.png'),
                color: _selectedIndex == 2 ? Colors.red : Colors.white,
              ),
              label: S.of(context).profile,
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.red,
          unselectedItemColor: Colors.white,
          onTap: _onItemTapped,
        ),
      ),
    );
  }

}
