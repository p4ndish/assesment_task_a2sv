import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Color color;
  final String buttonText;
  final VoidCallback onPress;
  const CustomButton(
      {super.key, required this.color, required this.buttonText, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: 150,
        height: 50,
      
        child: ElevatedButton(
          
            style: ElevatedButton.styleFrom(
              
              backgroundColor: color,
            ),
            onPressed: onPress,
            child: Text(buttonText, style: TextStyle( 
              color: Colors.white
            ),)),
      ),
    );
  }
}
