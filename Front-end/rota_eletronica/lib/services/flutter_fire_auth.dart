import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// import '../models/user_data.dart';

class FlutterFireAuth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<String?> cadastrarUsuario(
      {required String nome,
      required String email,
      required String senha}) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: senha);

      await userCredential.user!.updateDisplayName(nome);
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "email-already-in-use":
          return "O e-mail já está em uso.";
      }
      return e.code;
    }

    return null;
  }
}
