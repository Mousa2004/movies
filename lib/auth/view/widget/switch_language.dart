import 'package:flutter/material.dart';
import 'package:movies/shared/view/widget/app_theme.dart';

class SwitchLanguage extends StatelessWidget {
  final Function() onTapEnlish;
  final Function() onTapArabic;
  const SwitchLanguage({
    super.key,
    required this.onTapEnlish,
    required this.onTapArabic,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 75,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: AppTheme.yellow),
      ),
      child: Row(
        children: [
          InkWell(
            onTap: onTapEnlish,
            child: Image.asset(
              "assets/images/en.png",
              height: 26,
              width: 26,
              fit: BoxFit.scaleDown,
            ),
          ),
          SizedBox(width: 20),
          InkWell(
            onTap: onTapArabic,
            child: Image.asset(
              "assets/images/ar.png",
              height: 26,
              width: 26,
              fit: BoxFit.scaleDown,
            ),
          ),
        ],
      ),
    );
  }
}
