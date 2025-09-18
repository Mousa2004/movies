import 'package:flutter/material.dart';
import 'package:movies/shared/view/widget/app_theme.dart';
import 'package:movies/shared/view/widget/customed_button.dart';
import 'package:movies/shared/view/widget/text_field.dart';
import 'package:movies/shared/view/widget/validation_message.dart';

class ForgetPasswordPage extends StatefulWidget {
  static const String routName = "/forgetpassword";
  const ForgetPasswordPage({super.key});

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  TextEditingController emailController = TextEditingController();
  GlobalKey<FormState> formState = GlobalKey();
  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Forget Password")),
      body: Column(
        children: [
          Image.asset(
            "assets/images/Forgot_password-bro 1.png",
            width: double.infinity,
            height: MediaQuery.sizeOf(context).height * 0.4,

            fit: BoxFit.fill,
          ),
          Form(
            key: formState,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: CustomTextField(
                keyboardType: TextInputType.emailAddress,
                label: "Email",
                controller: emailController,
                prefixImage: "email",
                validator: (val) {
                  return validationMessage(val!, 50, 10, "email");
                },
              ),
            ),
          ),
          const SizedBox(height: 24),
          CustomedButton(
            text: "Verify Email",
            fontSize: 20,
            colorText: AppTheme.black,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
