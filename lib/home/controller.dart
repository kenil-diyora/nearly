import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class HomeScreenController extends GetxController {
  RxList stationData = [].obs;

  void getStationData() {
    FirebaseFirestore.instance.collection("charging_station").get().then(
      (value) {
        for (var i in value.docs) {
          stationData.add(i.data());
        }
      },
    );
  }
}
