import 'package:flutter/material.dart';
import 'package:movies/shared/view/widget/app_theme.dart';
import 'package:movies/shared/view/widget/customed_button.dart';
import 'package:movies/shared/view/widget/text_field.dart';
import 'package:movies/shared/view/widget/validation_message.dart';

class ForgetPasswordPage extends StatefulWidget {
  static const String routName = "/ForgetPasswordPage";

  const ForgetPasswordPage({super.key});

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  final TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Forget Password"),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              CustomTextField(
                controller: emailController,
                label: "Email",
                keyboardType: TextInputType.emailAddress,
                prefixImage: "email",
                validator: (val) =>
                    validationMessage(val!, 50, 10, "email"),
              ),
              const SizedBox(height: 30),
              CustomedButton(
                text: "Reset Password",
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    // TODO: Connect with backend API
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Password reset link sent!"),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
