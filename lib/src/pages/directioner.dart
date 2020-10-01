import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:noteslist/src/pages/login_form.dart';
import 'package:provider/provider.dart';
import 'home.dart';

class Directioner extends StatelessWidget {
  const Directioner({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final usuario = Provider.of<FirebaseUser>(context);

    return usuario == null ? LoginForm() : Home();
  }
}
