// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_local_variable

import 'package:flutter/material.dart';
import '../../const/theme.dart' as style;
import 'package:lenta_app/main_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lenta_app/widgets/button_widget.dart';
import 'package:lenta_app/blocs/login/login_bloc.dart';
import 'package:lenta_app/screens/sign_up_screen.dart';
import 'package:lenta_app/widgets/text_form_field_widget.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool isSigningIn = false;
  final _globalkey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        print(state.toString() + " this is the state");
        if (state is UserLoginLoading) {
          setState(() {
            isSigningIn = true;
          });
        }
        if (state is UserLoginFailure) {
          setState(() {
            isSigningIn = false;
          });
        }
        if (state is UserLoginInitial) {
          setState(() {
            isSigningIn = false;
          });
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
            builder: (context) {
              return MainPage();
            },
          ), (route) => false);
        }
      },
      child: Scaffold(
          appBar: _appBar(),
          body: Form(
            key: _globalkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormFieldWidget(
                  hintText: "Логин или почта",
                  isLast: false,
                  controller: _emailController,
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return "Cant be empty";
                    }
                    return null;
                  },
                ),
                TextFormFieldWidget(
                  hintText: "Пароль",
                  isLast: true,
                  controller: _passwordController,
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return "Cant be empty";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 25),
                isSigningIn == true
                    ? CircularProgressIndicator(color: style.Colors.purpleColor)
                    : ButtonWidget(
                        buttonLabel: "Войти",
                        onPressed: () {
                          FormState? formState = _globalkey.currentState;
                          if (formState!.validate()) {
                            BlocProvider.of<LoginBloc>(context).add(SignInEvent(
                              email: _emailController.text,
                              password: _passwordController.text,
                            ));
                          }
                        },
                      ),
                isSigningIn == true
                    ? Text("")
                    : ButtonWidget(
                        buttonLabel: "Зарегистрироваться",
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignUpScreen()));
                        },
                      ),
              ],
            ),
          )),
    );
  }

  _appBar() {
    return AppBar(
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.white,
      title: Text(
        "Авторизация",
        style: GoogleFonts.manrope(
            fontSize: 15, fontWeight: FontWeight.w500, color: Colors.black),
      ),
    );
  }
}
