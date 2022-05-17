import 'package:bloc_pattern/screens/login_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Register",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold
                  ),
                ),
                const SizedBox(height: 30,),
                const TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: "Enter Email Address",
                    labelText: "Email Address",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.horizontal(),
                    ),
                  ),
                ),
                const SizedBox(height: 30,),
                const TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "Enter Mobile No.",
                    labelText: "Username",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.horizontal(),
                    ),
                  ),
                ),
                const SizedBox(height: 30,),
                const TextField(
                  keyboardType: TextInputType.text,
                  obscureText: true ,
                  decoration: InputDecoration(
                    hintText: "Enter Password",
                    labelText: "Password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.horizontal(),
                    ),
                  ),
                ),
                const SizedBox(height: 30,),
                const TextField(
                  keyboardType: TextInputType.text,
                  obscureText: true ,
                  decoration: InputDecoration(
                    hintText: "Confirm Password",
                    labelText: "Confirm Password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.horizontal(),
                    ),
                  ),
                ),
                const SizedBox(height: 30,),
                _buildButton(),
                const SizedBox(height: 30,),
                RichText(text: TextSpan(
                    children: [
                      const TextSpan(
                        text: "Already a Member?",
                        style:  TextStyle(
                            color: Colors.black
                        ),
                      ),
                      const WidgetSpan(child: SizedBox(width: 5,)),
                      TextSpan(
                          text: "LogIn",
                          style: const TextStyle(
                              color: Colors.blue
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                            Navigator.of(context).pushReplacement(MaterialPageRoute(
                                builder: (context) => const LoginScreen()
                            ));
                          }),
                    ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _buildButton() {
  return Container(
    height: 50,
    width: 350,
    color: Colors.black,
    alignment: Alignment.center,
    child: const Text(
      "SignUp",
      style: TextStyle(
        color: Colors.white,
        fontSize: 20,
      ),
    ),
  );
}
