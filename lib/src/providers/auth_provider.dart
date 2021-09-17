import 'package:flutter/cupertino.dart';
import 'package:travel/src/models/response_model.dart';
import 'package:travel/src/utils/validators.dart';

class AuthProvider with ChangeNotifier {
  bool emailCheck = false;
  bool passwordCheck = false;
  String emailString = '';
  String passwordString = '';

  ResponseModel? login(String email, String password) {
    if (email.contains('error'))
      return ResponseModel(
          data: {},
          message: 'Usuario y/o contraseña incorrectos',
          success: false,
          statusCode: 401);
    return ResponseModel(
        data: {'user': email},
        message: 'Exito!',
        success: true,
        statusCode: 201);
  }

  void emailValidate(String email) {
    var resp = Validators.emailValidator(email);
    emailString = email;
    if (resp == null)
      emailCheck = true;
    else
      emailCheck = false;
    notifyListeners();
  }

  void passwordValidate(String password) {
    var resp = Validators.passwordValidator(password);
    password = password;
    if (resp == null)
      passwordCheck = true;
    else
      passwordCheck = false;
    notifyListeners();
  }
}
