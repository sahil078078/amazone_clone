import 'package:amazone_clone/commons/widgets/custom_button.dart';
import 'package:amazone_clone/commons/widgets/custom_textfield.dart';
import 'package:amazone_clone/constants/global_variable.dart';
import 'package:flutter/cupertino.dart';
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

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _mobileNumber = TextEditingController();

  // delete / dispose all controller for allocate space

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _mobileNumber.dispose();
    super.dispose();
  }

  bool obscureTextPassword = true;
  IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariable.greyBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome',
                  style: GoogleFonts.poppins(
                    fontSize: 23,
                    fontWeight: FontWeight.w500,
                    color: Colors.black.withOpacity(0.62),
                  ),
                ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    'Create Account',
                    style: GoogleFonts.nunito(
                      fontSize: 18,
                    ),
                  ),
                  leading: Radio(
                    activeColor: GlobalVariable.secondaryColor.withOpacity(0.7),
                    onChanged: (Auth? val) {
                      setState(() {
                        _auth = val!;
                      });
                      // log('$val');
                    },
                    value: Auth.signup,
                    groupValue: _auth,
                  ),
                ),
                if (_auth == Auth.signup)
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.0235),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.only(
                      bottom: 10,
                      top: 10,
                      left: 8,
                      right: 8,
                    ),
                    child: Form(
                      key: _signUpFormKey,
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        child: Column(
                          children: [
                            CustomTextField(
                              controller: _nameController,
                              hindText: 'Enter user name',
                              lableText: 'Name',
                              prefixIcon: const Icon(
                                CupertinoIcons.person,
                                color: GlobalVariable.secondaryColor,
                              ),
                              maxLength: 20,

                              // here below inputFormatters user will input only capital latters and small latters only

                              // inputFormatters: [
                              //   FilteringTextInputFormatter.allow(
                              //     RegExp("[a-z A-Z]"),
                              //   ),
                              // ],

                              keyboardType: TextInputType.text,
                              validator: (value) {
                                Pattern pattern =
                                    (r'[!@#<>?":_`~;[\]\\|=+)(*&^%0-9-]');
                                RegExp regExp = RegExp(pattern.toString());
                                if (value == null || value.isEmpty) {
                                  return 'Please enter name';
                                } else if (value.trim().contains(regExp)) {
                                  return 'Please enter valid name ';
                                } else {
                                  return null;
                                }
                              },
                            ),
                            CustomTextField(
                              controller: _mobileNumber,
                              lableText: 'Mobile',
                              hindText: 'Enter mobile number',
                              prefixIcon: const Icon(
                                Icons.phone_android,
                                color: GlobalVariable.secondaryColor,
                              ),
                            ),
                            CustomTextField(
                              controller: _emailController,
                              hindText: 'Enter email',
                              lableText: 'Email',
                              prefixIcon: const Icon(
                                CupertinoIcons.mail,
                                color: GlobalVariable.secondaryColor,
                              ),
                            ),
                            CustomTextField(
                              controller: _passwordController,
                              hindText: 'Enter password',
                              lableText: 'Password',
                              obscureText: obscureTextPassword,
                              prefixIcon: const Icon(
                                CupertinoIcons.lock_shield,
                                color: GlobalVariable.secondaryColor,
                              ),
                              suffixIcon: GestureDetector(
                                onTap: () => setState(() {
                                  obscureTextPassword = !obscureTextPassword;
                                }),
                                child: obscureTextPassword
                                    ? Icon(
                                        CupertinoIcons.eye,
                                        color: GlobalVariable.secondaryColor
                                            .withOpacity(0.5),
                                      )
                                    : Icon(
                                        CupertinoIcons.eye_slash,
                                        color: GlobalVariable.secondaryColor
                                            .withOpacity(0.7),
                                      ),
                              ),
                            ),
                            CustomButtom(
                              buttonText: 'Sign Up',
                              buttonColor: GlobalVariable.secondaryColor
                                  .withOpacity(0.8),
                              onPressed: () {
                                if (_signUpFormKey.currentState!.validate()) {
                                  _signUpFormKey.currentState!.save();
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    'Sign In',
                    style: GoogleFonts.nunito(
                      fontSize: 18,
                    ),
                  ),
                  leading: Radio(
                    activeColor: GlobalVariable.secondaryColor.withOpacity(0.7),
                    onChanged: (Auth? val) {
                      setState(() {
                        _auth = val!;
                      });
                      // log('$val');
                    },
                    value: Auth.signin,
                    groupValue: _auth,
                  ),
                ),
                if (_auth == Auth.signin)
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.0235),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.only(
                      bottom: 10,
                      top: 10,
                      left: 8,
                      right: 8,
                    ),
                    child: Form(
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Column(
                          children: const [
                            Text('bhuro'),
                          ],
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
