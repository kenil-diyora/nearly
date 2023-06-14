import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class SelectVehicleController extends GetxController {
  RxList vehicle = [].obs;

  void vehicleData() {
    FirebaseFirestore.instance.collection("vehicle").get().then(
      (value) {
        for (var i in value.docs) {
          vehicle.add(i.data());
        }
      },
    );
  }
}
