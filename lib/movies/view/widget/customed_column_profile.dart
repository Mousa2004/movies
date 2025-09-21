import 'package:flutter/material.dart';
import 'package:movies/shared/view/widget/app_theme.dart';

class CustomedColumnProfile extends StatelessWidget {
  final String number;
  final String text;
  const CustomedColumnProfile({
    super.key,
    required this.number,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          number,
          style: Theme.of(
            context,
          ).textTheme.displaySmall!.copyWith(fontWeight: FontWeight.w700),
        ),
        SizedBox(height: 20),
        Text(
          text,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
            color: AppTheme.white,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
