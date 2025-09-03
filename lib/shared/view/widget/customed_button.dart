import 'package:flutter/material.dart';
import 'package:movies/shared/view/widget/app_theme.dart';

class CustomedButton extends StatelessWidget {
  final String text;
  final String? imageName;
  final Color? colorButton;
  final Color? colorText;
  final Color? borderColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final void Function()? onPressed;

  const CustomedButton({
    super.key,
    required this.text,
    this.imageName,
    this.onPressed,
    this.colorButton,
    this.colorText,
    this.fontSize,
    this.fontWeight,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5),
      margin: EdgeInsets.symmetric(horizontal: 19),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: colorButton ?? AppTheme.yellow,
        border: Border.all(color: borderColor ?? Colors.transparent),
      ),
      child: MaterialButton(
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            imageName == null
                ? SizedBox()
                : Image.asset(
                    "assets/images/$imageName.png",
                    height: 26,
                    width: 26,
                    fit: BoxFit.scaleDown,
                  ),
            SizedBox(width: 8),
            Text(
              text,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: colorText ?? AppTheme.black,
                fontSize: fontSize ?? 16,
                fontWeight: fontWeight ?? FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
