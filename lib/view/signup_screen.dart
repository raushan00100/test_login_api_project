import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_model/auth_provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AuthProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Center(
          child: Text("Signup", style: TextStyle(fontWeight: FontWeight.bold)),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 40.0, right: 40, top: 40),
              child: TextField(
                controller: provider.firstNameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'FirstName',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40.0, right: 40, top: 20),
              child: TextField(
                controller: provider.lastNameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'LastName',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40.0, right: 40, top: 20),
              child: TextField(
                controller: provider.emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40.0, right: 40, top: 20),
              child: TextField(
                controller: provider.passwordController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'password',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40.0, right: 40, top: 20),
              child: TextField(
                controller: provider.genderController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'gender',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40.0, right: 40, top: 20),
              child: TextField(
                keyboardType: TextInputType.phone,
                maxLength: 10,
                controller: provider.numberController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Number',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40.0, right: 40, top: 20),
              child: TextField(
                controller: provider.addressController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Address',
                ),
              ),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.cyan,
                padding: EdgeInsets.symmetric(horizontal: 80, vertical: 12),
              ),
              onPressed: () {
                provider.callSignup(context);
              },
              child: Text("SignUp"),
            ),
          ],
        ),
      ),
    );
  }
}
