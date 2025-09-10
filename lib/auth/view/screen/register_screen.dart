import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/auth/cubit/auth_bloc.dart';
import 'package:movies/auth/cubit/auth_state.dart';
import 'package:movies/auth/data/models/register_request.dart';
import 'package:movies/auth/view/screen/login_screen.dart';
import 'package:movies/auth/view/widget/slider_image.dart';
import 'package:movies/auth/view/widget/switch_language.dart';
import 'package:movies/movies/view/screen/home_screen.dart';
import 'package:movies/shared/view/widget/app_theme.dart';
import 'package:movies/shared/view/widget/customed_button.dart';
import 'package:movies/shared/view/widget/dialog_message.dart';
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
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  int? selectAvatar;
  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Register")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SliderImage(
              onTap: (id) {
                setState(() {
                  selectAvatar = id;
                });
              },
            ),
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
              padding: EdgeInsets.symmetric(horizontal: 16),
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
                        return validationMessage(val!, 50, 8, "password");
                      },
                    ),
                    const SizedBox(height: 24),
                    CustomTextField(
                      keyboardType: TextInputType.visiblePassword,
                      label: "Confirm Password",
                      controller: confirmPasswordController,
                      prefixImage: "password",
                      isPassword: true,
                      validator: (val) {
                        return validationMessage(
                          val!,
                          50,
                          8,
                          "confirmPassword",
                          originalPassword: passwordController.text,
                        );
                      },
                    ),

                    const SizedBox(height: 24),
                    CustomTextField(
                      keyboardType: TextInputType.phone,
                      label: "Phone Number",
                      controller: phoneController,
                      prefixImage: "phone",
                      validator: (val) {
                        return validationMessage(val!, 13, 11, "phone");
                      },
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            BlocConsumer<AuthBloc, AuthState>(
              listener: (context, state) {
                if (state is RegisterError) {
                  DialogMessage.showErrorMessage(state.message);
                } else if (state is RegisterSuccess) {
                  DialogMessage.showSuccessMessage();
                  Navigator.of(
                    context,
                  ).pushReplacementNamed(HomeScreen.routName);
                }
              },
              builder: (context, state) {
                return CustomedButton(
                  text: state is RegisterLoading
                      ? "Loading..."
                      : "Create Account",
                  onPressed: state is RegisterLoading
                      ? null
                      : () {
                          if (formState.currentState!.validate()) {
                            if (selectAvatar == null) {
                              return DialogMessage.showErrorMessage(
                                "Please select your avatar",
                              );
                            }
                            context.read<AuthBloc>().register(
                              RegisterRequest(
                                name: nameController.text,
                                email: emailController.text,
                                password: passwordController.text,
                                confirmPassword: confirmPasswordController.text,
                                phone: phoneController.text,
                                avaterId: selectAvatar!,
                              ),
                            );
                          }
                        },
                );
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
                  onPressed: () {
                    Navigator.of(
                      context,
                    ).pushReplacementNamed(LoginScreen.routName);
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
      ),
    );
  }
}
