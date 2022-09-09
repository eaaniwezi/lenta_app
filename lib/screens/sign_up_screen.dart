// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_local_variable

import 'package:flutter/material.dart';
import '../../const/theme.dart' as style;
import 'package:lenta_app/main_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lenta_app/widgets/button_widget.dart';
import 'package:lenta_app/blocs/register/register_bloc.dart';
import 'package:lenta_app/widgets/text_form_field_widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool isSigningUp = false;
  bool _showPassword = false;
  void _togglevisibility() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }

  final _globalkey = GlobalKey<FormState>();
  final TextEditingController _loginController = TextEditingController();
  final TextEditingController _phoneNoController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocListener<RegisterBloc, RegisterState>(
      listener: (context, state) {
        if (state is RegisteringUserLoading) {
          setState(() {
            isSigningUp = true;
          });
        }
        if (state is RegisteringUserFailure) {
          setState(() {
            isSigningUp = false;
          });
        }
        if (state is RegisteringUserInitial) {
          setState(() {
            isSigningUp = false;
          });
        }
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
            builder: (context) {
              return MainPage();
            },
          ), (route) => false);
      },
      child: Scaffold(
          appBar: _appBar(),
          floatingActionButton: isSigningUp == true
              ? CircularProgressIndicator(color: style.Colors.purpleColor)
              : ButtonWidget(
                  buttonLabel: "Создать аккаунт",
                  onPressed: () {
                    FormState? formState = _globalkey.currentState;
                    if (formState!.validate()) {
                      BlocProvider.of<RegisterBloc>(context).add(SignUpEvent(
                        email: _emailController.text,
                        password: _passwordController.text,
                        nickname: _loginController.text,
                        phone: _phoneNoController.text,
                      ));
                    }
                  },
                ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.miniCenterFloat,
          body: Form(
            key: _globalkey,
            child: Column(
              children: [
                SizedBox(height: size.height * 0.04),
                TextFormFieldWidget(
                  hintText: "Логин",
                  isLast: false,
                  controller: _loginController,
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return "Cant be empty";
                    }
                    return null;
                  },
                ),
                TextFormFieldWidget(
                  hintText: "Телефон",
                  isLast: false,
                  isPhoneNumber: true,
                  controller: _phoneNoController,
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return "Cant be empty";
                    }
                    return null;
                  },
                ),
                TextFormFieldWidget(
                  hintText: "Почта",
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
                    }
                    return null;
                  },
                ),
              ],
            ),
          )),
    );
  }

  _appBar() {
    return AppBar(
      leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new_outlined,
            size: 16,
            color: Colors.black,
          )),
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.white,
      title: Text(
        "Регистрация",
        style: GoogleFonts.manrope(
            fontSize: 15, fontWeight: FontWeight.w500, color: Colors.black),
      ),
    );
  }
}