import 'package:flutter/material.dart';
import 'package:movies/movies/view/screen/home_screen.dart';
import 'package:movies/shared/view/widget/app_theme.dart';
import 'package:movies/shared/view/widget/customed_button.dart';
import 'package:movies/shared/view/widget/text_field.dart';

class UpdateProfileScreen extends StatefulWidget {
  static const String routeName = "/updateProfile";

  const UpdateProfileScreen({super.key});

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  TextEditingController nameController = TextEditingController(text: "John Safwat");
  TextEditingController phoneController = TextEditingController(text: "01200000000");

  int selectedAvatar = 1;

  List<String> avatars = [
    "avatar1",
    "avatar2",
    "avatar3",
    "avatar4",
    "avatar5",
    "avatar6",
    "avatar7",
    "avatar8",
    "avatar9",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Update Profile"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppTheme.yellow),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                _showAvatarPicker(context);
              },
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage("assets/images/${avatars[selectedAvatar - 1]}.png"),
              ),
            ),
            const SizedBox(height: 20),

            CustomTextField(
              hint: "John Safwat",
              controller: nameController,
              prefixImage: "name_icon",
              fillColor: AppTheme.grey,
            ),
            const SizedBox(height: 16),

            CustomTextField(
              hint: "01200000000",
              controller: phoneController,
              keyboardType: TextInputType.phone,
              prefixImage: "phone",
              fillColor: AppTheme.grey,
            ),
            const SizedBox(height: 16),

            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Reset Password",
                style: Theme.of(context).textTheme.titleMedium?.copyWith(color: AppTheme.white),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomedButton(
              text: "Delete Account",
              colorButton: AppTheme.red,
              colorText: AppTheme.white,
              onPressed: () {},
            ),
            const SizedBox(height: 12),
            CustomedButton(
              text: "Update Data",
              colorButton: AppTheme.yellow,
              colorText: AppTheme.black,
              onPressed: () {
                Navigator.of(context).pushReplacementNamed(HomeScreen.routName);
              },
            ),
          ],
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
            itemCount: avatars.length,
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
                    "assets/images/${avatars[index]}.png",
                    fit: BoxFit.cover,
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
