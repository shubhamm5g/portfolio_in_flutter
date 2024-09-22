import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:portfolio_in_flutter/consts/consts.dart';
import 'package:portfolio_in_flutter/widgets/drawer_mobile.dart';
import 'package:portfolio_in_flutter/widgets/header_desktop.dart';
import 'package:portfolio_in_flutter/widgets/header_mobile.dart';
import 'package:portfolio_in_flutter/widgets/main.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    return LayoutBuilder(builder: (context, constraints) {
      return SafeArea(
        child: Scaffold(
          key: scaffoldKey,
          endDrawer: (constraints.maxWidth >= kMinDesktopWidth)
              ? null
              : const DrawerMobile(),
          backgroundColor: CustomColors.scaffoldBg,
          body: Container(
            child: ListView(
              scrollDirection: Axis.vertical,
              children: [
                // main
                if (constraints.maxWidth >= kMinDesktopWidth)
                  const HeaderDesktop()
                else
                  HeaderMobile(
                    onMenuTap: () {
                      scaffoldKey.currentState?.openEndDrawer();
                    },
                  ),
                // MainDesktop(),
                Container(
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
                            onPressed: () {},
                            child: const Text("Get in touch")),
                      )
                    ],
                  ),
                ),

                // skills
                Container(
                  height: 500,
                  width: double.maxFinite,
                  color: Colors.blueGrey,
                ), // project
                Container(
                  height: 500,
                  width: double.maxFinite,
                  color: Colors.blueGrey,
                ), // contacts
                Container(
                  height: 500,
                  width: double.maxFinite,
                  color: Colors.blueGrey,
                ), //footer
                Container(
                  height: 500,
                  width: double.maxFinite,
                  color: Colors.blueGrey,
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
