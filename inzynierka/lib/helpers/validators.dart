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

  static String? productNameValidator(String? productName) {
    if (productName == null) {
      return 'Proszę podać nazwę produktu';
    }
    if (productName.length < 2) {
      return 'Nazwa produktu jest zbyt krótka';
    }
    if (productName.length > 20) {
      return 'Nazwa produktu jest zbyt długa ';
    } else {
      return null;
    }
  }
}
