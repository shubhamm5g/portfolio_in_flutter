import 'package:flutter/material.dart';

import '../consts/consts.dart';

class MainMobile extends StatelessWidget {
  const MainMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 40),
      height: screenWidth,
      constraints: BoxConstraints(minHeight: 560),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.center,
            child: ShaderMask(
              shaderCallback: (bounds) {
                return LinearGradient(colors: [
                  CustomColors.scaffoldBg.withOpacity(0.2),
                  CustomColors.scaffoldBg.withOpacity(0.6)
                ]).createShader(bounds);
              },
              blendMode: BlendMode.srcATop,
              child: Image.asset(
                "assets/images/home_image.png",
                width: screenWidth / 3,
              ),
            ),
          ),
          SizedBox(height: 80),
          const Text(
            "Hi,\nI'm Shubham Mauya\nA Flutter Developer",
            style: TextStyle(
                fontSize: 24,
                height: 1.5,
                fontWeight: FontWeight.bold,
                color: CustomColors.whitePrimary),
          ),
          const SizedBox(height: 15),
          SizedBox(
            width: 200,
            height: 40,
            child: ElevatedButton(
                onPressed: () {}, child: const Text("Get in touch")),
          )
        ],
      ),
    );
  }
}
