import 'package:flutter/material.dart';
import 'package:movies/auth/view/widget/switch_language.dart';
import 'package:movies/shared/view/widget/app_theme.dart';
import 'package:movies/shared/view/widget/customed_button.dart';
import 'package:movies/shared/view/widget/text_field.dart';

class LoginScreen extends StatefulWidget {
  static const String routName = "/login";
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
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
                child: Column(
                  children: [
                    // Email TextField
                    CustomTextField(
                      keyboardType: TextInputType.emailAddress,
                      label: "Email",
                      controller: emailController,
                      prefixImage: "email",
                    ),
                    const SizedBox(height: 22.5),

                    // Password TextField
                    CustomTextField(
                      keyboardType: TextInputType.visiblePassword,
                      label: "Password",
                      controller: passwordController,
                      prefixImage: "password",
                      isPassword: true,
                    ),
                  ],
                ),
              ),

              // Forget Password
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    "Forget Password ?",
                    style: Theme.of(
                      context,
                    ).textTheme.titleSmall!.copyWith(color: AppTheme.yellow),
                  ),
                ),
              ),
              const SizedBox(height: 33),

              // Login Button
              CustomedButton(text: "Login", onPressed: () {}),
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
                    onTap: () {},
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
