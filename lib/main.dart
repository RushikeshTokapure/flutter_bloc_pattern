import 'package:bloc_pattern/bloc/login_bloc.dart';
import 'package:bloc_pattern/bloc/register_bloc.dart';
import 'package:bloc_pattern/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<LoginBloc>(create: (context) => LoginBloc()),
        Provider<RegisterBloc>(create: (context) => RegisterBloc())
      ],
      child: MaterialApp(
        title: 'Complete Authentication',
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: const LoginScreen(),
      ),
    );
  }
}
