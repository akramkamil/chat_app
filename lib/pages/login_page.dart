import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:scholar_chat/constants.dart';
import 'package:scholar_chat/pages/chat_page.dart';
import 'package:scholar_chat/pages/register_page.dart';
import 'package:scholar_chat/widgets/custom_button.dart';
import 'package:scholar_chat/widgets/custom_text_field.dart';

import '../helper/show_snack_bar.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  static String id= 'Login Page';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? email, password;

  bool isLoading =false ;

  GlobalKey<FormState> formKey= GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                children: [
                  const SizedBox(height: 74,),
                  Image.asset(klogo, height: 100,),
                  const Text(
                    'Scholar Chat',
                    style: TextStyle(
                        fontSize: 32, fontFamily: 'Pacifico', color: Colors.white),
                  ),
                  const SizedBox(height: 74,),
                  
                  const Row(
                    children: [
                      Text(
                        'Sign in',
                        style: TextStyle(fontSize: 24, color: Colors.white),
                      ),
                    ],
                  ),
                  CustomFormTextField(
                    hintText: 'Email',
                    onChange: (data){
                      email=data;
                    },
                  ),
                  CustomFormTextField(
                    hintText: 'Password',
                    onChange: (data){
                      password=data;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomButton(text: 'sign in',
                  onTap: () async {
                    if(formKey.currentState!.validate()){

                      try {
                        LoginUser();
                        Navigator.pushNamed(context, ChatPage.id);
                      } on FirebaseAuthException catch (e) {
                            if (e.code == 'weak-password') {
                              showSnackBar(context, 'weak password');
                            } else if (e.code == 'email-already-in-use') {
                              showSnackBar(context, 'This email has alredy used');
                            }
                          } catch (e) {
                            showSnackBar(context, 'there was an error');
                          }
                    }
                  },),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Don\'t have an account? ',
                        style: TextStyle(color: Colors.white),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, RegisterPage.id);
                        },
                        child: const Text(
                          ' Sign up',
                          style: TextStyle(
                            color: Color(0xffC7EDEF),
                          ),
                        ),
                      )
                    ],
                  ),
                  
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Future <void> LoginUser() async{
  // ignore: unused_local_variable
  UserCredential user = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email!, password: password!);
}
}

