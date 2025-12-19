import 'package:assignment_asl/core/features/nav/home/home_controller.dart';
import 'package:assignment_asl/core/features/nav/home/home_screen.dart';
import 'package:assignment_asl/core/features/news/news_screen.dart';
import 'package:assignment_asl/core/features/profile.dart';
import 'package:assignment_asl/core/features/task/all%20_task_screen.dart' show AllTaskScreen;
import 'package:assignment_asl/core/features/task/task_create_screen.dart';
import 'package:assignment_asl/core/features/utils/toast.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';

class NavScreen extends StatefulWidget {
  const NavScreen({Key? key}) : super(key: key);

  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {

  final homeController = Get.put(HomeController());

  List<Widget> pages =   [
    HomeScreen(),
    CreateTaskPage(),
    AllTaskScreen(),
    NewsScreen(),
    ProfileScreen (),
  ];




  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        body: Obx(
          () {
            return pages[homeController.currentPageIndex.value];
          }
        ),

      bottomNavigationBar: Obx(() {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          decoration: BoxDecoration(
            color: const Color(0xfff8f9ff),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.02),
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(40),
            child: Container(
              height: 65,
              width: double.infinity,
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(5, (index) {
                  final icons = [
                    Icons.home_outlined,
                    Icons.assignment_rounded, // your middle icon
                    Icons.calendar_month_outlined,
                    Icons.newspaper,
                    Icons.supervised_user_circle,
                  ];
                  final isSelected =
                      homeController.currentPageIndex.value == index;

                  return GestureDetector(
                    onTap: () {
                      homeController.changeBottomTab(index);

                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 250),
                      curve: Curves.easeInOut,
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        color: isSelected
                            ? const Color(0xFFEDEBFE)
                            : Colors.transparent,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        icons[index],
                        color: isSelected
                            ? const Color(0xFF6A4BFF)
                            : Colors.grey,
                        size: 26,
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
        );
      }),
    );
  }
}