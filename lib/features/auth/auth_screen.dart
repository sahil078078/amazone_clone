import 'dart:developer';

import 'package:amazone_clone/constants/global_variable.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum Auth { signin, signup }

class AuthScreen extends StatefulWidget {
  static const String routeName = '/auth_screen';
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Auth _auth = Auth.signup;
  final _signUpFormKey = GlobalKey<FormState>();
  // final _signInFromKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariable.greyBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          child: Column(
            children: [
              Text(
                'Welcome',
                style: GoogleFonts.nunito(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),
              ),
              ListTile(
                title: Text(
                  'Create Account',
                  style: GoogleFonts.nunito(
                    fontSize: 18,
                  ),
                ),
                leading: Radio(
                  activeColor: GlobalVariable.secondaryColor,
                  onChanged: (Auth? val) {
                    setState(() {
                      _auth = val!;
                    });
                    log('$val');
                  },
                  value: Auth.signup,
                  groupValue: _auth,
                ),
              ),
              if (_auth == Auth.signup)
                Form(
                  key: _signUpFormKey,
                  child: Column(
                    children: const [
                      Text('SignUp Field'),
                    ],
                  ),
                ),
              ListTile(
                title: Text(
                  'SignIN',
                  style: GoogleFonts.nunito(
                    fontSize: 18,
                  ),
                ),
                leading: Radio(
                  activeColor: GlobalVariable.secondaryColor,
                  onChanged: (Auth? val) {
                    setState(() {
                      _auth = val!;
                    });
                    log('$val');
                  },
                  value: Auth.signin,
                  groupValue: _auth,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
