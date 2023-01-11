import 'package:flutter/material.dart';
import 'package:graduation_project/UI/authentication/validators.dart';
import 'package:graduation_project/Widgets/customUI/CustomTextField.dart';
import 'package:graduation_project/Widgets/customUI/colors.dart';
import 'UserProfile1.dart';
// import 'package:image_picker/image_picker.dart';


class EditProfilePage extends StatefulWidget with TextValidators {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  bool showPassword = false;
// image Picker -------------------------------------------------error------------------------
//   File _image;
//   final picker =ImagePicker();
//   Future getImage(ImageSource src) async{
//     final pickedFile=await picker.getImage(source: src);
//
//     setState(() {
//       if(pickedFile !=null){
//         _image=File(pickedFile.path);
//       }
//       else{
//         print('No image selected');
//       }
//     });
//   }





  //BottomSheet Method
  void displayBottomSheet(BuildContext context){
    showModalBottomSheet(context: context, builder: (_){
      return SingleChildScrollView(
        child:Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 20
          ),
          child: Column(
            children: [
              Text("Choose Profile Photo",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                    onPressed: (){
                      // getImage(ImageSource.camera);

                    },
                    child:Row(
                      children: [
                        Icon(
                          Icons.photo_camera,
                          color: PrimaryAssentColor,
                        ),
                        Text("Camera",style: TextStyle(color: PrimaryDarkColor),),
                      ],
                    ),
                  ),

                  TextButton(
                    onPressed: (){
                      // getImage(ImageSource.gallery);
                    },
                    child:Row(
                      children: [
                        Icon(
                          Icons.image,
                          color: PrimaryAssentColor,
                        ),
                        Text("Gallery",style: TextStyle(color: PrimaryDarkColor),),
                      ],
                    ),
                  ),
                  // ListTile(
                  //   leading: Icon(Icons.camera,color:PrimaryAssentColor ,),
                  //   title: Text("Camera",style: TextStyle(color: PrimaryDarkColor),),
                  //   onTap: (){},
                  // ),
                  // ListTile(
                  //   leading: Icon(Icons.image,color:PrimaryAssentColor ,),
                  //   title: Text("Gallery",style: TextStyle(color: PrimaryDarkColor),),
                  //   onTap: (){},
                  // ),
                ],
              )
            ],
          ),
        ),
      );
    });
  }

  //TextField

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  String get _username => _usernameController.text;
  String get _email => _emailController.text;
  String get _phone => _phoneController.text;
  String get _address => _addressController.text;

  //focus
  final FocusNode _usernameFocusNode = FocusNode();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _phoneFocusNode = FocusNode();
  final FocusNode _addressFocusNode = FocusNode();

  void _emailEditingComplete() {
    final newFocus = widget.emailValidator.isValid(_email)
        ? _usernameFocusNode
        : _emailFocusNode;
    FocusScope.of(context).requestFocus(newFocus);
  }

  void _usernameEditingComplete() {
    final newFocus = widget.usernameValidator.isValid(_username)
        ? _phoneFocusNode
        : _usernameFocusNode;
    FocusScope.of(context).requestFocus(newFocus);
  }

  void _phoneEditingComplete() {
    final newFocus = widget.phoneValidator.isValid(_phone)
        ? _addressFocusNode
        : _phoneFocusNode;
    FocusScope.of(context).requestFocus(newFocus);
  }

  void _addressEditingComplete() {}
  bool _submitted = false;
  void _submit() {
    setState(() {
      _submitted = true;
    });
  }

  void _updateState() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    bool submitEnable = widget.emailValidator.isValid(_email) &&
        widget.usernameValidator.isValid(_username) &&
        widget.addressValidator.isValid(_address) &&
        widget.phoneValidator.isValid(_phone);
    bool emailErrorText = _submitted && !widget.emailValidator.isValid(_email);
    bool usernameErrorText =
        _submitted && !widget.usernameValidator.isValid(_username);
    bool phoneErrorText = _submitted && !widget.phoneValidator.isValid(_phone);
    bool addressErrorText =
        _submitted && !widget.addressValidator.isValid(_address);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: PrimaryDarkColor,
        elevation: 1,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: PrimaryAssentColor,
          ),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => UserProfile()));
          },
        ),
    title:   Text(
      "Edit Profile",
      style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500,color: PrimaryAssentColor),
    ),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        color: PrimaryDarkColor,
        child: ListView(
          children: [
            // Text(
            //   "Edit Profile",
            //   style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500,color: Colors.white),
            // ),
            SizedBox(
              height: 15,
            ),
            Center(
              child: Stack(
                children: [
                  Container(
                    width: 130,
                    height: 130,
                    decoration: BoxDecoration(
                      border: Border.all(
                          width: 4,
                          color: Theme.of(context).scaffoldBackgroundColor),
                      boxShadow: [
                        BoxShadow(
                            spreadRadius: 2,
                            blurRadius: 10,
                            color: Colors.black.withOpacity(0.1),
                            offset: Offset(0, 10))
                      ],
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          "https://images.pexels.com/photos/3307758/pexels-photo-3307758.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=250",
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                      bottom: 0,
                      right: 0,
                      child: GestureDetector(
                        onTap: ()=>displayBottomSheet(context),
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 4,
                              color: Theme.of(context).scaffoldBackgroundColor,
                            ),
                            color: PrimaryAssentColor,
                          ),
                          child: Icon(
                            Icons.edit,
                            color: Colors.white,
                          ),
                        ),
                      )),
                ],
              ),
            ),
            SizedBox(
              height: 35,
            ),
            CustomTextField(
                Controller: _emailController,
                focusNode: _emailFocusNode,
                icon: Icons.email_outlined,
                EditingComplete: _emailEditingComplete,
                actionChanging: (email) => _updateState(),
                errorMsg: emailErrorText ? widget.invalidemailErrorText : null,
                placeholder: "Your Email",
                inputType: TextInputType.emailAddress),
            CustomTextField(
                Controller: _usernameController,
                focusNode: _usernameFocusNode,
                icon: Icons.account_circle_outlined,
                EditingComplete: _usernameEditingComplete,
                actionChanging: (username) => _updateState(),
                errorMsg: usernameErrorText ? widget.invalidUsernameErrorText : null,
                placeholder: "Your Username",
                inputType: TextInputType.text),
            CustomTextField(
                Controller: _phoneController,
                focusNode: _phoneFocusNode,
                icon: Icons.phone_in_talk_outlined,
                EditingComplete: _phoneEditingComplete,
                actionChanging: (phone) => _updateState(),
                errorMsg: phoneErrorText ? widget.invalidPhoneErrorText : null,
                placeholder: "Your Phone Number",
                inputType: TextInputType.phone),
            CustomTextField(
                Controller: _addressController,
                focusNode: _addressFocusNode,
                icon: Icons.location_on_rounded,
                EditingComplete: _addressEditingComplete,
                actionChanging: (address) => _updateState(),
                errorMsg: addressErrorText ? widget.invalidAddressErrorText : null,
                placeholder: "Your Address",
                inputType: TextInputType.text),
            SizedBox(
              height: 60,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                RaisedButton(
                  onPressed: () {Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => UserProfile()));},
                  color:SecondryColorLighttest,
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    "CANCEL",
                    style: TextStyle(
                        fontSize: 14,
                        letterSpacing: 2.2,
                        color:PrimaryDarkColor),
                  ),
                ),
                RaisedButton(
                  onPressed: () {},
                  color:PrimaryAssentColor,
                  padding: EdgeInsets.symmetric(horizontal: 50),
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Text(
                    "SAVE",
                    style: TextStyle(
                        fontSize: 14,
                        letterSpacing: 2.2,
                        color: Colors.white),
                  ),
                ),
              ],
            )
          ],
        ),

      ),
    );
  }
}