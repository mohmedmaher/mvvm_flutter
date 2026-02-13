import 'package:flutter/material.dart';
import 'package:mvvm_flutter/core/constants/app_colors.dart';
import 'package:mvvm_flutter/core/constants/app_strings.dart';
import 'package:mvvm_flutter/core/routing/routes.dart';
import 'package:mvvm_flutter/core/widgets/custom_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomButton(
            text: AppStrings.gold,
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.goldScreen);
            },
            color: AppColors.goldColor,
          ),
          SizedBox(height: 16),
          CustomButton(
            text: AppStrings.silver,
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.silverScreen);

            },
            color: AppColors.silverColor,
          ),
        ],
      ),
    );
  }
}
