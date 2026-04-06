import 'package:bookia_store/core/constant/app_images.dart';
import 'package:bookia_store/core/styles/colors.dart';
import 'package:bookia_store/core/widgets/custom_svg_picture.dart';
import 'package:flutter/material.dart';

class MainAppScreen extends StatefulWidget {
  const MainAppScreen({super.key});

  @override
  State<MainAppScreen> createState() => _MainAppScreenState();
}

class _MainAppScreenState extends State<MainAppScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: CustomSvgPicture(path: AppImages.homeSvg),
            label: "Home",
            activeIcon: CustomSvgPicture(
              path: AppImages.homeSvg,
              color: AppColors.primaryColor,
            ),
          ),
          BottomNavigationBarItem(
            icon: CustomSvgPicture(path: AppImages.bookmarkSvg),
            label: "WishList",
            activeIcon: CustomSvgPicture(
              path: AppImages.bookmarkSvg,
              color: AppColors.primaryColor,
            ),
          ),
          BottomNavigationBarItem(
            icon: CustomSvgPicture(path: AppImages.cartSvg),
            label: "Cart",
            activeIcon: CustomSvgPicture(
              path: AppImages.cartSvg,
              color: AppColors.primaryColor,
            ),
          ),
          BottomNavigationBarItem(
            icon: CustomSvgPicture(path: AppImages.profileSvg),
            label: "Profile",
            activeIcon: CustomSvgPicture(
              path: AppImages.profileSvg,
              color: AppColors.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
