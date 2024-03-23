String? emailValidator(String? value) {
  bool emailRegx = RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(value!);

  if (value.isEmpty) {
    return "Enter email";
  }

  if (!emailRegx) {
    return 'invalid email';
  }
  return null;
}

String? passwordValidator(String? value) {
  if (value == null || value.isEmpty) {
    return "Enter Password";
  }

  return null;
}
