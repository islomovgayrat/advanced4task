import 'package:advanced4task/pages/sign_up.dart';
import 'package:advanced4task/service/logger.dart';
import 'package:flutter/material.dart';

import '../service/hive_service.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController textUserController = TextEditingController();
  TextEditingController textPassController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1B1D3A),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //image
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?cs=srgb&dl=pexels-pixabay-220453.jpg&fm=jpg',
                    fit: BoxFit.cover,
                    height: 60,
                    width: 60,
                  ),
                ),
                const SizedBox(height: 15),
                //welcome back
                const Text(
                  'Welcome Back!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                //sign in to continue
                const Text(
                  'Sign in to continue',
                  style: TextStyle(
                    color: Color(0xFF757887),
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 40),
                Column(
                  children: [
                    textField(
                      textEditingController: textUserController,
                      prefixIcon: const Icon(Icons.person_2_outlined),
                      hintText: 'User Name',
                    ),
                    const SizedBox(height: 15),
                    textField(
                      textEditingController: textPassController,
                      prefixIcon: const Icon(Icons.password),
                      hintText: 'Password',
                    ),
                  ],
                ),

                const SizedBox(height: 30),

                //forgot password
                GestureDetector(
                  onTap: () {},
                  child: const Text(
                    'Forgot Password?',
                    style: TextStyle(
                      color: Color(0xFF757887),
                      fontSize: 14,
                    ),
                  ),
                ),

                const SizedBox(height: 30),
                GestureDetector(
                  onTap: () {
                    HiveService.storeName(textUserController.text);
                    LogService.i(textUserController.toString());
                    HiveService.storeName(textPassController.text);
                    LogService.i(textPassController.toString());
                  },
                  child: Container(
                    height: 70,
                    width: 70,
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                        size: 35,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          //don't have an account and sign up
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(),
              Padding(
                padding: const EdgeInsets.only(bottom: 28.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: TextStyle(
                        color: Colors.grey.shade500,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(width: 10),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => const SignUpPage(),
                          ),
                        );
                      },
                      child: const Text(
                        "SIGN UP",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget textField({
    required TextEditingController textEditingController,
    required prefixIcon,
    required hintText,
  }) =>
      Container(
        decoration: const BoxDecoration(),
        child: TextField(
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(color: Colors.grey),
            prefixIcon: prefixIcon,
            prefixIconColor: Colors.grey,
            contentPadding: const EdgeInsets.only(top: 16),
          ),
          controller: textEditingController,
          style: const TextStyle(color: Colors.pink),
        ),
      );
}
