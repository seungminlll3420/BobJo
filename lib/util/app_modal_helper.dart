import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class AppModalHelper {
  // static Future<void> actionWidgetModalBottomSheet(
  //   BuildContext context, {
  //   required final String title,
  //   required final Widget content,
  //   required final double height,
  //   final String? cancelButtonText,
  //   final String? confirmButtonText,
  //   final VoidCallback? onConfirmButtonPressed,
  //   final VoidCallback? onCancleButtonPressed,
  // }) {
  //   return showModalBottomSheet<void>(
  //     shape: RoundedRectangleBorder(
  //       borderRadius: BorderRadius.circular(20.0),
  //     ),
  //     context: context,
  //     backgroundColor: const Color(0xff000000).withOpacity(0.6),
  //     isScrollControlled: true,
  //     builder: (BuildContext context) {
  //       return Padding(
  //         padding: MediaQuery.of(context).viewInsets,
  //         child: ClipRRect(
  //           borderRadius: const BorderRadius.only(
  //             topLeft: Radius.circular(20.0),
  //             topRight: Radius.circular(20.0),
  //           ),
  //           child: Container(
  //             padding: const EdgeInsets.symmetric(horizontal: 20.0),
  //             color: Color(0xffffffff),
  //             height: height,
  //             child: Column(
  //               crossAxisAlignment: CrossAxisAlignment.center,
  //               mainAxisSize: MainAxisSize.min,
  //               children: <Widget>[
  //                 const SizedBox(height: 12),
  //                 Container(
  //                   width: 44,
  //                   height: 1,
  //                   color: AppColors.grey100,
  //                 ),
  //                 const SizedBox(height: 24),
  //                 Text(
  //                   title,
  //                   style: Theme.of(context)
  //                       .textTheme
  //                       .titleSmall!
  //                       .copyWith(color: AppColors.darkGrey),
  //                 ),
  //                 const SizedBox(height: 24),
  //                 Container(
  //                   width: double.infinity,
  //                   height: 1,
  //                   color: AppColors.grey50,
  //                 ),
  //                 Expanded(child: content),
  //                 Container(
  //                   width: double.infinity,
  //                   height: 1,
  //                   color: AppColors.grey50,
  //                 ),
  //                 const SizedBox(height: 24),
  //                 Row(
  //                   children: [
  //                     Expanded(
  //                       child: AppGestureDetector(
  //                         onTap: () {
  //                           if (onCancleButtonPressed != null) {
  //                             onCancleButtonPressed.call();
  //                           } else {
  //                             Get.back(result: false);
  //                           }
  //                         },
  //                         child: Container(
  //                           padding: const EdgeInsets.symmetric(vertical: 12.0),
  //                           decoration: BoxDecoration(
  //                               border: Border.all(color: AppColors.grey200),
  //                               borderRadius: BorderRadius.circular(8),
  //                               color: AppColors.white),
  //                           child: Center(
  //                               child: Text(
  //                             cancelButtonText ?? "app_bottom_sheet_cacnel".tr,
  //                             style: Theme.of(context)
  //                                 .textTheme
  //                                 .labelLarge!
  //                                 .copyWith(color: AppColors.darkGrey),
  //                           )),
  //                         ),
  //                       ),
  //                     ),
  //                     const SizedBox(width: 16),
  //                     Expanded(
  //                       child: AppGestureDetector(
  //                         onTap: () {
  //                           if (onConfirmButtonPressed != null) {
  //                             onConfirmButtonPressed.call();
  //                           } else {
  //                             Get.back(result: true);
  //                           }
  //                         },
  //                         child: Container(
  //                           padding: const EdgeInsets.symmetric(vertical: 12.0),
  //                           decoration: BoxDecoration(
  //                             border: Border.all(color: AppColors.yellow600),
  //                             borderRadius: BorderRadius.circular(8),
  //                             color: AppColors.yellow600,
  //                           ),
  //                           child: Center(
  //                               child: Text(
  //                             confirmButtonText ?? "app_dialog_confirm".tr,
  //                             style: Theme.of(context)
  //                                 .textTheme
  //                                 .labelLarge!
  //                                 .copyWith(color: AppColors.darkGrey),
  //                           )),
  //                         ),
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //                 const SizedBox(height: 32),
  //               ],
  //             ),
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }

  static Future<void> simpleModalBottomSheet(
    BuildContext context, {
    required final Widget content,
    required final double hight,
    final String? closeButtonText,
    final VoidCallback? onCloseButtonPressed,
  }) {
    return showModalBottomSheet<void>(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      context: context,
      backgroundColor: Colors.black.withOpacity(0.6),
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              color: Colors.white,
              height: hight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const SizedBox(height: 12),
                  Container(
                    width: 44,
                    height: 1,
                    color: Colors.grey,
                  ),
                  const SizedBox(height: 24),
                  Expanded(child: content),
                  const SizedBox(height: 12),
                  GestureDetector(
                    onTap: () {
                      if (onCloseButtonPressed != null) {
                        onCloseButtonPressed.call();
                      } else {
                        Get.back(result: false);
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.grey),
                      child: Center(
                          child: Text(
                        closeButtonText ?? "닫기",
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .copyWith(color: Colors.black),
                      )),
                    ),
                  ),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
