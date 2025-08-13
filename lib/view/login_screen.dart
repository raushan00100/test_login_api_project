import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_login_api_project/view/signup_screen.dart';

import '../view_model/auth_provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AuthProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Center(
          child: Text("login", style: TextStyle(fontWeight: FontWeight.bold)),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 40.0, right: 40, top: 40),
            child: TextField(
              controller: provider.emailController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "email",
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40.0, right: 40, top: 40),
            child: TextField(
              controller: provider.passwordController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "password",
              ),
            ),
          ),
          SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.only(left: 208.0),
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignUpScreen()),
                );
              },
              child: Text(
                "Sign Up",
                style: TextStyle(
                  color: Colors.cyan,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.cyan,
              padding: EdgeInsets.symmetric(horizontal: 80, vertical: 12),
            ),
            onPressed: () {
              provider.callLogin(context);
            },
            child: Text("Login", style: TextStyle(color: Colors.black)),
          ),
        ],
      ),
    );
  }
}
