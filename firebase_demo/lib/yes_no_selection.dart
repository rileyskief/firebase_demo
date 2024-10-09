import 'package:flutter/material.dart';

import 'app_state.dart';
import 'src/widgets.dart';
import 'package:flutter/services.dart'; 
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart'
    hide EmailAuthProvider, PhoneAuthProvider;
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'firebase_options.dart';

class YesOrNo extends StatelessWidget {
  YesOrNo(
      {super.key});
  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(child:
              TextField(
                controller: myController,
                keyboardType: TextInputType.number, 
                  inputFormatters: <TextInputFormatter>[ 
                    FilteringTextInputFormatter.digitsOnly 
                  ],
              ),
              ),
              const SizedBox(width: 8),
              TextButton(
                child: const Text('Enter'),
                onPressed: () => updateBase(int.parse(myController.text)), 
              ),
            ],
          ),
        );
  }
   void updateBase(int atendeeNum){
    final userDoc = FirebaseFirestore.instance
        .collection('attendees')
        .doc(FirebaseAuth.instance.currentUser!.uid);
      userDoc.set(<String, dynamic>{'attending': atendeeNum});
   }
}