import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:graduation_project/Services/auth.dart';
import 'package:graduation_project/UI/authentication/validators.dart';
import 'package:graduation_project/Widgets/customUI/CustomTextButton.dart';
import 'package:graduation_project/Widgets/customUI/CustomTextField.dart';
import 'package:graduation_project/Widgets/customUI/colors.dart';
import 'package:email_validator/email_validator.dart';
import 'package:graduation_project/Widgets/customUI/customButton.dart';
import 'package:graduation_project/Widgets/customUI/customPageDesign.dart';
import 'package:graduation_project/Widgets/customUI/icons.dart';

import 'Login.dart';

class SignUpPage extends StatefulWidget  {
  const SignUpPage({Key key, @required this.auth}) : super(key: key);
  final AuthBase auth;
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpPage> {
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
  int _value = 0;
  //get data from TextField
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  String get _username => _usernameController.text;
  String get _email => _emailController.text;
  String get _password => _passwordController.text;
  String get _phone => _phoneController.text;
  String get _address => _addressController.text;
  String get _gender=> _value == 1 ? "female":"Male";

  //focus
  final FocusNode _usernameFocusNode = FocusNode();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _phoneFocusNode = FocusNode();
  final FocusNode _addressFocusNode = FocusNode();

  Future<void> _RegisterUser() async {
    try {
      await widget.auth.createUserWithEmailAndPassword(_email, _password,_address,_gender,_username,_phone);

    } catch (e) {
      print(e.toString());

    }
  }
  void _emailEditingComplete() {
    final newFocus = emailValidator.isValid(_email)
        ? _usernameFocusNode
        : _emailFocusNode;
    FocusScope.of(context).requestFocus(newFocus);
  }

  void _usernameEditingComplete() {
    final newFocus =usernameValidator.isValid(_username)
        ? _passwordFocusNode
        : _usernameFocusNode;
    FocusScope.of(context).requestFocus(newFocus);
  }

  void _passwordEditingComplete() {
    final newFocus = passwordValidator.isValid(_password)
        ? _phoneFocusNode
        : _passwordFocusNode;
    FocusScope.of(context).requestFocus(newFocus);
  }

  void _phoneEditingComplete() {
    final newFocus = phoneValidator.isValid(_phone)
        ? _addressFocusNode
        : _phoneFocusNode;
    FocusScope.of(context).requestFocus(newFocus);
  }

  void _addressEditingComplete() {}
  bool _submitted = false;
  void _submit() {
    _RegisterUser();
    setState(() {
      _submitted = true;
    });
    print('${_passwordController.text}');
  }

  void _updateState() {
    setState(() {});
  }

  List<Widget> _buildChildren() {
    bool submitEnable = emailValidator.isValid(_email) &&
        usernameValidator.isValid(_username) &&
        passwordValidator.isValid(_password) &&
        addressValidator.isValid(_address) &&
       phoneValidator.isValid(_phone);
    bool emailErrorText = _submitted && !emailValidator.isValid(_email);
    bool usernameErrorText =
        _submitted && !usernameValidator.isValid(_username);
    bool passwordErrorText =
        _submitted && !passwordValidator.isValid(_password);
    bool phoneErrorText = _submitted && !phoneValidator.isValid(_phone);
    bool addressErrorText =
        _submitted && !addressValidator.isValid(_address);
    return [
      CustomTextField(
          Controller: _emailController,
          focusNode: _emailFocusNode,
          icon: Icons.email_outlined,
          EditingComplete: _emailEditingComplete,
          actionChanging: (email) => _updateState(),
          errorMsg: emailErrorText ? invalidemailErrorText : null,
          placeholder: "Your Email",
          inputType: TextInputType.emailAddress),
      CustomTextField(
          Controller: _usernameController,
          focusNode: _usernameFocusNode,
          icon: Icons.account_circle_outlined,
          EditingComplete: _usernameEditingComplete,
          actionChanging: (username) => _updateState(),
          errorMsg: usernameErrorText ? invalidUsernameErrorText : null,
          placeholder: "Your Username",
          inputType: TextInputType.text),
      SizedBox(
        height: 16,
      ),
      TextField(
        focusNode: _passwordFocusNode,
        controller: _passwordController,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.lock_outline_sharp,
            color: Colors.white,
          ),
          hintText: "Your Password",
          hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
          errorText: passwordErrorText ? invalidPasswordErrorText : null,
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
        ),
        obscureText: true,
        textInputAction: TextInputAction.next,
        onEditingComplete: _passwordEditingComplete,
        onChanged: (password) => _updateState(),
      ),
      CustomTextField(
          Controller: _phoneController,
          focusNode: _phoneFocusNode,
          icon: Icons.phone_in_talk_outlined,
          EditingComplete: _phoneEditingComplete,
          actionChanging: (phone) => _updateState(),
          errorMsg: phoneErrorText ? invalidPhoneErrorText : null,
          placeholder: "Your Phone Number",
          inputType: TextInputType.phone),
      CustomTextField(
          Controller: _addressController,
          focusNode: _addressFocusNode,
          icon: Icons.location_on_rounded,
          EditingComplete: _addressEditingComplete,
          actionChanging: (address) => _updateState(),
          errorMsg: addressErrorText ? invalidAddressErrorText : null,
          placeholder: "Your Address",
          inputType: TextInputType.text),
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () => setState(() => _value = 0),
              child: Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.all(Radius.circular(40)),
                  color:
                      _value == 1 ? SecondryColorLight : SecondryColorLighttest,
                ),
                child: Icon(
                  MyFlutterApp.male,
                  color: PrimaryDarkColor,
                  size: 50,
                ),
              ),
            ),
            SizedBox(width: 8),
            GestureDetector(
              onTap: () => setState(() => _value = 1),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.all(Radius.circular(40)),
                  color:
                      _value == 1 ? SecondryColorLighttest : SecondryColorLight,
                ),
                height: 80,
                width: 80,
                child: Icon(
                  MyFlutterApp.female,
                  color: PrimaryDarkColor,
                  size: 50,
                ),
              ),
            ),
          ],
        ),
      ),
      CustomLoginButton(
        buttonAction:_RegisterUser,
        child: Center(
            child: Text(
    "Create Account ",
              style: TextStyle(
                fontSize: 20,
              ),
            )),
      ),
      Text(
        "or",
        style: TextStyle(color: Colors.white),
      ),
      CustomTextButton(
        child: Text(
          "Login if you have account ",
          style: TextStyle(
            fontSize: 15,
          ),
        ),
        buttonAction: () => {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LoginForm(auth: Auth(),)),
          )
        },
      ),

    ];
  }

  @override
  Widget build(BuildContext context) {
    return CustomPageDesign(
      bannerSize: 160.00,
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Form(
          child: Column(
            children: _buildChildren(),
          ),
        ),
      ),
    );
  }
}
