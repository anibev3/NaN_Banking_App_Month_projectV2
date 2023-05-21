import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nan_banking_app_mai_project/src/routes/app_pages.dart';
import 'package:nan_banking_app_mai_project/src/utils/themes/Constant.dart';
import 'package:nan_banking_app_mai_project/src/views/ui/home/home.screen.dart';
import 'package:nan_banking_app_mai_project/src/views/ui/messagerie/views/messagerie.dart';
import 'package:nan_banking_app_mai_project/src/views/ui/parametre/views/parametre.dart';
import 'package:nan_banking_app_mai_project/src/views/ui/profile/views/profile.dart';
import 'package:nan_banking_app_mai_project/src/views/ui/statistic/views/statistic.dart';
import 'package:nan_banking_app_mai_project/src/views/widgets/lib/constants.dart';
import 'package:rive/rive.dart';
import 'components/animated_bar.dart';
import 'components/side_menu.dart';
import 'models/menu_btn.dart';
import 'models/rive_asset.dart';
import 'utils/rive_utils.dart';

// We are done with our 5th and last episode
// Thank you so much for watching entire serise
// Bye

class EntryPoint extends StatefulWidget {
  const EntryPoint({super.key});

  @override
  State<EntryPoint> createState() => _EntryPointState();
}

class _EntryPointState extends State<EntryPoint>
    with SingleTickerProviderStateMixin {
  RiveAsset selectedBottomNav = bottomNavs.first;

  late AnimationController _animationController;
  late Animation<double> animation;
  late Animation<double> scalAnimation;

  // Let's chnage the name
  late SMIBool isSideBarClosed;

  bool isSideMenuClosed = true;
  late String whatIsSelect = 'Home';
  late bool whatIsSelect2 = false;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    )..addListener(() {
        setState(() {});
      });

    animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
          parent: _animationController, curve: Curves.fastOutSlowIn),
    );
    scalAnimation = Tween<double>(begin: 1, end: 0.8).animate(
      CurvedAnimation(
          parent: _animationController, curve: Curves.fastOutSlowIn),
    );
    print(
      "<_______________ On Init ________________>",
    );
    print(
      "<_______________ $whatIsSelect ________________>",
    );
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Widget buildChild() {
    switch (whatIsSelect) {
      case 'Home':
        return HomeScreen();
      case 'Résumé':
        return Statistic();
      case 'Chat':
        return Messagerie();
      case 'Profile':
        return Profile();
      case 'Parametre':
        return Parametre();
      default:
        return HomeScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: backgroundColor2,
      resizeToAvoidBottomInset: false,
      extendBody: true,
      body: Stack(
        // It's time to add the SideMenu
        children: [
          // It shows nothing
          // because now it's under the HomeScreen
          AnimatedPositioned(
            duration: const Duration(milliseconds: 200),
            curve: Curves.fastOutSlowIn,
            width: 288,
            left: isSideMenuClosed ? -288 : 0,
            height: MediaQuery.of(context).size.height,
            child: const SideMenu(),
          ),

          Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateY(animation.value - 30 * animation.value * pi / 180),
            child: Transform.translate(
              offset: Offset(animation.value * 265, 0),
              child: Transform.scale(
                scale: scalAnimation.value,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(
                    Radius.circular(24),
                  ),
                  child: buildChild(),
                ),
              ),
            ),
          ),
          // As you can see it's an ANimated button

          (whatIsSelect2 == true)
              ? GestureDetector(
                  onTap: () {
                    setState(() {
                      Get.toNamed(Routes.HOME);
                    });
                  },
                  child: SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: CircleAvatar(
                        backgroundColor: Cst.kprimary4Color,
                        child: Center(
                          child: Icon(Icons.arrow_back_ios),
                        ),
                      ),
                    ),
                  ),
                )
              : AnimatedPositioned(
                  duration: Duration(milliseconds: 200),
                  curve: Curves.fastOutSlowIn,
                  left: isSideMenuClosed ? 0 : 220,
                  top: 16,
                  child: MenuBtn(
                    riveOnInit: (artboard) {
                      StateMachineController controller =
                          RiveUtils.getRiveController(artboard,
                              stateMachineName: "State Machine");
                      isSideBarClosed = controller.findSMI("isOpen") as SMIBool;
                      // Now it's easy to understand
                      isSideBarClosed.value = true;
                    },
                    // Let's fixed the scal animation
                    press: () {
                      isSideBarClosed.value = !isSideBarClosed.value;
                      if (isSideMenuClosed) {
                        _animationController.forward();
                      } else {
                        _animationController.reverse();
                      }
                      setState(() {
                        isSideMenuClosed = isSideBarClosed.value;
                      });
                    },
                  ),
                )
        ],
      ),
      bottomNavigationBar: Transform.translate(
        offset: Offset(0, 100 * animation.value),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: Container(
              padding: const EdgeInsets.all(12),
              margin: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                color: backgroundColor2.withOpacity(0.8),
                borderRadius: const BorderRadius.all(Radius.circular(24)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ...List.generate(
                    bottomNavs.length,
                    (index) => GestureDetector(
                      onTap: () {
                        bottomNavs[index].input!.change(true);
                        if (bottomNavs[index] != selectedBottomNav) {
                          setState(() {
                            selectedBottomNav = bottomNavs[index];
                          });
                        }
                        Future.delayed(
                          const Duration(seconds: 1),
                          () {
                            bottomNavs[index].input!.change(false);
                          },
                        );
                        whatIsSelect = bottomNavs[index].title;
                        print(
                          "<_______________ $whatIsSelect ________________>",
                        );
                        setState(() {
                          if (whatIsSelect == 'Résumé' ||
                              whatIsSelect == 'Chat' ||
                              whatIsSelect == 'Profile' ||
                              whatIsSelect == 'Parametre') {
                            whatIsSelect2 = true;
                          } else {
                            whatIsSelect2 = false;
                          }
                        });
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          AnimatedBar(
                            isActive: bottomNavs[index] == selectedBottomNav,
                          ),
                          SizedBox(
                            height: 34,
                            width: 34,
                            child: Opacity(
                              opacity: bottomNavs[index] == selectedBottomNav
                                  ? 1
                                  : 0.5,
                              child: RiveAnimation.asset(
                                bottomNavs.first.src,
                                artboard: bottomNavs[index].artboard,
                                onInit: (artboard) {
                                  StateMachineController controller =
                                      RiveUtils.getRiveController(artboard,
                                          stateMachineName: bottomNavs[index]
                                              .stateMachineName);
                                  bottomNavs[index].input =
                                      controller.findSMI("active") as SMIBool;
                                },
                              ),
                            ),
                          ),
                          Text(
                            bottomNavs[index].title,
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
