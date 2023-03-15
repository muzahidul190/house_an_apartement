
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:house_an_apartement/firebase/form_Page.dart';


import 'package:house_an_apartement/firebase/image.dart';

import 'package:house_an_apartement/firebase/profile.dart';
import 'package:house_an_apartement/firebase/test.dart';

import 'package:house_an_apartement/firebase/widget.dart';
import 'package:house_an_apartement/screen/home/widget/allpost.dart';
import 'package:house_an_apartement/screen/home/widget/categories.dart';
import 'package:house_an_apartement/screen/home/widget/search_input.dart';
import 'package:house_an_apartement/screen/home/widget/welcome_text.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatelessWidget {

  Future<String?> _loadImage() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('imageUrl');
  }
  
  final FirebaseAuth currentUser = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {

    bool someCondition = false;

    
    return WillPopScope(
      onWillPop: () async {
        // Do some logic here to determine whether or not to allow the pop
        if (someCondition) {
          return true; // Allow the pop to occur
        } else {
          return false; // Prevent the pop
        }
      },
      child:
    Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      drawer: const Logout(),
      appBar: AppBar(
        backgroundColor: Colors.purple,
        actions: [
          // FutureBuilder<String?>(
          //   future: _loadImage(),
          //   builder: (context, snapshot) {
          //     if (snapshot.connectionState == ConnectionState.done &&
          //         snapshot.data != null) {
          //       return CircleAvatar(
          //         radius: 28,
          //         backgroundImage: NetworkImage(snapshot.data!),
          //         child: GestureDetector(
          //           onTap: () {
          //             Navigator.push(
          //               context,
          //               MaterialPageRoute(
          //                   builder: (context) => const Profile_Page()),
          //             );
          //           },
          //         ),
          //       );
          //     } else {
          //       return const Center(child: CircularProgressIndicator());
          //     }
          //   },
          // )
        ],
      ),
      body: 
         SafeArea(
           child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const WelcomeText(),
                // SearchPage(),
                // AllPost(),
                // Near_you(),
              ],
            ),
                 ),
         ),
      
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            heroTag: 'add',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Form_Page()),
              );
            },
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            heroTag: 'message',
            onPressed: () {
              Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AvatarScreen()),
                  );
            },
            child: const Icon(Icons.message_outlined),
          ),
        ],
      ),
    ),
    );
  }
}
