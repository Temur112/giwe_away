
bool doesMatch(String password, String confirmPassword) {
  return password == confirmPassword;
}

bool isStrong(String password) {
  //checks if password has Uppercase, lowercase, and numeric characters,
  // also it's length must be 8 or more characters
  RegExp regex = RegExp(
    r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$',
  );
  return regex.hasMatch(password);
}

bool isEmailValid(String email) {
  // checks if email is valid email(also checks for top-level domain (TLD))
  RegExp regex = RegExp(
    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
    caseSensitive: false,
    multiLine: false,
  );

  return regex.hasMatch(email);
}