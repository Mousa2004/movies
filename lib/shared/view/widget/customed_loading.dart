import 'package:flutter/material.dart';
import 'package:movies/shared/view/widget/app_theme.dart';

class CustomedLoading extends StatelessWidget {
  const CustomedLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withValues(alpha: 0.4),
      child: Center(child: CircularProgressIndicator(color: AppTheme.yellow)),
    );
  }
}
