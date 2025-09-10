import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/auth/cubit/auth_bloc.dart';
import 'package:movies/auth/cubit/auth_state.dart';
import 'package:movies/auth/data/models/login_request.dart';
import 'package:movies/auth/view/screen/forget_password_page.dart';
import 'package:movies/auth/view/screen/register_screen.dart';
import 'package:movies/auth/view/widget/switch_language.dart';
import 'package:movies/movies/view/screen/home_screen.dart';
import 'package:movies/movies/view/screen/update_profile_screen.dart';
import 'package:movies/shared/view/widget/app_theme.dart';
import 'package:movies/shared/view/widget/customed_button.dart';
import 'package:movies/shared/view/widget/dialog_message.dart';
import 'package:movies/shared/view/widget/text_field.dart';
import 'package:movies/shared/view/widget/validation_message.dart';

class LoginScreen extends StatefulWidget {
  static const String routName = "/login";
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Logo (your image)
              Center(
                child: Image.asset(
                  "assets/images/Logo.png",
                  width: 120,
                  height: 120,
                ),
              ),
              const SizedBox(height: 50),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 19),
                child: Form(
                  key: formState,
                  child: Column(
                    children: [
                      // Email TextField
                      CustomTextField(
                        keyboardType: TextInputType.emailAddress,
                        label: "Email",
                        controller: emailController,
                        prefixImage: "email",
                        validator: (val) {
                          return validationMessage(val!, 50, 10, "email");
                        },
                      ),
                      const SizedBox(height: 22.5),

                      // Password TextField
                      CustomTextField(
                        keyboardType: TextInputType.visiblePassword,
                        label: "Password",
                        controller: passwordController,
                        prefixImage: "password",
                        isPassword: true,
                        validator: (val) {
                          return validationMessage(val!, 50, 8, "password");
                        },
                      ),
                    ],
                  ),
                ),
              ),

              // Forget Password
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    if (formState.currentState!.validate()) {
                      Navigator.of(
                        context,
                      ).pushNamed(ForgetPasswordPage.routName);
                    }
                  },
                  child: Text(
                    "Forget Password ?",
                    style: Theme.of(
                      context,
                    ).textTheme.titleSmall!.copyWith(color: AppTheme.yellow),
                  ),
                ),
              ),
              const SizedBox(height: 33),

              BlocConsumer<AuthBloc, AuthState>(
                listener: (context, state) {
                  if (state is LoginError) {
                    DialogMessage.showErrorMessage(state.message);
                  } else if (state is LoginSuccess) {
                    DialogMessage.showSuccessMessage();
                    Navigator.of(
                      context,
                    ).pushReplacementNamed(HomeScreen.routName);
                  }
                },
                builder: (context, state) {
                  return CustomedButton(
                    text: state is LoginLoading ? "Loading..." : "Login",
                    onPressed: state is LoginLoading
                        ? null
                        : () {
                            if (formState.currentState!.validate()) {
                              context.read<AuthBloc>().login(
                                LoginRequest(
                                  email: emailController.text,
                                  password: passwordController.text,
                                ),
                              );
                            }
                          },
                  );
                },
              ),

              const SizedBox(height: 22),

              // Create Account
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't Have Account ?  ",
                    style: Theme.of(
                      context,
                    ).textTheme.titleSmall!.copyWith(color: AppTheme.white),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(
                        context,
                      ).pushReplacementNamed(RegisterScreen.routName);
                    },
                    child: Text(
                      "Create One",
                      style: Theme.of(
                        context,
                      ).textTheme.titleSmall!.copyWith(color: AppTheme.yellow),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 27),

              // OR Divider
              Row(
                children: const [
                  Expanded(child: Divider(color: AppTheme.yellow, indent: 100)),
                  Text("   OR   ", style: TextStyle(color: Colors.yellow)),
                  Expanded(
                    child: Divider(color: AppTheme.yellow, endIndent: 100),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Google Login Button
              CustomedButton(
                text: "Login With Google",
                onPressed: () {},
                imageName: "google",
              ),
              const SizedBox(height: 28),

              // Language Buttons
              SwitchLanguage(onTapEnlish: () {}, onTapArabic: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
