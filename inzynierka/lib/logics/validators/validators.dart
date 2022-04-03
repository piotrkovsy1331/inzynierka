class Validators {
  static String? loginEmailValidator(String? login) {
    if (login == null || login.isEmpty) {
      return 'Podaj nazwę uzytkownika lub email.';
    }
    return null;
  }

  static String? passwordValidator(String? password) {
    if (password == null || password.isEmpty) return 'Podaj hasło.';
    if (password.length < 3) return 'Podaj poprawne hasło';

    return null;
  }
}
