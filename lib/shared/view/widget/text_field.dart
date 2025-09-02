import 'package:flutter/material.dart';
import 'package:movies_app/shared/view/widget/app_theme.dart';

class CustomTextField extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  final bool isPassword;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final IconData? prefixIcon;
  final String? prefixImage;
  final Color? fillColor;
  final Widget? suffixIcon;

  const CustomTextField({
    super.key,
    required this.label,
    required this.controller,
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.prefixIcon,
    this.prefixImage,
    this.fillColor,
    this.suffixIcon,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscure = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style:
          Theme.of(
            context,
          ).textTheme.titleMedium?.copyWith(color: AppTheme.white) ??
          const TextStyle(color: AppTheme.white),
      cursorColor: AppTheme.white,
      controller: widget.controller,
      obscureText: widget.isPassword ? _obscure : false,
      keyboardType: widget.keyboardType,
      validator: widget.validator,
      decoration: InputDecoration(
        labelText: widget.label,
        labelStyle: Theme.of(
          context,
        ).textTheme.titleMedium?.copyWith(color: AppTheme.white),
        filled: true,
        fillColor: widget.fillColor ?? AppTheme.grey,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        prefixIcon:
            widget.prefixImage != null
                ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 24,
                    height: 24,
                    child: Image.asset(
                      'assets/images/${widget.prefixImage}.png',
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                )
                : (widget.prefixIcon != null
                    ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(widget.prefixIcon, size: 24),
                    )
                    : null),
        suffixIcon:
            widget.isPassword
                ? IconButton(
                  icon: Icon(
                    _obscure ? Icons.visibility_off : Icons.visibility,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscure = !_obscure;
                    });
                  },
                )
                : widget.suffixIcon,
      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onTapOutside: (_) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
    );
  }
}
