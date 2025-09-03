import 'package:flutter/material.dart';
import 'package:movies/shared/view/widget/customed_button.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});
  static const String forgetRoutName = "/forget";

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text("Forget Password"),),
      body: Column(children: [
        Image.asset("assets/Forgot password-bro 1.png"),
        SizedBox(height: 10,),
        TextField(),
        SizedBox(height: 10,),
        CustomedButton(text: "Verify Email")

      ],),
    );
  }
}
