import 'package:get/instance_manager.dart';
import 'package:rice_group/home/controller/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
  }
}
