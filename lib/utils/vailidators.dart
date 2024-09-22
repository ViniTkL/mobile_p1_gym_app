bool validEmail(String input) {
  const validator = r'^[a-zA-Z0-9.-<>$#%]+@+[a-zA-Z]+.[a-zA-Z]{2,}$';

  return input == '' ? true : RegExp(validator).hasMatch(input);
}
