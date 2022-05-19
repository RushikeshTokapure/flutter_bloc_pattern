import 'package:bloc_pattern/bloc/login_bloc.dart';
import 'package:bloc_pattern/screens/register_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<LoginBloc>(context, listen: false);

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
                  "Login",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold
                  ),
                ),
                const SizedBox(height: 30,),
                StreamBuilder<String>(
                  stream: bloc.loginEmail,
                  builder: (context, snapshot) {
                    return TextField(
                      onChanged: (value) => bloc.changeLoginEmail,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: "Enter Email Address",
                        labelText: "Username",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.horizontal(),
                        ),
                      ),
                    );
                  }
                ),
                const SizedBox(height: 30,),
                StreamBuilder<String>(
                  stream: bloc.loginPassword,
                  builder: (context, snapshot) {
                    return TextField(
                      onChanged: bloc.changeLoginPassword,
                      keyboardType: TextInputType.text,
                      obscureText: true ,
                      decoration: InputDecoration(
                        hintText: "Enter Password",
                        labelText: "Password",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.horizontal(),
                        ),
                      ),
                    );
                  }
                ),
                const SizedBox(height: 30,),
                _buildButton(),
                const SizedBox(height: 30,),
                RichText(text: TextSpan(
                  children: [
                    const TextSpan(
                        text: "Not a Member?",
                        style:  TextStyle(
                            color: Colors.black
                        ),
                    ),
                    const WidgetSpan(child: SizedBox(width: 5,)),
                    TextSpan(
                        text: "Sign Up",
                        style: const TextStyle(
                            color: Colors.blue
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                          Navigator.of(context).pushReplacement(MaterialPageRoute(
                              builder: (context) => const RegisterScreen()
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
      "LogIn",
      style: TextStyle(
        color: Colors.white,
        fontSize: 20,
      ),
    ),
  );
}
