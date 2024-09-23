import 'package:flutter/material.dart';
import '../consts/consts.dart';
import 'package:url_launcher/url_launcher.dart';

class SiteLogo extends StatelessWidget {
  final VoidCallback? onTap;
  const SiteLogo({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: const Text(
        "S5g",
        style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            decoration: TextDecoration.underline,
            color: CustomColors.yellowSecodary),
      ),
    );
  }
}

class HeadingTitle extends StatelessWidget {
  final String text;

  const HeadingTitle({super.key, required this.text});
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: CustomColors.whitePrimary),
    );
  }
}

Future<void> openLinkInApp(String url) async {
  // Mobile/desktop logic
  await openAppLink(url);
}

Future<void> openAppLink(String url) async {
  // Use url_launcher for mobile and desktop
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
