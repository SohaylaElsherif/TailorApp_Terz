import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:graduation_project/Services/auth.dart';
import 'package:graduation_project/UI/authentication/LoginForm.dart';
import 'package:graduation_project/Widgets/customUI/CustomTextButton.dart';
import 'package:graduation_project/Widgets/customUI/CustomTextField.dart';
import 'package:graduation_project/Widgets/customUI/customButton.dart';
import 'package:graduation_project/Widgets/customUI/customPasswordField.dart';
import '../../Widgets/customUI/customPageDesign.dart';
import 'SignUpPage.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({Key key, @required this.auth}) : super(key: key);
final AuthBase auth;
  @override
  Future<void> _signInWithGoogle() async{
    try{
      await auth.signInWithGoogle();
    }catch(e){
      print(e.toString());
    }
  }
  Future<void> _signInWiFaceBook() async{
    try{
      await auth.signInWithFacebook();
    }catch(e){
      print(e.toString());
    }
  }
  Widget build(BuildContext context) {
    return CustomPageDesign(
      bannerSize: 200.0,
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(right: 10, left:10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LoginWithEmailAndPassword(auth: auth,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomTextButton(
                      child: Text(
                        "Create Account   ",
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      buttonAction: () => {
                      Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignUpPage(auth: auth,)),
                      )
                      },
                    ),
                    CustomTextButton(
                      child: Text(
                        "Forget password ? ",
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      buttonAction: () => {},
                    )
                  ],
                ),
                CustomTextButton(
                  child: Row(
                    children: [
                      Icon(FontAwesomeIcons.facebook ,  color: Colors.blue.shade800,
                      ),

                      Text(
                        " Login with Facebook   ",
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                  buttonAction: _signInWiFaceBook,
                ),CustomTextButton(
                  child: Row(
                    children: [
                      Icon(FontAwesomeIcons.google ,  color: Colors.redAccent,
                      ),

                      Text(
                        " Login with Google  ",
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                  buttonAction: _signInWithGoogle,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
