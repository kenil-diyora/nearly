import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class CompareVehicleController extends GetxController {

  RxList vehicleData = [].obs;
  RxList brandName = [
    "Select brand",
  ].obs;
  RxList modelName = [
    "Select model",
  ].obs;
  RxList modelSecondName = [
    "Select model",
  ].obs;
  RxString selectFirstBrand = "Select brand".obs;
  RxString selectSecondBrand = "Select brand".obs;
  RxString selectFirstModel = "Select model".obs;
  RxString selectSecondModel = "Select model".obs;
  RxList compareVehicle = [].obs;
  RxList vehicleOneKey = [].obs;
  RxList vehicleTwoKey = [].obs;
  RxList vehicleOneFeatures = [].obs;
  RxList vehicleTwoFeatures = [].obs;

  void fetchData() {
    // for get all vehicle data
    FirebaseFirestore.instance.collection("vehicle").get().then(
      (value) {
        for (var i in value.docs) {
          vehicleData.add(i.data());
          // for get all brand name
          if (!brandName.contains(i.data()["brand"])) {
            brandName.add(i.data()["brand"]);
          }
        }
      },
    );
  }

  void fetchModelData() {
    // for get first vehicle name
    for (int i = 0; i < vehicleData.length; i++) {
      if (selectFirstBrand.value == vehicleData[i]["brand"]) {
        modelName.add(vehicleData[i]["name"]);
      }
    }
  }

  void fetchSecondModelData() {
    for (int i = 0; i < vehicleData.length; i++) {
      if (selectSecondBrand.value == vehicleData[i]["brand"]) {
        if (selectFirstBrand == selectSecondBrand) {
          if (selectFirstModel != vehicleData[i]["name"]) {
            modelSecondName.add(vehicleData[i]["name"]);
          }
        } else {
          modelSecondName.add(vehicleData[i]["name"]);
        }
      }
    }
  }

  void compareVehicleData() {
    for (int i = 0; i < vehicleData.length; i++) {
      if (selectFirstModel == vehicleData[i]["name"] ||
          selectSecondModel == vehicleData[i]["name"]) {
        compareVehicle.add(vehicleData[i]);
        // print(compareVehicle.length);
      }
    }

    // for first vehicle features
    Map oneKey = compareVehicle[0]["features"];
    vehicleOneKey.value = oneKey.keys.toList();
    vehicleOneFeatures.value = oneKey.values.toList();

    // for second vehicle features
    Map twoKey = compareVehicle[1]["features"];
    vehicleTwoKey.value = twoKey.keys.toList();
    vehicleTwoFeatures.value = twoKey.values.toList();
  }
}
