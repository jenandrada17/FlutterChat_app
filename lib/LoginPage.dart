import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('Button clicked');
        },
      ),

      body: Column(
        children: [
          Text(
            'Let\'s sign you in!',
            style: TextStyle(
                fontSize: 30,
                color: Colors.brown,
                fontWeight: FontWeight.bold, letterSpacing: 0.5
            ),
          ),

          Text('Welcome back! \n You\'ve been missed!',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.blueGrey),
          ),

          Image.network('https://en.pimg.jp/086/939/127/1/86939127.jpg', height: 200,),
          Container(
            height: 150,
            width: 150,
            child: FlutterLogo(),
            padding: EdgeInsets.all(10), //Inside Container
            margin: EdgeInsets.all(50), //Outside Container
            decoration: BoxDecoration(
              color: Colors.blue,  //Outside Container
              borderRadius: BorderRadius.circular(24)
            ),
          )
        ],
      ),
    );
  }
}