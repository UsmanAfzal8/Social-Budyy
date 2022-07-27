import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:socialbuddy/resources/storagemethod.dart';

class AuthMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future<String> signupUser({
    required String email,
    required String password,
    required String username,
    required String bio,
    required Uint8List file,
  }) async {
    String res = 'Some Error Occured';
    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          username.isNotEmpty ||
          bio.isNotEmpty) {
        UserCredential cer = await _auth.createUserWithEmailAndPassword(
            email: email.toLowerCase().trim(), password: password);
        print(cer.user!.uid);
        String profileimage =
            await Storagemethod().uploadtostorage('profile', file, false);
        await _firestore.collection('users').doc(cer.user!.uid).set({
          'username': username,
          'uid': cer.user!.uid,
          'email': email..toLowerCase().trim(),
          'bio': bio,
          'followers': [],
          'following': [],
          'profilePicture': profileimage,
        });
        res = 'Success';
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-exists') {
        res = 'Email Already Exit';
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  Future<String> Signin({
    required String email,
    required String password,
  }) async {
    String res = 'Some Error Occured';
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        res = 'success';
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        res = 'User Not Found';
      } else if (e.code == 'invalid-email') {
        res = 'invalid email';
      } else if (e.code == 'invalid-password') {
        res = 'invalid password';
      } else {
        res = 'please fill all the fields';
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}
