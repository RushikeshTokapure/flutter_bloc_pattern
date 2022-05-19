import 'package:rxdart/rxdart.dart';

class RegisterBloc {
  final _regEmail = BehaviorSubject<String>();
  final _regUsername = BehaviorSubject<String>();
  final _regPassword = BehaviorSubject<String>();
  final _regConfPass = BehaviorSubject<String>();

  //Getters
  Stream<String> get regEmail => _regEmail.stream;
  Stream<String> get regUsername => _regUsername.stream;
  Stream<String> get regPassword => _regPassword.stream;
  Stream<String> get regConfPass => _regConfPass.stream;

  //Setters
  Function(String) get changeRegEmail => _regEmail.sink.add;
  Function(String) get changeRegUsername => _regUsername.sink.add;
  Function(String) get changeRegPassword => _regPassword.sink.add;
  Function(String) get changeRegConfPass => _regConfPass.sink.add;
}