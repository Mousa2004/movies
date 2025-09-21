import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:movies/auth/data/data_sources/image_list_data_sources.dart';
import 'package:movies/auth/data/data_sources/local/auth_sharedprefrences_data_sources.dart';
import 'package:movies/auth/view/screen/login_screen.dart';
import 'package:movies/auth/view/screen/register_screen.dart';
import 'package:movies/home/cubit/delete_profile_bloc.dart';
import 'package:movies/home/cubit/delete_profile_state.dart';
import 'package:movies/home/cubit/reset_password_bloc.dart';
import 'package:movies/home/cubit/reset_password_state.dart';
import 'package:movies/home/cubit/update_profile_bloc.dart';
import 'package:movies/home/cubit/update_profile_state.dart';
import 'package:movies/home/data/models/reset_password_request.dart';
import 'package:movies/home/data/models/update_profile_request.dart';
import 'package:movies/home/view/widget/customed_show_reset_password.dart';
import 'package:movies/movies/bloc/get_profile_bloc.dart';
import 'package:movies/movies/bloc/get_profile_state.dart';
import 'package:movies/movies/data/models/profile_request.dart';
import 'package:movies/shared/view/widget/app_theme.dart';
import 'package:movies/shared/view/widget/customed_button.dart';
import 'package:movies/shared/view/widget/dialog_message.dart';
import 'package:movies/shared/view/widget/text_field.dart';
import 'package:movies/shared/view/widget/validation_message.dart';

class UpdateProfileScreen extends StatefulWidget {
  final ProfileRequest profileRequest;

  const UpdateProfileScreen({super.key, required this.profileRequest});

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();

  GlobalKey<FormState> formState = GlobalKey<FormState>();

  GoogleSignIn _googleSignIn = GoogleSignIn();

  int selectedAvatar = 1;
  @override
  void initState() {
    nameController.text = widget.profileRequest.name!;
    phoneController.text = widget.profileRequest.phone!;
    selectedAvatar = widget.profileRequest.avaterId!;
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    oldPasswordController.dispose();
    newPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => ResetPasswordBloc()),
          BlocProvider(create: (context) => UpdateProfileBloc()),
          BlocProvider(create: (context) => DeleteProfileBloc()),
        ],
        child: Builder(
          builder: (innerContext) {
            return Scaffold(
              appBar: AppBar(
                title: Text("Update Profile"),
                actions: [
                  IconButton(
                    onPressed: () async {
                      _googleSignIn.disconnect();
                      await FirebaseAuth.instance.signOut();
                      Navigator.of(
                        context,
                      ).pushReplacementNamed(LoginScreen.routName);
                    },
                    icon: Icon(Icons.exit_to_app),
                  ),
                ],
              ),
              body: SingleChildScrollView(
                padding: EdgeInsets.all(16),
                child: Form(
                  key: formState,
                  child: Column(
                    children: [
                      BlocBuilder<GetProfileBloc, GetProfileState>(
                        builder: (context, state) {
                          if (state is GetProfileError) {
                            return Center(
                              child: Text(
                                state.message,
                                style: Theme.of(
                                  context,
                                ).textTheme.headlineSmall,
                              ),
                            );
                          } else if (state is GetProfileSuccess) {
                            return Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    _showAvatarPicker(innerContext);
                                  },
                                  child: CircleAvatar(
                                    radius: 50,
                                    backgroundImage: AssetImage(
                                      imageAvatarList[selectedAvatar - 1]
                                          .imageName,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 20),

                                CustomTextField(
                                  keyboardType: TextInputType.text,
                                  controller: nameController,
                                  prefixImage: "name_icon",
                                  fillColor: AppTheme.grey,
                                  validator: (val) {
                                    return validationMessage(
                                      val!,
                                      50,
                                      3,
                                      "name",
                                    );
                                  },
                                ),
                                const SizedBox(height: 16),

                                CustomTextField(
                                  controller: phoneController,
                                  keyboardType: TextInputType.phone,
                                  prefixImage: "phone",
                                  fillColor: AppTheme.grey,
                                  validator: (val) {
                                    return validationMessage(
                                      val!,
                                      13,
                                      11,
                                      "phone",
                                    );
                                  },
                                ),
                              ],
                            );
                          }
                          return SizedBox();
                        },
                      ),
                      const SizedBox(height: 16),

                      Align(
                        alignment: Alignment.centerLeft,
                        child: InkWell(
                          onTap: () {
                            showModalBottomSheet(
                              backgroundColor: AppTheme.transparent,
                              context: innerContext,
                              builder: (sheetContext) {
                                return BlocProvider.value(
                                  value: innerContext.read<ResetPasswordBloc>(),
                                  child:
                                      BlocConsumer<
                                        ResetPasswordBloc,
                                        ResetPasswordState
                                      >(
                                        listener: (context, state) {
                                          if (state is ResetPasswordError) {
                                            DialogMessage.showErrorMessage(
                                              state.message,
                                            );
                                          } else if (state
                                              is ResetPasswordSuccess) {
                                            DialogMessage.showSuccessMessage(
                                              "Your password has been reset successfully.",
                                            );
                                            Navigator.of(context).pop();
                                          }
                                        },
                                        builder: (context, state) {
                                          return CustomedShowResetPassword(
                                            oldPasswordController:
                                                oldPasswordController,
                                            newPasswordController:
                                                newPasswordController,
                                            textButton:
                                                state is ResetPasswordLoading
                                                ? "Loading..."
                                                : "Reset Password",
                                            onPressed:
                                                state is ResetPasswordLoading
                                                ? null
                                                : () {
                                                    context
                                                        .read<
                                                          ResetPasswordBloc
                                                        >()
                                                        .resetPassword(
                                                          ResetPasswordRequest(
                                                            oldPassword:
                                                                oldPasswordController
                                                                    .text,
                                                            newPassword:
                                                                newPasswordController
                                                                    .text,
                                                          ),
                                                        );
                                                  },
                                          );
                                        },
                                      ),
                                );
                              },
                            );
                          },
                          child: Text(
                            "Reset Password",
                            style: Theme.of(context).textTheme.titleMedium
                                ?.copyWith(color: AppTheme.white),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              ),

              bottomNavigationBar: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    BlocConsumer<DeleteProfileBloc, DeleteProfileState>(
                      listener: (context, state) {
                        if (state is DeleteProfileError) {
                          DialogMessage.showErrorMessage(state.message);
                        } else if (state is DeleteProfileSuccess) {
                          DialogMessage.showSuccessMessage(
                            "Profile delete successfully",
                          );
                          Navigator.of(context).pushNamedAndRemoveUntil(
                            RegisterScreen.routName,
                            (route) => false,
                          );
                        }
                      },
                      builder: (context, state) {
                        return CustomedButton(
                          text: state is DeleteProfileLoading
                              ? "Loading..."
                              : "Delete Account",
                          colorButton: AppTheme.red,
                          colorText: AppTheme.white,
                          onPressed: state is DeleteProfileLoading
                              ? null
                              : () async {
                                  context
                                      .read<DeleteProfileBloc>()
                                      .deleteProfile();
                                  final deleteToken =
                                      AuthSharedprefrencesDataSources();
                                  await deleteToken.clearToken();
                                },
                        );
                      },
                    ),
                    const SizedBox(height: 12),

                    BlocConsumer<UpdateProfileBloc, UpdateProfileState>(
                      listener: (context, state) {
                        if (state is UpdateProfileError) {
                          DialogMessage.showErrorMessage(state.message);
                        } else if (state is UpdateProfileSuccess) {
                          DialogMessage.showSuccessMessage(
                            "Profile update successfully",
                          );
                          Navigator.of(context).pop(true);
                        }
                      },
                      builder: (context, state) {
                        return CustomedButton(
                          text: state is UpdateProfileLoading
                              ? "Loading..."
                              : "Update Data",
                          colorButton: AppTheme.yellow,
                          colorText: AppTheme.black,
                          onPressed: state is UpdateProfileLoading
                              ? null
                              : () {
                                  if (formState.currentState!.validate()) {
                                    context
                                        .read<UpdateProfileBloc>()
                                        .updateProfile(
                                          UpdateProfileRequest(
                                            avaterId: selectedAvatar,
                                            name: nameController.text,
                                            phone: phoneController.text,
                                          ),
                                        );
                                  }
                                },
                        );
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void _showAvatarPicker(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: AppTheme.black,
      context: context,
      builder: (_) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: GridView.builder(
            shrinkWrap: true,
            itemCount: imageAvatarList.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
            ),
            itemBuilder: (context, index) {
              bool isSelected = selectedAvatar == index + 1;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedAvatar = index + 1;
                  });
                  Navigator.pop(context);
                },
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: isSelected ? AppTheme.yellow : Colors.transparent,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Image.asset(
                    imageAvatarList[index].imageName,
                    fit: BoxFit.fill,
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
