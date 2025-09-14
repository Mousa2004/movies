import 'package:flutter/material.dart';
import 'package:movies/shared/view/widget/app_theme.dart';

class CustomedEvaluation extends StatelessWidget {
  final String imageName;
  final String textNumber;

  const CustomedEvaluation({
    super.key,
    required this.imageName,
    required this.textNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      height: 47,
      width: 122,
      decoration: BoxDecoration(
        color: AppTheme.grey,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Image.asset("assets/images/$imageName.png", height: 28, width: 25),
          SizedBox(width: 14),
          Text(
            textNumber,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: AppTheme.white,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
