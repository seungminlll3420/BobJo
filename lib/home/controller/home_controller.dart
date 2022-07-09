import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';

class HomeController extends GetxController {
  final TextEditingController editingController = TextEditingController();
  final RxList<String> group = [
    "진석",
    "저스틴",
    "태욱",
    "예은",
    "현",
    "종현",
    "규하",
    "세림",
    "승민",
  ].obs;
  final RxList<String> riceGroupA = <String>[].obs;
  final RxList<String> riceGroupB = <String>[].obs;
  List<String> groupX = <String>[];

  @override
  void onClose() {
    super.onClose();
    editingController.dispose();
  }

  void onTeamItemPressed(int index) {
    group.removeAt(index);
  }

  void onSubmitPressed() {
    final name = editingController.text.trim();
    editingController.clear();

    group.insert(0, name);

    Get.back();
  }

  void onBobJoPressed() {
    groupX.clear();
    riceGroupA.clear();
    riceGroupB.clear();

    groupX.addAll(group);
    int index = group.length - 1;
    int popIndex = 0;
    while (index != -1) {
      if (index == 0) {
        popIndex = index;
      } else {
        popIndex = Random().nextInt(index);
      }
      if (riceGroupA.length == riceGroupB.length) {
        riceGroupA.add(groupX.removeAt(popIndex));
      } else {
        riceGroupB.add(groupX.removeAt(popIndex));
      }
      index--;
    }
  }
}
