
import 'package:flutter/material.dart';
import 'package:graduation_project/Services/auth.dart';
import 'package:graduation_project/Widgets/customUI/CustomTextField.dart';
import 'package:graduation_project/Widgets/customUI/customButton.dart';
import 'package:graduation_project/Widgets/customUI/customPasswordField.dart';

class LoginWithEmailAndPassword extends StatefulWidget {
  const LoginWithEmailAndPassword({Key key, @required this.auth}) : super(key: key);
  final AuthBase auth;
  @override
  _LoginWithEmailAndPasswordState createState() => _LoginWithEmailAndPasswordState();
}

class _LoginWithEmailAndPasswordState extends State<LoginWithEmailAndPassword> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String get _email => _emailController.text;
  String get _password => _passwordController.text;
  final _passwordFieldKey = GlobalKey<FormFieldState<String>>();
  @override
  Future<void> _loginUser() async {
    try {
      await widget.auth.signInWithEmailAndPassword(_email, _password);

    } catch (e) {
      switch (e.code) {
        case "ERROR_USER_NOT_FOUND":
          {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    content: Container(
                      child: Text(
                          "There is no user with such entries. Please try again."),
                    ),
                  );
                });
          }
          break;
        case "ERROR_WRONG_PASSWORD":
          {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    content: Container(
                      child: Text("Password doesn\'t match your email."),
                    ),
                  );
                });
          }
          break;
        default:
          {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    content: Container(
                      child: Text(e.message),
                    ),
                  );
                });
          };
      }
    }
  }
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
            Controller:_emailController,
            focusNode: FocusNode(),
            icon:  Icons.email_outlined,
            placeholder: "Your Email" ,
            inputType:TextInputType.emailAddress),


        PasswordField(
    Controller:_passwordController,

        fieldKey:_passwordFieldKey ,
        labelText: 'Password *',
        ),
        SizedBox(
          height: 30,
        ),
        CustomLoginButton(
          buttonAction: () => {
            _loginUser()
            },
          child: Center(
              child: Text(
                "Log in ",
                style: TextStyle(
                  fontSize: 20,
                ),
              )),
        ),
      ],
    );
  }
}
