import 'package:advanced4task/pages/sign_in.dart';
import 'package:flutter/material.dart';

import '../service/hive_service.dart';
import '../service/logger.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController textUserController = TextEditingController();
  TextEditingController textEmailController = TextEditingController();
  TextEditingController textPhoneController = TextEditingController();
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

                //welcome back
                const Column(
                  children: [
                    Text(
                      'Create',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Account',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 80),
                Column(
                  children: [
                    textField(
                      textEditingController: textUserController,
                      prefixIcon: const Icon(Icons.person_2_outlined),
                      hintText: 'User Name',
                    ),
                    const SizedBox(height: 15),
                    textField(
                      textEditingController: textEmailController,
                      prefixIcon: const Icon(Icons.email_outlined),
                      hintText: 'Email',
                    ),
                    const SizedBox(height: 15),
                    textField(
                      textEditingController: textPhoneController,
                      prefixIcon: const Icon(Icons.phone),
                      hintText: 'Phone Number',
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
                GestureDetector(
                  onTap: () {
                    HiveService.storeName(textUserController.text);
                    LogService.i(textUserController.toString());
                    HiveService.storeName(textEmailController.text);
                    LogService.i(textEmailController.toString());
                    HiveService.storeName(textPhoneController.text);
                    LogService.i(textPhoneController.toString());
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
                            builder: (_) => const SignInPage(),
                          ),
                        );
                      },
                      child: const Text(
                        "SIGN IN",
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
