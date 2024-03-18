import 'package:a_basic_prj/utils/colors.dart';
import 'package:flutter/material.dart';

ButtonStyle borderedButtonStyle=ButtonStyle(
  elevation: MaterialStateProperty.all(0),
  backgroundColor: MaterialStateProperty.all(Colors.white),
  shape: MaterialStateProperty.all(RoundedRectangleBorder(
    side: BorderSide(color: AppColors.primary),
    borderRadius: BorderRadius.circular(10),
  )),
);