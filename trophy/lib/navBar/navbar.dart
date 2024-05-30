import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:trophy/navBar/nav_item_model.dart';

const Color navbarBgColor = Color.fromARGB(255, 222, 217, 217);

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  List<SMIBool?> riveIconsInputs = [];
  List<StateMachineController?> controllers = [];
  int selectNavIndex = 0;

  List<String> pages = const ["HOME", "MESSAGE", "NOTIFICATIONS", "SETTINGS"];

  void animateTheIcon(int index) {
    if (riveIconsInputs.isNotEmpty && riveIconsInputs[index] != null) {
      riveIconsInputs[index]!.change(true);
      Future.delayed(const Duration(seconds: 1), () {
        riveIconsInputs[index]!.change(false);
      });
    }
  }

  void riveOnInit(Artboard artboard,
      {required String stateMachineName, required int index}) {
    final controller =
        StateMachineController.fromArtboard(artboard, stateMachineName);
    if (controller != null) {
      artboard.addController(controller);
      controllers[index] = controller;
      final input = controller.findInput<bool>('active');
      if (input != null) {
        riveIconsInputs[index] = input as SMIBool;
      }
    }
  }

  @override
  void initState() {
    super.initState();
    riveIconsInputs = List<SMIBool?>.filled(bottomNavs.length, null);
    controllers = List<StateMachineController?>.filled(bottomNavs.length, null);
  }

  @override
  void dispose() {
    for (var controller in controllers) {
      controller?.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(pages[selectNavIndex]),
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          height: 70,
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.fromLTRB(24, 0, 24, 24),
          decoration: BoxDecoration(
            color: navbarBgColor.withOpacity(0.8),
            borderRadius: const BorderRadius.all(Radius.circular(24)),
            boxShadow: const [
              BoxShadow(
                color: Color.fromARGB(20, 0, 0, 0),
                offset: Offset(0, 20),
                blurRadius: 20,
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(bottomNavs.length, (index) {
                final riveIcon = bottomNavs[index];

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectNavIndex = index;
                    });
                    animateTheIcon(index);
                  },
                  child: Opacity(
                    opacity: selectNavIndex == index ? 1 : 0.5,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AnimatedBar(
                          isActive: selectNavIndex == index,
                        ),
                        SizedBox(
                          height: 36,
                          width: 36,
                          child: RiveAnimation.asset(
                            riveIcon.src,
                            artboard: riveIcon.artboard,
                            onInit: (artboard) {
                              riveOnInit(artboard,
                                  stateMachineName: riveIcon.stateMachineName,
                                  index: index);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}

class AnimatedBar extends StatelessWidget {
  const AnimatedBar({
    super.key,
    required this.isActive,
  });
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.only(bottom: 2),
      height: 4,
      width: isActive ? 20 : 0,
      decoration: const BoxDecoration(
        color: Color(0xFFF09C46),
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }
}
