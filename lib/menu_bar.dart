import 'package:flutter/material.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

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

          Image.network('https://www.pngmart.com/files/13/Cartoon-Character-PNG-Transparent-Picture.png', height: 200,),
          Container(
            height: 150,
            width: 150,
            // child: FlutterLogo(),
            padding: EdgeInsets.all(10), //Inside Container
            margin: EdgeInsets.all(50), //Outside Container
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fitHeight,
                    image: NetworkImage('https://www.pngmart.com/files/13/Cartoon-Character-PNG-Transparent-Picture.png')
                ),
                color: Colors.blue,  //Outside Container
                borderRadius: BorderRadius.circular(24)
            ),
          )
        ],
      ),
    );
  }
}