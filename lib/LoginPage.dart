import 'package:chat_app/services/auth_service.dart';
import 'package:chat_app/utils/spaces.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media_buttons/social_media_button.dart';
import 'package:url_launcher/url_launcher.dart';
import 'widgets/login_text_field.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final _formkey = GlobalKey<FormState>();

  Future<void> loginUser(BuildContext context) async {
    if(_formkey.currentState!=null && _formkey.currentState!.validate()){
      print(userNameController.text);
      print(passwordController.text);

      await context.read<AuthService>().loginUser(userNameController.text);

      // Navigator.pushNamed(context, '/chat', arguments: '${userNameController.text}');
      Navigator.pushReplacementNamed(context, '/chat', arguments: '${userNameController.text}');
      print('Login Successful!');
    }else{
      print('Login Unuccessful!');
    }
  }

  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  final Uri toLaunch = Uri(scheme: 'https', host: 'www.google.com');

  Widget _buildHeader(context){
    return Column(
      children: [

        Text(
          'Let\'s sign you in!',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 30,
              color: Colors.black,
              fontWeight: FontWeight.bold, letterSpacing: 0.5
          ),
        ),

        Text('Welcome back! \n You\'ve been missed!',
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20, color: Colors.blueGrey),
        ),
        // verticalSpacing(24),
        Container(
          height: 200,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              image: DecorationImage(
                // fit: BoxFit.fitWidth,
                  image: AssetImage('assets/duck.png')),
              borderRadius: BorderRadius.circular(24)),
        ),
        verticalSpacing(24),
      ],
    );
  }

  Widget _buildFooter(){}

  Widget _buildForm(){}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Form(
                key: _formkey,
                child: Column(
                  children: [
                    LoginTextField(
                      hintText: "Enter your username",
                      validator: (value){
                        if (value != null && value.isNotEmpty && value.length < 5){
                          return "Your username should be more than 5 characters";
                        }else if(value != null && value.isEmpty){
                          return  "Please type your username";
                        }
                        return  null;
                      },
                      controller: userNameController,
                    ),

                    verticalSpacing(24),

                    LoginTextField(
                      hasAsterisks: true,
                      controller: passwordController,
                      hintText: "Enter your password",
                    ),
                  ],
                ),
              ),

              verticalSpacing(24),

              ElevatedButton(
                  onPressed: () async {
                    await loginUser(context);
                  },
                  child: Text( 'Login', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300)
                  )),
              // OutlinedButton(onPressed: () {}, child: FlutterLogo()),

              GestureDetector(
                onTap: () async {
                  //todo: Navigate to browser
                  print('Link clicked!');
                  if (!await launchUrl(toLaunch, mode: LaunchMode.inAppWebView)){
                    throw 'Could not launch this';
                  }
                },
                child: Column(
                  children: [
                    Text('Find us on')
                  ],
                ),
              ),

              //TODO: Add Social Media buttons here
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SocialMediaButton.twitter(
                      size: 20,
                      color: Colors.blue,
                      url: "https://twitter.com"),
                  SocialMediaButton.linkedin(
                      url: "https://www.linkedin.com/in/jennifer-andrada",)
                ],
              )

              // InkWell(
              //   splashColor: Colors.red,
              //   onDoubleTap: (){
              //     print('double tapped!');
              //   },
              //   onLongPress: (){
              //     print('Long pressed!');
              //   },
              //   onTap: (){
              //     //todo: Navigate to browser
              //     print('Link clicked!');
              //   },
              //   child: Column(
              //     children: [
              //       Text('Find us on'),
              //       Text('https://jenandrada.com'),
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}