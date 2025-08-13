import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_login_api_project/view/login_screen.dart';
import 'package:test_login_api_project/view/profile_screen.dart';

import '../services/api_service.dart';


class AuthProvider with ChangeNotifier {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  void clearAllControllers() {
    firstNameController.clear();
    lastNameController.clear();
    emailController.clear();
    genderController.clear();
    passwordController.clear();
    numberController.clear();
    addressController.clear();
  }

  Future<void> callSignup(BuildContext context) async {
    if (firstNameController.text.isEmpty ||
        lastNameController.text.isEmpty ||
        emailController.text.isEmpty ||
        genderController.text.isEmpty ||
        passwordController.text.isEmpty ||
        numberController.text.isEmpty ||
        addressController.text.isEmpty) {
      Fluttertoast.showToast(msg: 'Please fill all fields');
      return;
    }

    var callUser = await ApiService().signup(
      firstNameController.text.toString(),
      lastNameController.text.toString(),
      emailController.text.toString(),
      genderController.text.toString(),
      passwordController.text.toString(),
      numberController.text.toString(),
      addressController.text.toString(),
    );
    if (callUser != null) {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString("FirstName", callUser.data?.firstName ?? "");
      await prefs.setString("LastName", callUser.data?.lastName ?? "");
      await prefs.setString("Email", callUser.data?.email ?? "");
      await prefs.setString("Gender", callUser.data?.gender ?? "");
      await prefs.setString("Number", callUser.data?.number ?? "");
      await prefs.setString("Address", callUser.data?.address ?? "");
      emailController.clear();
      passwordController.clear();
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
      Fluttertoast.showToast(msg: "signup success");
    } else {
      Fluttertoast.showToast(msg: callUser?.message ?? "Signup failed");
    }
  }

  Future<void> callLogin(BuildContext context) async {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      Fluttertoast.showToast(msg: "Please enter email and password");
      return;
    }

    var callUser1 = await ApiService().login(
      emailController.text.toString(),
      passwordController.text.toString(),
    );
    if (callUser1 != null) {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString("FirstName", callUser1.data?.firstName ?? "");
      await prefs.setString("LastName", callUser1.data?.lastName ?? "");
      await prefs.setString("Email", callUser1.data?.email ?? "");
      await prefs.setString("Gender", callUser1.data?.gender ?? "");
      await prefs.setString("Number", callUser1.data?.number ?? "");
      await prefs.setString("Address", callUser1.data?.address ?? "");
      await prefs.setBool("isLogin", true);
      emailController.clear();
      passwordController.clear();
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => ProfileScreen()),
            (route) => false,
      );
      Fluttertoast.showToast(msg: "Login success");
    } else {
      Fluttertoast.showToast(
        msg: callUser1?.message ?? "Invalid email or password",
      );
    }
  }
}