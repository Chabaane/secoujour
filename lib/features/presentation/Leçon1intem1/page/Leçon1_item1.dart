import 'package:flutter/material.dart';
import 'dart:async';

import '../../lecon1chap/page/lecon1chap.dart';

class ImageAnimationDemo extends StatefulWidget {
  const ImageAnimationDemo({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ImageAnimationDemoState createState() => _ImageAnimationDemoState();
}

class _ImageAnimationDemoState extends State<ImageAnimationDemo> with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<double>? _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller!,
      curve: Curves.easeInOut,
    );

    // Démarrer l'animation après un délai de 500 millisecondes
    Timer(Duration(milliseconds: 500), () {
      _controller!.forward();
    });
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0XFFE3E1D2),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: AnimatedBuilder(
                animation: _animation!,
                child: Container(
                  height: 400.0, // Définir la hauteur de l'image
                  width: MediaQuery.of(context).size.width, // Étirer l'image pour prendre toute la largeur
                  child: Image.asset(
                    'assets/icon/Leçon1.jpg',
                    fit: BoxFit.cover, // Adapter l'image pour couvrir l'espace disponible
                  ),
                ),
                builder: (BuildContext context, Widget? child) {
                  return Transform.scale(
                    scale: 0.7 + _animation!.value * 0.3, // Agrandissement de l'image
                    child: child,
                  );
                },
              ),
            ),
            Positioned(
              bottom: 0, // Positionner le bouton au bas de l'écran
              left: 0,
              right: 0,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 48),
                 backgroundColor: Colors.red, // Couleur de fond du bouton
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CarouselSliderExample()),
                  );
                  // Action à effectuer lorsque le bouton est pressé
                },
                child: Text(
                  'ابدأ',
                  style: TextStyle(fontSize: 29.0),
                ),
              ),
            ),
            Positioned(
              top: 350, // Positionner le nouveau container après l'image
              left: 0,
              right: 0,
              child: ClipPath(
                child: Container(
                  color: Color(0XFFE3E1D2), // Nouvelle couleur de fond du container
                  height: MediaQuery.of(context).size.height - 396.0, // Hauteur ajustée
                  padding: EdgeInsets.symmetric(vertical: 60), // Exemple de padding vertical
                  child: Center(
                    child: Column(
                      children: [
                        Text(
                          "درس1: امنع و استعد",
                          style: TextStyle(fontSize: 24), // Couleur de texte blanc
                        ),
                        Text(
                          "الفحص العام",
                          style: TextStyle(fontSize: 24), // Couleur de texte blanc
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/icon/teach2.png",
                              width: 94,
                              height: 84,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Classe pour définir un clipper personnalisé
class MyCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 50); // Début du chemin en bas à gauche
    path.quadraticBezierTo(size.width / 2, size.height, size.width, size.height - 50); // Courbe quadratique vers le bas à droite
    path.lineTo(size.width, 0); // Ligne vers le haut à droite
    path.close(); // Fermer le chemin
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false; // Retourner true si le clipper doit être redessiné
  }
}