import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/UI/ServicesScreen/formprovider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import 'customUI/colors.dart';

class UploadImage extends StatefulWidget {
  @override
  _UploadImageState createState() => _UploadImageState();
}

class _UploadImageState extends State<UploadImage> {
  File _imageFile;
  final picker = ImagePicker();
  // Future pickImage() async {
  //   final pickedFile = await picker.getImage(source: ImageSource.camera);
  //   setState(() {
  //     _imageFile = File(pickedFile.path);
  //   });
  // }
  Future imgFromCamera() async {
    final image = await picker.getImage(source: ImageSource.camera);
    setState(() {
      _imageFile = File(image.path);
    });
  }

  Future imgFromGallery() async {
    final image = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      _imageFile = File(image.path);
    });
  }

  // Future uploadImageToFirebase(BuildContext context) async {
  //   String fileName = basename(_imageFile.path);
  //   StorageReference firebaseStorageRef =
  //       FirebaseStorage.instance.ref().child('uploads/$fileName');
  //   StorageUploadTask uploadTask = firebaseStorageRef.putFile(_imageFile);
  //   StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;
  //   taskSnapshot.ref.getDownloadURL().then(
  //         (value) => print("Done: $value"),
  //       );
  // }
  _showPicker(context) {
    FormProvider provider = Provider.of<FormProvider>(context, listen: false);
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library,
                          color: PrimaryAssentColor),
                      title: new Text('Photo Library'),
                      onTap: () async{
                        await imgFromGallery();
                        Navigator.of(context).pop();
                        provider.filePath(_imageFile);
                      }),
                  new ListTile(
                    leading:
                        new Icon(Icons.photo_camera, color: PrimaryAssentColor),
                    title: new Text('Camera'),
                    onTap: () async{
                      await imgFromCamera();
                      Navigator.of(context).pop();
                      provider.filePath(_imageFile);
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _showPicker(context);
      },
      child: Container(
        height: 240,
        width: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Color.fromRGBO(189, 190, 200, 1),
        ),
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: DottedBorder(
            padding: const EdgeInsets.all(8.0),
            borderType: BorderType.RRect,
            dashPattern: [6],
            strokeWidth: 1,
            radius: Radius.circular(12),
            child: (_imageFile != null)
                ? Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.file(
                        _imageFile,
                        fit: BoxFit.fill,
                      ),
                    ),
                  )
                : Column(children: [
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Image.asset(
                          "assets/images/upload.png",
                          width: 80,
                          height: 80,
                        ),
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Upload a file or take a photo",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Color.fromRGBO(112, 112, 112, 1)),
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        "Supported formats : JPG/PNG",
                        style: TextStyle(
                            fontSize: 16,
                            color: Color.fromRGBO(112, 112, 112, 1)),
                      ),
                    ),
                    Center(
                      child: Text(
                        "Maximum size : 2 MB",
                        style: TextStyle(
                            fontSize: 16,
                            color: Color.fromRGBO(112, 112, 112, 1)),
                      ),
                    )
                  ]),
          ),
        ),
      ),
    );
  }
}
