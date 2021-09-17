abstract class Validators {
  static String? emailValidator(String? email) {
    if (email == null || email.isEmpty) return 'Campo requerido';
    email = email.trim();
    Pattern pattern =
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9-]+\.[a-zA-Z]+";
    RegExp regExp = RegExp(pattern as String);
    if (email.isEmpty)
      return 'Campo requerido';
    else if (!regExp.hasMatch(email)) return 'Correo inválido';
    return null;
  }

  static String? passwordValidator(String? password) {
    if (password == null || password.isEmpty) return 'Campo requerido';
    password = password.trim();
    Pattern pattern = r'^(?=.{8,}$)(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])\S*$';
    RegExp regExp = RegExp(pattern as String);
    if (password.isEmpty) return 'Campo requerido';
    if (password.length < 8) return "La contraseña debe contener 8 caracteres";
    if (!regExp.hasMatch(password))
      return 'Tu contraseña debe contener al menos una mayúscula y un número';
    return null;
  }
}
