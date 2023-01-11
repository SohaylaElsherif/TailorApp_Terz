import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/Services/database.dart';
import 'package:graduation_project/Widgets/customUI/CustomRowInMeasurments.dart';
import 'package:graduation_project/Widgets/customUI/colors.dart';
import 'package:graduation_project/Widgets/customUI/customButton.dart';
import 'package:graduation_project/Widgets/dropDownButton.dart';
import 'package:provider/provider.dart';

class UserMeasurment extends StatefulWidget {
  @override
  _UserMeasurmentState createState() => _UserMeasurmentState();
}

class _UserMeasurmentState extends State<UserMeasurment> {
  final TextEditingController _backController = TextEditingController();
  final TextEditingController _backRiseController = TextEditingController();
  final TextEditingController _chestController = TextEditingController();
  final TextEditingController _frontRiseController = TextEditingController();
  final TextEditingController _hipsController = TextEditingController();
  final TextEditingController _kneeController = TextEditingController();
  final TextEditingController _legOpeningController = TextEditingController();
  final TextEditingController _lengthController = TextEditingController();
  final TextEditingController _neckController = TextEditingController();
  final TextEditingController _shoulderController = TextEditingController();
  final TextEditingController _sleeveController = TextEditingController();
  final TextEditingController _thighsController = TextEditingController();
  final TextEditingController _waistController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final getUserMeasurment = Provider.of<DocumentSnapshot>(context);
    Map<String, dynamic> UserMeasurmentMap;
    if (getUserMeasurment != null) {
      UserMeasurmentMap = Map.from(getUserMeasurment.data());
    }
    Future<void> _Save() async {
      await DatabaseService(Uid: FirebaseAuth.instance.currentUser.uid)
          .UserMeasurment(
              back: _backController.text,
              back_rise: _backRiseController.text,
              chest: _chestController.text,
              front_rise: _frontRiseController.text,
              hips: _hipsController.text,
              knee: _kneeController.text,
              leg_opening: _legOpeningController.text,
              lenght: _lengthController.text,
              neck: _neckController.text,
              shoulder: _shoulderController.text,
              sleeve: _sleeveController.text,
              thighs: _thighsController.text,
              waist: _waistController.text);
    }

    if (getUserMeasurment != null) {
      return Column(children: [
        CustomRowInMeasurments(
          text: "Back",
          controller: _backController,
          bgcolor: SecondryColorLight,
          sizeVaule: UserMeasurmentMap['back'],
        ),
        CustomRowInMeasurments(
          text: "Back Rise",
          controller: _backRiseController,
          bgcolor: SecondryColordarkLight,
          sizeVaule: UserMeasurmentMap['back_rise'],
        ),
        CustomRowInMeasurments(
          text: "Chest",
          controller: _chestController,
          sizeVaule: UserMeasurmentMap['chest'],
          bgcolor: SecondryColorLight,
        ),
        CustomRowInMeasurments(
          text: "Front Rise",
          sizeVaule: UserMeasurmentMap['front_rise'],
          controller: _frontRiseController,
          bgcolor: SecondryColordarkLight,
        ),
        CustomRowInMeasurments(
          text: "Hips",
          sizeVaule: UserMeasurmentMap['hips'],
          controller: _hipsController,
          bgcolor: SecondryColorLight,
        ),
        CustomRowInMeasurments(
          text: "Knee",
          sizeVaule: UserMeasurmentMap['knee'],
          controller: _kneeController,
          bgcolor: SecondryColordarkLight,
        ),
        CustomRowInMeasurments(
          sizeVaule: UserMeasurmentMap['leg_opening'],
          text: "Leg Opening",
          controller: _legOpeningController,
          bgcolor: SecondryColorLight,
        ),
        CustomRowInMeasurments(
          sizeVaule: UserMeasurmentMap['lenght'],
          text: "Length",
          controller: _lengthController,
          bgcolor: SecondryColordarkLight,
        ),
        CustomRowInMeasurments(
          text: "Neck",
          controller: _neckController,
          sizeVaule: UserMeasurmentMap['neck'],
          bgcolor: SecondryColorLight,
        ),
        CustomRowInMeasurments(
          text: "Shoulder",
          controller: _shoulderController,
          sizeVaule: UserMeasurmentMap['shoulder'],
          bgcolor: SecondryColordarkLight,
        ),
        CustomRowInMeasurments(
          text: "Sleeve",
          controller: _sleeveController,
          sizeVaule: UserMeasurmentMap['sleeve'],
          bgcolor: SecondryColorLight,
        ),
        CustomRowInMeasurments(
          text: "Thighs",
          controller: _thighsController,
          sizeVaule: UserMeasurmentMap['thighs'],
          bgcolor: SecondryColordarkLight,
        ),
        CustomRowInMeasurments(
          text: "Waist",
          controller: _waistController,
          sizeVaule: UserMeasurmentMap['waist'],
          bgcolor: SecondryColorLight,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 1,
                child: CustomLoginButton(
                  buttonAction: _Save,
                  child: Center(
                      child: Text(
                    "Save Changes",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  )),
                ),
              ),
            ],
          ),
        )
      ]);
    } else {
      return Align(
          alignment: Alignment.center,
          child: Center(
              child: Text("")));
    }
  }
}
