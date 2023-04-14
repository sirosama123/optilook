import 'dart:collection';
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:woocommerce_api/woocommerce_api.dart';

class Provider1 extends ChangeNotifier {
  
  int currentImg = 0;
  change(int index){
   currentImg = index;
   notifyListeners();
  }
  notifyListeners();
}