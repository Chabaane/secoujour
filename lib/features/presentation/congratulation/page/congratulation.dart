import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CongratulationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue, // Ajoutez la couleur d'arrière-plan ici, vous pouvez utiliser n'importe quelle couleur
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Lottie animation (optional)
              Lottie.asset(
                'assets/icon/Animation.json',
                width: 200,
                height: 200,
                fit: BoxFit.fill,
              ),
              SizedBox(height: 20),
              // Congratulatory message
              Text(
                'Congratulations!',
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              Text(
                'You have successfully completed the task.',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30),
              // Button to navigate back or to another page
              ElevatedButton(
                onPressed: () {
                  // Action to perform on button press
                  Navigator.pop(context);
                },
                child: Text('Go Back'),
                style: ElevatedButton.styleFrom(
                 backgroundColor: Colors.red, // Background color
                  foregroundColor: Colors.white, // Text color
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  textStyle: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
