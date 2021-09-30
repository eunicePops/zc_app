import 'package:flutter/material.dart';

import '../../../../shared/colors.dart';

TextStyle headerStyle() {
  return const TextStyle(
      fontSize: 20, fontWeight: FontWeight.w800, color: Colors.black);
}

TextStyle nameStyle() {
  return const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: AppColors.deepBlackColor);

}

TextStyle descriptionStyle() {
  return const TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w600,
      color: AppColors.deepBlackColor);
}

TextStyle faintTextStyle() {
<<<<<<< HEAD
<<<<<<< HEAD
  return TextStyle(

=======
  return const TextStyle(
>>>>>>> upstream/dev
=======
  return const TextStyle(
>>>>>>> addpeople
      fontSize: 14, fontWeight: FontWeight.w600, color: AppColors.borderColor);
}

TextStyle archiveTextStyle() {
<<<<<<< HEAD
<<<<<<< HEAD
  return TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w600,
      color: AppColors.redColor);
=======
  return const TextStyle(
      fontSize: 15, fontWeight: FontWeight.w600, color: AppColors.redColor);
>>>>>>> upstream/dev
=======
  return const TextStyle(
      fontSize: 15, fontWeight: FontWeight.w600, color: AppColors.redColor);
>>>>>>> addpeople
}

TextStyle greenTextStyle() {
  return const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w800,
    color: AppColors.zuriPrimaryColor,
  );
}
