import 'package:get/get.dart';
import 'package:nearly/charging_history/charging_history.dart';
import 'package:nearly/home/home_screen.dart';
import '../compare_vehicle/compare_vehicle.dart';

class BottomBarController extends GetxController {
  RxList currentPage = [
    const HomeScreen(),
    const CompareVehicle(),
    ChargingHistory(),
  ].obs;
  RxInt currentIndex = 0.obs;
}
