import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_login_api_project/view/weather_screen.dart';

import '../view_model/auth_provider.dart';
import 'login_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String firstName = "";
  String lastName = "";
  String email = "";
  String address = "";
  String number = "";
  String gender = "";

  @override
  void initState() {
    super.initState();
    loadUserData();
  }

  Future<void> loadUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      firstName = prefs.getString('FirstName') ?? '';
      lastName = prefs.getString('LastName') ?? '';
      email = prefs.getString('Email') ?? '';
      address = prefs.getString('Address') ?? '';
      number = prefs.getString('Number') ?? '';
      gender = prefs.getString('Gender') ?? '';
    });
  }

  Future<void> logoutUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    var provider = Provider.of<AuthProvider>(context, listen: false);
    provider.emailController.clear();
    provider.passwordController.clear();
    provider.firstNameController.clear();
    provider.lastNameController.clear();
    provider.addressController.clear();
    provider.numberController.clear();
    provider.addressController.clear();
    provider.genderController.clear();

    if (context.mounted) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (_) => const LoginScreen()),
        (route) => false,
      );
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("You have been logged out")));
    }
  }

  Future<void> showLogoutDialog() async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Confirm Logout"),
          content: const Text("Are you sure you want to logout?"),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                logoutUser();
              },
              child: const Text("Logout"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Profile")),
        backgroundColor: Colors.cyan,
        actions: [
          InkWell(onTap: showLogoutDialog, child: Icon(Icons.logout)),
          const SizedBox(width: 25),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Welcome",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            SizedBox(height: 20),
            Text(
              "Name: $firstName $lastName",
              style: const TextStyle(fontSize: 22),
            ),
            const SizedBox(height: 10),
            Text("Email: $email", style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            Text("Gender: $gender", style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            Text("Number: $number", style: const TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text("Address: $address", style: const TextStyle(fontSize: 18)),
            SizedBox(height: 80),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.cyan,
                  padding: EdgeInsets.symmetric(horizontal: 80, vertical: 12),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => WeatherScreen()),
                  );
                },
                child: Text(
                  "Show Weather",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
