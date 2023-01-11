import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:graduation_project/Services/database.dart';
import 'package:graduation_project/Widgets/uploadImage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class ProfileImg extends StatefulWidget {
  @override
  _ProfileImgState createState() => _ProfileImgState();
}

class _ProfileImgState extends State<ProfileImg> {
  @override
  @override
  Widget build(BuildContext context) {
    final userInfo = Provider.of<DocumentSnapshot>(context);
    Map<String, dynamic> UserListMap;
    if (userInfo != null) {
      UserListMap = Map.from(userInfo.data());
    }
    File _image;
    // pathOfImgFromSnapShot=UserListMap['profileImg'];

    Future getImage() async {
      var image = await ImagePicker().getImage(source: ImageSource.gallery);

      setState(() {
        _image = File(image.path);
        print('Image Path $_image');
      });
      String fileName = _image.path;
      Reference firebaseStorageRef =
          FirebaseStorage.instance.ref().child(fileName);
      UploadTask uploadTask = firebaseStorageRef.putFile(_image);
      TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() async =>
          await FirebaseFirestore.instance
              .collection('users')
              .doc(FirebaseAuth.instance.currentUser.uid)
              .update({"profileImg": (firebaseStorageRef.getDownloadURL())}));
      //  print( UserListMap['profileImg']);
    }

    if (userInfo != null) {
      return Container(
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.center,
              child: CircleAvatar(
                radius: 40,
                backgroundColor: Color(0xff476cfb),
                child: ClipOval(
                  child: new SizedBox(
                    width: 110.0,
                    height: 110.0,
                    child: (_image != null)
                        ? Image.file(
                            _image,
                            fit: BoxFit.fill,
                          )
                        : Image.network(
                            UserListMap['profileImg'].toString(),
                            fit: BoxFit.fill,
                          ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 20.0,
              left: 40.0,
              right: 0.0,
              child: Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: IconButton(
                  icon: Icon(
                    FontAwesomeIcons.camera,
                    size: 30.0,
                  ),
                  onPressed: () {
                    getImage();
                  },
                ),
              ),
            ),
          ],
        ),
      );
    } else {
      return Align(
          alignment: Alignment.center,
          child: Center(
              child: Text("")));
    }
  }
}
