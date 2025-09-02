import 'package:flutter/material.dart';

class UpdateProfileScreen extends StatefulWidget{
  const UpdateProfileScreen({super.key});

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}
class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text("Pick Avatar"),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
    );
  }
}