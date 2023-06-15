import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChargingHistoryController extends GetxController {
  RxList chargingHistory = [].obs;

  void getChargingHistory() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    FirebaseFirestore.instance
        .collection("charging_history")
        .where("uid", isEqualTo: pref.getString("uid"))
        .get()
        .then(
      (value) {
        for (var i in value.docs) {
          chargingHistory.add(i.data());
        }
      },
    );
  }
}
