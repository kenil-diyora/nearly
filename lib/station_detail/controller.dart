import 'package:get/get.dart';

class StationDetailController extends GetxController {
  final checkInStation = Rxn<int>();


  RxString currentStationName = "".obs;
  RxBool checkIn = false.obs;
}
