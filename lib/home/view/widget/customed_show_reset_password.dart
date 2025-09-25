import 'package:flutter/material.dart';
import 'package:movies/shared/view/widget/app_theme.dart';
import 'package:movies/shared/view/widget/customed_button.dart';
import 'package:movies/shared/view/widget/text_field.dart';
import 'package:movies/shared/view/widget/validation_message.dart';

class CustomedShowResetPassword extends StatelessWidget {
  final TextEditingController oldPasswordController;
  final TextEditingController newPasswordController;
  final String textButton;
  final void Function()? onPressed;
  const CustomedShowResetPassword({
    super.key,
    required this.oldPasswordController,
    required this.newPasswordController,
    required this.textButton,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 16),
      height: MediaQuery.sizeOf(context).height * 0.3,
      margin: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.grey,

        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: CustomTextField(
              fillColor: AppTheme.black,
              keyboardType: TextInputType.visiblePassword,
              label: "Old password",
              controller: oldPasswordController,
              prefixImage: "password",
              isPassword: true,
              validator: (val) {
                return validationMessage(val!, 50, 8, "password");
              },
            ),
          ),
          SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: CustomTextField(
              fillColor: AppTheme.black,
              keyboardType: TextInputType.visiblePassword,
              label: "New password",
              controller: newPasswordController,
              prefixImage: "password",
              isPassword: true,
              validator: (val) {
                return validationMessage(val!, 50, 8, "password");
              },
            ),
          ),
          SizedBox(height: 25),
          CustomedButton(text: textButton, onPressed: onPressed),
        ],
      ),
    );
  }
}
