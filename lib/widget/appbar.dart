import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../constant/colorConstant.dart';

PreferredSizeWidget appBar(String title)=>AppBar(leading: Padding(
  padding: const EdgeInsets.all(8),
  child: Container(
      decoration: BoxDecoration(
          color: buttonBackground,
          borderRadius: BorderRadius.circular(15)),
      child: IconButton(
        onPressed: () {
          Get.back();
        },
        icon: const Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
        ),
        // color: Colors.cyan,
      )),
),
  backgroundColor: background,
  elevation: 0,
  title:  Text(
    title,
    style: const TextStyle(color: icon),
  ),
  centerTitle: true,);