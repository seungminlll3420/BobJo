import 'package:flutter/material.dart';

import 'package:get/state_manager.dart';

import '../util/app_modal_helper.dart';
import 'controller/home_controller.dart';
import 'widgets/group_view_tiem.dart';
import 'widgets/modal_view_widget.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "밥조",
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "밥조 멤버",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                IconButton(
                    onPressed: () {
                      AppModalHelper.simpleModalBottomSheet(context,
                          content: const ModalViewWidget(),
                          hight: (MediaQuery.of(context).size.height - 100));
                    },
                    icon: const Icon(
                      Icons.add,
                      size: 32,
                      color: Colors.white,
                    ))
              ],
            ),
            const SizedBox(height: 20),
            Obx(
              () => Wrap(
                children: List.generate(controller.group.length, (index) {
                  return GestureDetector(
                    onTap: () => controller.onTeamItemPressed(index),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8.0,
                        horizontal: 16,
                      ),
                      margin: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16)),
                      child: Text(
                        controller.group[index],
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            Obx(
              () => controller.riceGroupA.isEmpty
                  ? Expanded(child: Container())
                  : Expanded(
                      child: PageView(
                        children: [
                          GroupViewItem(
                            riceGroup: controller.riceGroupA,
                            groupName: "A팀",
                          ),
                          GroupViewItem(
                              riceGroup: controller.riceGroupB,
                              groupName: "B팀"),
                        ],
                      ),
                    ),
            ),
            GestureDetector(
              onTap: controller.onBobJoPressed,
              child: const Center(
                child: Text(
                  "오늘의 밥조?",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 36,
            ),
          ],
        ),
      ),
    );
  }
}
