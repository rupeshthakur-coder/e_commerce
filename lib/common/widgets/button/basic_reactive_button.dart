import 'package:e_commerce/core/configs/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BasicReactiveButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final double? height;
  final Widget? content;
  const BasicReactiveButton(
      {required this.onPressed,
      this.title = '',
      this.height,
      this.content,
      super.key});

  Widget _loading() {
    return ElevatedButton(
        onPressed: null,
        style: ElevatedButton.styleFrom(
          minimumSize: Size.fromHeight(height ?? 50),
        ),
        child: Container(
            height: height ?? 50,
            alignment: Alignment.center,
            child: const CircularProgressIndicator()));
  }

  Widget _initial() {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        minimumSize: Size.fromHeight(height ?? 50),
      ),
      child: content ??
          Text(
            title,
            style: TextStyle(
                color: AppColors.buttonBg,
                fontWeight: FontWeight.w400,
                fontSize: 20.sp),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _initial();
  }
}
