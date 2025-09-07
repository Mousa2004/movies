import 'package:flutter/material.dart';
import 'package:movies/auth/view/widget/slider_image.dart';
import 'package:movies/auth/view/widget/switch_language.dart';
import 'package:movies/shared/view/widget/app_theme.dart';
import 'package:movies/shared/view/widget/customed_button.dart';
import 'package:movies/shared/view/widget/text_field.dart';
import 'package:movies/shared/view/widget/validation_message.dart';

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
  GlobalKey<FormState> formState = GlobalKey<FormState>();
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
      body: SingleChildScrollView(
        child: Column(
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
              child: Form(
                key: formState,
                child: Column(
                  children: [
                    CustomTextField(
                      keyboardType: TextInputType.text,
                      label: "Name",
                      controller: nameController,
                      prefixImage: "person",
                      validator: (val) {
                        return validationMessage(val!, 50, 3, "name");
                      },
                    ),
                    const SizedBox(height: 24),
                    CustomTextField(
                      keyboardType: TextInputType.emailAddress,
                      label: "Email",
                      controller: emailController,
                      prefixImage: "email",
                      validator: (val) {
                        return validationMessage(val!, 50, 10, "email");
                      },
                    ),
                    const SizedBox(height: 24),
                    CustomTextField(
                      keyboardType: TextInputType.visiblePassword,
                      label: "Password",
                      controller: passwordController,
                      prefixImage: "password",
                      isPassword: true,
                      validator: (val) {
                        return validationMessage(val!, 50, 7, "password");
                      },
                    ),
                    const SizedBox(height: 24),
                    CustomTextField(
                      keyboardType: TextInputType.visiblePassword,
                      label: "Confirm Password",
                      controller: repasswordController,
                      prefixImage: "password",
                      isPassword: true,
                      validator: (val) {
                        return validationMessage(val!, 50, 7, "password");
                      },
                    ),
                    const SizedBox(height: 24),
                    CustomTextField(
                      keyboardType: TextInputType.phone,
                      label: "Phone Number",
                      controller: phoneController,
                      prefixImage: "phone",
                      validator: (val) {
                        return validationMessage(val!, 11, 11, "phone");
                      },
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            CustomedButton(
              text: "Create Account",
              onPressed: () {
                if (formState.currentState!.validate()) {}
              },
            ),
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
                  onPressed: () {},
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
      ),
    );
  }
}
