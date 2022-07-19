import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spotlight/controllers/auth_controller.dart';
import 'package:spotlight/views/screens/add_new_screen.dart';
import 'package:spotlight/views/screens/explore_screen.dart';
import 'package:spotlight/views/screens/notif_screen.dart';
import 'package:spotlight/views/screens/play_screen.dart';
import 'package:spotlight/views/screens/profile_screen.dart';
import 'package:spotlight/views/screens/rules_screen.dart';

// COLORS
const backgroundColor = Colors.black;
var appRed = Color(0xffFF0709);
const border = Colors.grey;

//Styles

TextStyle h1 = GoogleFonts.inter(
  color: Colors.black,
  fontSize: 25,
  fontWeight: FontWeight.w900,
);

TextStyle h3 =
    TextStyle(color: Colors.black, fontSize: 23, fontWeight: FontWeight.w600);

TextStyle s2 = TextStyle(
    color: Color(0xff808080), fontSize: 14, fontWeight: FontWeight.w400);

//Firebase
var firebaseAuth = FirebaseAuth.instance;
var firebaseStorage = FirebaseStorage.instance;
var firestore = FirebaseFirestore.instance;

//controller
var authController = AuthController.instance;

//Pages
List pages = [
  PlayScreen(),
  SearchScreen(),
  AddVideo(),
  NotificationScreen(),
  ProfileScreen(
    uid: authController.user.uid,
  )
  // Center(
  //   child: Text('Acc'),
  // ),
];
