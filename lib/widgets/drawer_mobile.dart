import 'package:flutter/material.dart';

import '../consts/consts.dart';

class DrawerMobile extends StatelessWidget {
  const DrawerMobile({super.key, required this.onNavTap});
  final Function(int) onNavTap;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: CustomColors.scaffoldBg,
      child: ListView(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 5, top: 10, bottom: 10),
              child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.close)),
            ),
          ),
          for (int i = 0; i < navIcons.length; i++)
            ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 30),
              titleTextStyle: const TextStyle(
                  color: CustomColors.whitePrimary,
                  fontWeight: FontWeight.w600,
                  fontSize: 16),
              leading: Icon(navIcons[i]),
              title: Text(navTitles[i]),
              onTap: () {
                onNavTap(i);
              },
            )
        ],
      ),
    );
  }
}
