import 'dart:async';

mixin Validators {
  //Email Validators
  var emailValidator =
      StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    if (email.isEmpty) {
      return sink.addError("Email field cannot be empty");
    }
    if (email.length < 6) {
      return sink.addError("Email cannot be less than 6 characters");
    }
    if (email.length > 32) {
      return sink.addError("Email cannot be greater than 32 characters");
    }
    if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email)) {
      return sink.addError("Please enter valid email address");
    } else {
      return sink.add(email);
    }
  });

  //Password Validators
  var passwordValidator = StreamTransformer<String, String>.fromHandlers(
      handleData: (password, sink) {
    if (password.isEmpty) {
      return sink.addError("Password field should not be empty");
    }
    if (password.length < 8) {
      return sink.addError("Password should not be less than 8 characters");
    }
    if (!RegExp(r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[^\da-zA-Z]).{8,15}$")
        .hasMatch(password)) {
      return sink.addError("Password is not valid");
    } else {
      return sink.add(password);
    }
  });

  //Name Validators
  var nameValidator =
      StreamTransformer<String, String>.fromHandlers(handleData: (name, sink) {
    if (name.isEmpty) {
      return sink.addError("name field should not be empty");
    }
    if (name.length < 3) {
      return sink.addError("name should no be less than 3 characters");
    }
    if (!RegExp(r"^[a-zA-Z]+(([',. -][a-zA-Z ])?[a-zA-Z]*)*$").hasMatch(name)) {
      return sink.addError("name is not valid");
    } else {
      return sink.add(name);
    }
  });

  //Mobile Validators
  var mobileValidator = StreamTransformer<String, String>.fromHandlers(
      handleData: (mobile, sink) {
    if (mobile.isEmpty) {
      return sink.addError("mobile field should not be empty");
    }
    if (mobile.length < 10) {
      return sink.addError("mobile should no be less than 10 digits");
    }
    if (mobile.length > 10) {
      return sink.addError("mobile should no be greater than 10 digits");
    }
    if (!RegExp(r"[0-9]{10}").hasMatch(mobile)) {
      return sink.addError("mobile is not valid");
    } else {
      return sink.add(mobile);
    }
  });
}
