import 'package:bloc_pattern/validations/validators.dart';
import 'package:rxdart/rxdart.dart';

class RegisterBloc with Validators {
  final _regEmail = BehaviorSubject<String>();
  final _regName = BehaviorSubject<String>();
  final _regMobile = BehaviorSubject<String>();
  final _regPassword = BehaviorSubject<String>();
  final _regConfPass = BehaviorSubject<String>();

  //Getters
  Stream<String> get regEmail => _regEmail.stream.transform(emailValidator);
  Stream<String> get regName => _regName.stream.transform(nameValidator);
  Stream<String> get regMobile => _regMobile.stream.transform(mobileValidator);
  Stream<String> get regPassword =>
      _regPassword.stream.transform(passwordValidator);
  Stream<String> get regConfPass =>
      _regConfPass.stream.transform(passwordValidator);

  Stream<bool> get isValid => Rx.combineLatest5(regEmail, regName, regMobile,
      regPassword, regConfPass, (a, b, c, d, e) => true);

  Stream<bool> get isPasswordMatched =>
      Rx.combineLatest2(regPassword, regConfPass, (a, b) {
        if (a != b) {
          return false;
        } else {
          return true;
        }
      });

  //Setters
  Function(String) get changeRegEmail => _regEmail.sink.add;
  Function(String) get changeRegName => _regName.sink.add;
  Function(String) get changeRegMobile => _regMobile.sink.add;
  Function(String) get changeRegPassword => _regPassword.sink.add;
  Function(String) get changeRegConfPass => _regConfPass.sink.add;

  //SignUp Button
  void submit() {
    if (regPassword != regConfPass) {
      _regConfPass.sink.addError("Password doesn't match");
    } else {
      print("Register");
    }
  }

  void dispose() {
    _regEmail.close();
    _regConfPass.close();
    _regMobile.close();
    _regName.close();
    _regPassword.close();
  }
}
