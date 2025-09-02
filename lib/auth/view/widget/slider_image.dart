import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movies/auth/data/data_sources/image_list_data_sources.dart';

class SliderImage extends StatelessWidget {
  final void Function() onTap;
  const SliderImage({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      options: CarouselOptions(
        height: 150,
        viewportFraction: 0.35,
        enlargeCenterPage: true,
        enlargeFactor: 0.45,
      ),
      itemCount: imageAvatarList.length,
      itemBuilder: (BuildContext context, int itemIndex, _) => InkWell(
        onTap: onTap,
        child: Image.asset(
          imageAvatarList[itemIndex].imageName,
          height: 161,
          width: 158,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
