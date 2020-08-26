String emailValidator(String value) {
  if (value.contains('@') && value.contains('.com')) {
    return null;
  }
  return 'invalid e-mail';
}

String notEmptyValidator(String value) {
  if (value.isEmpty) {
    return 'input cant be empty';
  }
  return null;
}
