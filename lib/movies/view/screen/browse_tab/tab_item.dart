import 'package:flutter/material.dart';
import 'package:movies/shared/view/widget/app_theme.dart';

class TabItem extends StatelessWidget {
  String label;
  bool isSelected;
  Color selectedForegroundColor;
  Color unselectedForegroundColor;
  Color selectedBackgroundColor;

  TabItem({
    required this.label,
    required this.isSelected,
    required this.selectedForegroundColor,
    required this.unselectedForegroundColor,
    required this.selectedBackgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: isSelected ? selectedBackgroundColor : Colors.black,
        borderRadius: BorderRadius.circular(46),
        border: isSelected ? null : Border.all(color: AppTheme.yellow),
      ),
      child: Text(
        label,
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
          color: isSelected
              ? selectedForegroundColor
              : unselectedForegroundColor,
        ),
      ),
    );
  }
}