import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Login", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
            SizedBox(height: 30,),
            TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: "Enter Mobile No.",
                labelText: "Username",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            SizedBox(height: 30,),
            TextField(
              keyboardType: TextInputType.text,
              obscureText: true ,
              decoration: InputDecoration(
                hintText: "Enter Password",
                labelText: "Password",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            SizedBox(height: 30,),
            RichText(text: TextSpan(
              children: [
                TextSpan(text: "Not a Member?", style:  TextStyle(color: Colors.black)),
                WidgetSpan(child: SizedBox(width: 5,)),
                TextSpan(text: "Sign Up", style: TextStyle(color: Colors.black),recognizer: TapGestureRecognizer() ..onTap = () {
                    //TODO: Navigate to register screen
                }),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
