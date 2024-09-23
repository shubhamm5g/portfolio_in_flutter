import 'package:flutter/material.dart';
import 'package:portfolio_in_flutter/consts/consts.dart';
import 'package:portfolio_in_flutter/utils/projects_utils.dart';
import 'package:portfolio_in_flutter/widgets/common_widgets.dart';
import 'package:portfolio_in_flutter/widgets/drawer_mobile.dart';
import 'package:portfolio_in_flutter/widgets/header_desktop.dart';
import 'package:portfolio_in_flutter/widgets/header_mobile.dart';
import 'package:portfolio_in_flutter/widgets/main_desktop.dart';
import 'package:portfolio_in_flutter/widgets/main_mobile.dart';
import 'package:portfolio_in_flutter/widgets/skills_desktop.dart';
import 'package:portfolio_in_flutter/widgets/skills_mobile.dart';

import '../widgets/project_card_widget.dart';
import '../widgets/project_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final scrollController = ScrollController();
  final List<GlobalKey> navbarkeys = List.generate(4, (index) => GlobalKey());
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
              : DrawerMobile(
                  onNavTap: (int navIndex) {
                    scaffoldKey.currentState?.closeEndDrawer();
                    scollToSection(navIndex);
                  },
                ),
          backgroundColor: CustomColors.scaffoldBg,
          body: SingleChildScrollView(
            controller: scrollController,
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                // main
                SizedBox(key: navbarkeys.first),
                if (constraints.maxWidth >= kMinDesktopWidth)
                  HeaderDesktop(onNavTap: (int navIndex) {
                    scollToSection(navIndex);
                  })
                else
                  HeaderMobile(
                    onMenuTap: () {
                      scaffoldKey.currentState?.openEndDrawer();
                    },
                  ),
                if (constraints.maxWidth >= kMinDesktopWidth)
                  const MainDesktop()
                else
                  const MainMobile(),

                // skills
                Container(
                  key: navbarkeys[1],
                  width: screenWidth,
                  padding: const EdgeInsets.fromLTRB(25, 20, 25, 20),
                  color: CustomColors.scaffoldBg,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      //titles

                      const HeadingTitle(text: "What can I do?"),
                      const SizedBox(
                        height: 50,
                      ),
                      // skills and platforms
                      (constraints.maxWidth >= kMidDesktopWidth)
                          ? const SkillsDesktop()
                          : const SkillsMobile(),
                    ],
                  ),
                ), // project
                ProjectSection(
                  key: navbarkeys[2],
                ), // contacts
                const SizedBox(height: 30),
                Container(
                  key: navbarkeys[3],
                  padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
                  color: CustomColors.bgLight1,
                  child: const Column(
                    children: [
                      HeadingTitle(text: "Get in touch"),
                    ],
                  ),
                ), //footer
                Container(
                  height: 60,
                  width: screenWidth,
                  color: CustomColors.scaffoldBg,
                  child: const Center(
                    child: Text(
                      "Made by Shubham Maurya with Flutter ",
                      style:
                          TextStyle(fontSize: 16, color: CustomColors.bgLight2),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
  }

  void scollToSection(int navIndex) {
    if (navIndex == 4) {
      return;
    }
    final key = navbarkeys[navIndex];
    Scrollable.ensureVisible(key.currentContext!,
        duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
  }
}
