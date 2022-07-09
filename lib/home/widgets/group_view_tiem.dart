import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

// ignore: must_be_immutable
class GroupViewItem extends StatelessWidget {
  GroupViewItem({
    Key? key,
    required this.riceGroup,
    this.groupName = "",
  }) : super(key: key);
  final String groupName;
  RxList<String> riceGroup;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        Text(
          groupName,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: 20),
        Wrap(
          children: List.generate(riceGroup.length, (index) {
            return Container(
              padding: const EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 16,
              ),
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(16)),
              child: Text(
                riceGroup[index],
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
