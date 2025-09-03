import 'package:flutter/material.dart';
import 'package:movies/shared/view/widget/app_theme.dart';
import 'package:movies/shared/view/widget/customed_button.dart';

class OnBoardingModel extends StatelessWidget {
  final String imageName;
  final String title;
  final String? description;
  final String textButton;
  final Color? backgroundColor;
  final bool? isContainSecondButton;
  final VoidCallback? next;
  final VoidCallback? back;

  OnBoardingModel({
    super.key,
    required this.imageName,
    required this.title,
    this.description,
    required this.textButton,
    this.backgroundColor = Colors.black,
    this.isContainSecondButton = false,
    this.next,
    this.back,
  });

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    TextTheme textTitle = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Image.asset(
                imageName,
                fit: BoxFit.fill,
                width: double.infinity,
                height: height,
              ),

              SingleChildScrollView(
                child: Container(
                  constraints: BoxConstraints(
                    minHeight: height * 0.20,
                    maxHeight: height * 0.39,
                  ),

                  decoration: BoxDecoration(
                    color: backgroundColor,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(40),
                      topLeft: Radius.circular(40),
                    ),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: height * 0.009),
                      SizedBox.shrink(),
                      Text(
                        title,
                        style: textTitle.displaySmall,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: height * 0.03),
                      SizedBox.shrink(),
                      if (description != null && description!.isNotEmpty)
                        Text(
                          description!,
                          style: textTitle.titleLarge!.copyWith(
                            color: AppTheme.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      SizedBox(height: height * 0.02),
                      SizedBox.shrink(),
                      CustomedButton(text: textButton, onPressed: next),
                      if (isContainSecondButton == true) ...[
                        SizedBox(height: 8),
                        CustomedButton(
                          text: "Back",
                          borderColor: AppTheme.yellow,
                          colorButton: AppTheme.black,
                          colorText: AppTheme.yellow,
                          onPressed: back,
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
