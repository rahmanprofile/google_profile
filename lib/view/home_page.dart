import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  User? user;
  final system = const SystemUiOverlayStyle(statusBarColor: Colors.transparent);
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(system);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: const Text("Profile"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           user != null ? Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(100),
                border: Border.all(color: Colors.grey,width: 2),
                image: DecorationImage(
                  image: AssetImage(FirebaseAuth.instance.currentUser!.photoURL!.toString())
                ),
              ),
            ) : Container(
             height: 120,
             width: 120,
             decoration: BoxDecoration(
               color: Colors.transparent,
                 border: Border.all(color: Colors.grey,width: 2),
               borderRadius: BorderRadius.circular(100)
             ),
             child:const Center(
               child: Icon(CupertinoIcons.person,size: 40,),
             ),
           ) ,

            const SizedBox(height: 20.0),
             Text(
              "Name : ${FirebaseAuth.instance.currentUser!.displayName}",
              style:const TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                  fontWeight: FontWeight.w500),
            ),
             const SizedBox(height: 5.0),
             Text(
              "Email : ${FirebaseAuth.instance.currentUser!.email}",
              style:const TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
