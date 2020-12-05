String emailValidator(String value) {
  if (value.contains('@') && value.contains('.com')) {
    return null;
  }
  return 'Invalid e-mail';
}

String notEmptyValidator(String value) {
  if (value.isEmpty) {
    return 'Input cant be empty';
  }
  return null;
}
