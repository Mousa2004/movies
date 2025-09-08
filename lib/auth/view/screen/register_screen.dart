import 'package:flutter/material.dart';
import 'package:movies/auth/view/screen/login_screen.dart';
import 'package:movies/auth/view/widget/slider_image.dart';
import 'package:movies/auth/view/widget/switch_language.dart';
import 'package:movies/movies/view/screen/home_screen.dart';
import 'package:movies/shared/view/widget/app_theme.dart';
import 'package:movies/shared/view/widget/customed_button.dart';
import 'package:movies/shared/view/widget/text_field.dart';

class RegisterScreen extends StatefulWidget {
  static const String routName = "/register";
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController repasswordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    repasswordController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(title: Text("Register")),
      body: Column(
        children: [
          SliderImage(onTap: () {}),
          const SizedBox(height: 10),
          Center(
            child: Text(
              "Avatar",
              style: Theme.of(
                context,
              ).textTheme.titleMedium!.copyWith(color: AppTheme.white),
            ),
          ),
          const SizedBox(height: 12),
          Padding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
            child: Column(
              children: [
                CustomTextField(
                  label: "Name",
                  controller: nameController,
                  prefixImage: "person",
                ),
                const SizedBox(height: 24),
                CustomTextField(
                  label: "Email",
                  controller: emailController,
                  prefixImage: "email",
                ),
                const SizedBox(height: 24),
                CustomTextField(
                  label: "Password",
                  controller: passwordController,
                  prefixImage: "password",
                ),
                const SizedBox(height: 24),
                CustomTextField(
                  label: "Confirm Password",
                  controller: repasswordController,
                  prefixImage: "password",
                ),
                const SizedBox(height: 24),
                CustomTextField(
                  label: "Phone Number",
                  controller: phoneController,
                  prefixImage: "phone",
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          CustomedButton(text: "Create Account", onPressed: () {
            Navigator.of(context).pushReplacementNamed(HomeScreen.routName);
          }),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Already Have Account ? ",
                style: Theme.of(
                  context,
                ).textTheme.titleSmall!.copyWith(color: AppTheme.white),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
                  },
                child: Text(
                  "Login",
                  style: Theme.of(
                    context,
                  ).textTheme.titleSmall!.copyWith(color: AppTheme.yellow),
                ),
              ),
            ],
          ),
          SwitchLanguage(onTapArabic: () {}, onTapEnlish: () {}),
        ],
      ),
    );
  }
}
