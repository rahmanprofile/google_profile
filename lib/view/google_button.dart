import 'package:authentication/model/authentication.dart';
import 'package:flutter/material.dart';

import '../model/auth_service.dart';

class GoogleButton extends StatefulWidget {
  const GoogleButton({Key? key}) : super(key: key);

  @override
  State<GoogleButton> createState() => _GoogleButtonState();
}

class _GoogleButtonState extends State<GoogleButton> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Center(
        child: InkWell(
          onTap: () {
            AuthenticationServices.signInWithGoogle(context: context);
          } ,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 50.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.blue, borderRadius: BorderRadius.circular(8.0)),
                  child: const Center(
                    child: Text(
                      "Google SignIn",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Register with Google Account",
                  style: TextStyle(color: Colors.black54, fontSize: 15),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
