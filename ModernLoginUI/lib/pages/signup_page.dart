// signup_page.dart

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:modernlogintute/components/my_button.dart';
import 'package:modernlogintute/components/my_textfield.dart';
import 'package:modernlogintute/components/square_tile.dart';
import 'package:modernlogintute/pages/login_page.dart';
import 'package:http/http.dart' as http;

class SignUpPage extends StatelessWidget {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  SignUpPage({super.key});

  Future<void> signUpUser(BuildContext context) async {
    final String fullName = fullNameController.text;
    final String username = usernameController.text;
    final String email = emailController.text;
    final String phone = phoneController.text;
    final String password = passwordController.text;

    // Perform registration logic here
    final response = await http.post(
      Uri.parse('http://localhost:8080/register'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'username': username,
        'fullName': fullName,
        'email': email,
        'phone': phone,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      // Registration successful
      // Navigate to the login page
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    } else {
      // Registration failed
      // Optionally, you can handle the failure scenario, e.g., show an error message
      print('Registration failed');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50),

                // logo
                const Icon(
                  Icons.lock,
                  size: 100,
                ),

                const SizedBox(height: 50),

                // sign-up title
                Text(
                  'Create an Account',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 25),

                // full name textfield
                MyTextField(
                  controller: fullNameController,
                  hintText: 'Full Name',
                  obscureText: false,
                  keyboardType: TextInputType.text,
                ),

                const SizedBox(height: 10),

                // username textfield
                MyTextField(
                  controller: usernameController,
                  hintText: 'Username',
                  obscureText: false,
                  keyboardType: TextInputType.text,
                ),

                const SizedBox(height: 10),

                // email textfield
                MyTextField(
                  controller: emailController,
                  hintText: 'Email',
                  obscureText: false,
                  keyboardType: TextInputType.emailAddress,
                ),

                const SizedBox(height: 10),

                // phone textfield
                MyTextField(
                  controller: phoneController,
                  hintText: 'Phone',
                  obscureText: false,
                  keyboardType: TextInputType.phone,
                ),

                const SizedBox(height: 10),

                // password textfield
                MyTextField(
                    controller: passwordController,
                    hintText: 'Password',
                    obscureText: true,
                    keyboardType: TextInputType.none),

                const SizedBox(height: 10),

                // confirm password textfield
                MyTextField(
                    controller: confirmPasswordController,
                    hintText: 'Confirm Password',
                    obscureText: true,
                    keyboardType: TextInputType.none),

                const SizedBox(height: 25),

                // sign up button
                MyButton(
                  onTap: () => signUpUser(context),
                  text: "Sign Up",
                ),

                const SizedBox(height: 50),

                // or continue with
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          'Or continue with',
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 50),

                // google + apple sign in buttons
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // google button
                    SquareTile(imagePath: 'lib/images/google.png'),

                    SizedBox(width: 25),

                    // apple button
                    SquareTile(imagePath: 'lib/images/apple.png')
                  ],
                ),

                const SizedBox(height: 50),

                // already a member? sign in now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already a member?',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: () {
                        // Navigate back to the login page
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'Sign in now',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
