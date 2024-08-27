enum WaringString { waringMessageOne, waringMessageTwo }

extension WaringExtension on WaringString {
  String toStr() {
    switch (this) {
      case WaringString.waringMessageOne:
        return "Username or password cannot be empty";
      case WaringString.waringMessageTwo:
        return "Incorrect Username or Password";
    }
  }
}
