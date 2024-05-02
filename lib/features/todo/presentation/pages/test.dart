import 'package:flutter/material.dart';

class testScreen extends StatelessWidget {
  const testScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      body: ElevatedButton(
        child: Text("data"),
        onPressed: () { 
          showModalBottomSheet<void>(
                context: context,
                builder: (BuildContext context) {
                  return Container(
                    height: 200,
                    color: Colors.white,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'This is a BottomSheet',
                            style: TextStyle(fontSize: 20),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop();                   },
                            child: Text('Close BottomSheet'),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
        },
      ) ,
    );
  }
}