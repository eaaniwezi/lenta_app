// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_local_variable

import 'package:auto_route/auto_route.dart';
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
  bool _showPassword = false;
  void _togglevisibility() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }

  final _globalkey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final router = AutoRouter.of(context);
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
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
          router.replaceNamed('/main-page');
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
                  seePassword: () => _togglevisibility(),
                  suffixIconSvg: _showPassword
                      ? "assets/visibility_on.svg"
                      : "assets/visibility_off.svg",
                  isPassword: true,
                  obscureText: !_showPassword,
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return "Cant be empty";
                    } else if (value.length < 8) {
                      return "Password must be at least 8 characters long";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 25),
                _errorMessage(),
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
                          router.pushNamed('/sign-up');
                        },
                      ),
              ],
            ),
          )),
    );
  }

  _errorMessage() {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        if (state is UserLoginFailure) {
          return Text(
            "Error signing in",
            style: GoogleFonts.manrope(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: style.Colors.redColor,
            ),
          );
        }
        return Text("");
      },
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
