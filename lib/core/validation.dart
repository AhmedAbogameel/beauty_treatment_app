class Validations {

  static String email(String value){
    if(value.isEmpty) return 'حقل فارغ!';
    else if (!value.contains('@') || !value.contains('.')) return 'EX: example@mail.com';
    else return null;
  }

  static String phone(String value){
    if(value.isEmpty) return 'حقل فارغ!';
    else if (value.length != 10) return 'رقم الهاتف ليس مكون من 10 أرقام';
    else return null;
  }

  static String password(String value){
    if(value.isEmpty) return 'حقل فارغ!';
    else if(value.length < 8) return 'يجب ان تتكون كلمة المرور من 8 احرف عالاقل';
    else return null;
  }

  static String name(String value){
    if(value.isEmpty) return 'حقل فارغ!';
    else if(value.length < 3) return 'يجب ان يتكون الاسم من 3 احرف عالاقل';
    else return null;
  }

  static String day(String value){
    if(value.isEmpty) return 'حقل فارغ!';
    else if(value.contains('.') || value.contains(',') || value.contains('-') || value.contains('_')) return 'محتوي خاطيء';
    else if(int.parse(value) < 1 || int.parse(value) > 31) return '1 - 31';
    else if (value.length > 2) return 'محتوي خاطيء';
    else return null;
  }

  static String month(String value){
    if(value.isEmpty) return 'حقل فارغ!';
    else if(value.contains('.') || value.contains(',') || value.contains('-') || value.contains('_')) return 'محتوي خاطيء';
    else if(int.parse(value) < 1 || int.parse(value) > 12) return '1 - 12';
    else if (value.length > 2) return 'محتوي خاطيء';
    else return null;
  }

  static String year(String value){
    if(value.isEmpty) return 'حقل فارغ!';
    else if(value.contains('.') || value.contains(',') || value.contains('-') || value.contains('_')) return 'محتوي خاطيء';
    else if(int.parse(value) < 1950 || int.parse(value) > 2020) return '1950 - 2020';
    else if (value.length > 4) return 'محتوي خاطيء';
    else return null;
  }

}