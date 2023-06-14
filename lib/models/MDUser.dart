import 'package:flutter/material.dart';

class MDUser{
  String? uid,name,email,age,gender,bodytype,userType,experience,gymPrefrenc,ansGymBud,cv,trainerDetails,address;
  double? lat,long;
  List<String>? images;

  MDUser({
    @required this.uid,
    @required this.name,
    @required this.email,
    @required this.age,
    @required this.gender,
    @required this.bodytype,
    @required this.userType,
    @required this.experience,
    @required this.gymPrefrenc,
    @required this.ansGymBud,
    @required this.cv,
    @required this.trainerDetails,
    @required this.address,
    @required this.lat,
    @required this.long,
    @required this.images,
  });

  Map<String, dynamic> toMap() {
    return {
      'uid': this.uid,
      'name': this.name,
      'email': this.email,
      'age': this.age,
      'gender': this.gender,
      'bodytype': this.bodytype,
      'userType': this.userType,
      'experience': this.experience,
      'gymPrefrenc': this.gymPrefrenc,
      'ansGymBud': this.ansGymBud,
      'cv': this.cv,
      'trainerDetails': this.trainerDetails,
      'address': this.address,
      'lat': this.lat,
      'long': this.long,
      'images': this.images,
    };
  }

  factory MDUser.fromMap(Map map) {
    return MDUser(
      uid: map['uid']??"",
      name: map['name'] ??"",
      email: map['email'] ??"",
      age: map['age'] ??"",
      gender: map['gender']??"",
      bodytype: map['bodytype'] ??"",
      userType: map['userType'] ??"",
      experience: map['experience'] ??"",
      gymPrefrenc: map['gymPrefrenc'] ??'',
      ansGymBud: map['ansGymBud'] ??'',
      cv: map['cv'] as String,
      trainerDetails: map['trainerDetails']??'',
      address: map['address'] ??"",
      lat: map['lat'] ??0.0,
      long: map['long'] ??0.0,
      images: map['images'] ??[],
    );
  }

  @override
  String toString() {
    return 'MDUser{uid: $uid, name: $name, email: $email, age: $age, gender: $gender, bodytype: $bodytype, userType: $userType, experience: $experience, gymPrefrenc: $gymPrefrenc, ansGymBud: $ansGymBud, cv: $cv, trainerDetails: $trainerDetails, address: $address, lat: $lat, long: $long, images: $images}';
  }
}