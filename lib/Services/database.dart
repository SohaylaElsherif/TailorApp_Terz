import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:graduation_project/Models/user.dart';
class DatabaseService{
  DatabaseService({this.Uid});

  final String Uid;
  //collection reference
  final CollectionReference UserCollection = FirebaseFirestore.instance.collection('users');

  Future updateUserData(
      {String email,
      String userAddress,
      String userGender,
      String userName,
      String userPhone,
      String profileImg}) async {
    return await UserCollection.doc(Uid).set({
      'userAddress':userAddress,
      'userEmail':email,
      'userGender':userGender,
      'userName':userName,
      'userPhone':userPhone,
      'profileImg':profileImg,


    });
  }
  Future UserMeasurment({
    String back = "0",
    String back_rise= "0",
    String chest =  "0",
    String front_rise = "0",
    String hips ="0",
    String knee = "0",
    String leg_opening ="0",
    String lenght ="0",
    String neck = "0",
    String shoulder = "0",
    String sleeve = "0",
    String thighs = "0",
    String waist = "0"
}) async {

    return await UserCollection.doc(Uid).collection('Measurmnet').doc(Uid).set({
      "back" : back,
      "back_rise" : back_rise,
      "chest" : chest,
      "front_rise" :front_rise,
      "hips" : hips,
      "knee" : knee,
      "leg_opening" :leg_opening,
      "lenght" :lenght,
      "neck" : neck,
      "shoulder" : shoulder,
      "sleeve" : sleeve,
      "thighs" :thighs,
      "waist" : waist

    });
  }

  Stream<DocumentSnapshot> get UserData{
    return UserCollection.doc(FirebaseAuth.instance.currentUser.uid).snapshots();
  }


Stream<DocumentSnapshot> get getUserMeasurment{
  return UserCollection.doc(FirebaseAuth.instance.currentUser.uid).collection('Measurmnet').doc(FirebaseAuth.instance.currentUser.uid).snapshots();
}
}