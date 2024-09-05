import 'package:flutter/material.dart';

import '../../../../res/appColors/app_colors.dart';
import '../../../../viewmodel/controller/homeViewController/home_view_controller.dart';

class ElevatedCustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPress;
  const ElevatedCustomButton(
      {super.key, required this.text, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 330,
      height: 47,
      child: ElevatedButton(
        style: ButtonStyle(
          elevation: const WidgetStatePropertyAll(3),
          backgroundColor: WidgetStatePropertyAll(
            AppColors.focusBorderColor,
          ),
        ),
        onPressed: onPress,
        child: Text(
          text,
          style: TextStyle(fontSize: 18, color: AppColors.appBackColor),
        ),
      ),
    );
  }
}
