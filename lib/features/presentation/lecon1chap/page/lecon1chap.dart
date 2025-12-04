import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../../congratulation/page/congratulation.dart';

class CarouselSliderExample extends StatefulWidget {
  const CarouselSliderExample({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CarouselSliderExampleState createState() => _CarouselSliderExampleState();
}

class _CarouselSliderExampleState extends State<CarouselSliderExample> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor:Color(0XFFE3E1D2), // Set the background color here
        body: SingleChildScrollView(
          child: Column(
            children: [
              CarouselSlider(
                items: [
                  _buildCarouselItem(
                    "https://cdn.pixabay.com/photo/2017/01/08/13/58/cube-1963036__340.jpg",
                    "دروس1: امنع و استعد",
                    "Hello, First, thanks to forum to permite my posts. So I found solution, and post here to help anyone need. for fix, one brief description: compileSdkVersion = 34, have dependences to libs: core-1.14.0-alpha01.aar and annotation-experimental-1.4.0.aar, so I need to remove this recomendations, wrong way:",
                  ),
                  _buildCarouselItem(
                    "https://cdn.pixabay.com/photo/2015/03/25/23/46/cube-689619__340.jpg",
                    "امنع و استعد",
                    "Hello, First, thanks to forum to permite my posts. So I found solution, and post here to help anyone need.for fix, one brief description: compileSdkVersion = 34, have dependences to libs: core-1.14.0-alpha01.aar and annotation-experimental-1.4.0.aar, so I need to remove this recomendations, wrong way:",
                  ),
                  _buildCarouselItem(
                    "https://images.unsplash.com/photo-1528716321680-815a8cdb8cbe?q=80&w=2565&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                    "امنع و استعد",
                    "Hello, First, thanks to forum to permite my posts. So I found solution, and post here to help anyone need.for fix, one brief description: compileSdkVersion = 34, have dependences to libs: core-1.14.0-alpha01.aar and annotation-experimental-1.4.0.aar, so I need to remove this recomendations, wrong way:",
                  ),
                  _buildCarouselItem(
                    "https://images.unsplash.com/photo-1528716321680-815a8cdb8cbe?q=80&w=2565&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                    "تتضمن بعض العوائق الشائعة التي تحول دون تقديم المساعدة للمرضى او المصابين",
                    "Hello, First, thanks to forum to permite my posts. So I found solution, and post here to help anyone need.for fix, one brief description: compileSdkVersion = 34, have dependences to libs: core-1.14.0-alpha01.aar and annotation-experimental-1.4.0.aar, so I need to remove this recomendations, wrong way:",
                  ),
                ],
                options: CarouselOptions(
                  height: 740.0,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  aspectRatio: 16 / 9,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  viewportFraction: 0.8,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                ),
              ),
              if (_currentIndex == 3) // Afficher le bouton uniquement lorsque l'index est égal à 3 (le dernier élément)
                SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 80.0, right: 47, left: 47),
                    child: ElevatedButton(
                      onPressed: () {
                        // Action à effectuer lorsque le bouton est pressé
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => CongratulationsPage()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                       backgroundColor: Colors.red, // Changer la couleur du bouton en rouge, vous pouvez utiliser n'importe quelle couleur
                      ),
                      child: Text('انتهى'),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCarouselItem(String imageUrl, String title, String paragraph) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            image: DecorationImage(
              image: NetworkImage(imageUrl),
              fit: BoxFit.cover,
            ),
          ),
          height: 300.0,
          width: double.infinity,
        ),
        SizedBox(height: 8.0),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            title,
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold), // Adjust color here
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            paragraph,
            style: TextStyle(fontSize: 16.0), // Adjust color here
          ),
        ),
      ],
    );
  }
}
