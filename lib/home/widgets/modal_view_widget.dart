import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../controller/home_controller.dart';

class ModalViewWidget extends GetView<HomeController> {
  const ModalViewWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: controller.editingController,
          style: const TextStyle(color: Colors.black, fontSize: 24),
          cursorColor: Colors.black,
          onSubmitted: (name) => controller.onSubmitPressed(),
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(
                color: Colors.grey,
              ),
            ),
          ),
        ),
        Expanded(
          child: Obx(
            () => ListView.separated(
              shrinkWrap: true,
              itemCount: controller.group.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        controller.group[index],
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const Icon(Icons.close)
                    ],
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return Container(
                  height: 1,
                  width: double.infinity,
                  color: Colors.black,
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
