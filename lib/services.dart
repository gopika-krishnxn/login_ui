import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

Future<void> signup({
  required String Username,
  required String Email,
  required String Password,
  required String ConfirmPassword,
  required BuildContext context,
}) async {
  try {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: Email,
      password: Password,
    );
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('Account created successfully')));
  } catch (e) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(e.toString())));
  }
}

Future<void> login({
  required String Email,
  required String Password,
  required BuildContext context,
}) async {
  try {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: Email,
      password: Password,
    );
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('Login successful')));
  } catch (e) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(e.toString())));
  }
}

Future<void> forgot({
  required String Email,
  required BuildContext context,
}) async {
  try {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: Email);
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('Reset link sent to your email')));
  } catch (e) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(e.toString())));
  }
}
