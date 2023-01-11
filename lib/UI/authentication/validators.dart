abstract class StringValidator{
  bool isValid(String value);
}
class NonEmptyStringValidators implements StringValidator{
  @override
  bool isValid(String value){
    return value.isNotEmpty;
  }
}
class TextValidators{
  final StringValidator usernameValidator=NonEmptyStringValidators();
  final StringValidator emailValidator=NonEmptyStringValidators();
  final StringValidator passwordValidator=NonEmptyStringValidators();
  final StringValidator phoneValidator=NonEmptyStringValidators();
  final StringValidator addressValidator=NonEmptyStringValidators();

  final String invalidUsernameErrorText="Username can\'t be empty";
  final String invalidemailErrorText="Email can\'t be empty";
  final String invalidPasswordErrorText="Password can\'t be empty";
  final String invalidPhoneErrorText="Phone can\'t be empty";
  final String invalidAddressErrorText="Address can\'t be empty";

}