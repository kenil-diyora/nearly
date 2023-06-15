import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nearly/compare_vehicle/controller.dart';
import 'package:nearly/widget/button.dart';

class CompareVehicle extends StatefulWidget {
  const CompareVehicle({Key? key}) : super(key: key);

  @override
  State<CompareVehicle> createState() => _CompareVehicleState();
}

class _CompareVehicleState extends State<CompareVehicle> {
  final CompareVehicleController controller =
      Get.put(CompareVehicleController());

  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 15,
            left: 15,
            right: 15,
          ),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(
                  child: Text(
                    "Compare vehicle",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                  child: Text(
                    "Select first vehicle",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                ),
                Obx(
                  () => DropdownButton(
                    isExpanded: true,
                    hint: const Text(
                      "Select brand",
                    ),
                    value: controller.selectFirstBrand.value,
                    items: controller.brandName
                        .toList()
                        .map(
                          (e) => DropdownMenuItem(
                            value: e,
                            child: Text(e.toString()),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {
                      controller.selectFirstBrand.value = value.toString();
                      controller.modelName.clear();
                      controller.modelName.add(
                        "Select model",
                      );
                      controller.selectFirstModel.value = "Select model";
                      controller.fetchModelData();
                    },
                    // onChanged: (String? value) {},
                  ),
                ),
                Obx(
                  () => DropdownButton(
                    isExpanded: true,
                    hint: const Text(
                      "Select model",
                    ),
                    value: controller.selectFirstModel.value,
                    items: controller.modelName
                        .toList()
                        .map(
                          (e) => DropdownMenuItem(
                            value: e,
                            child: Text(e.toString()),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {
                      controller.selectFirstModel.value = value.toString();
                      // controller.fetchModelData();
                    },
                    // onChanged: (String? value) {},
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                  child: Text(
                    "Select second vehicle",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                ),
                Obx(
                  () => DropdownButton(
                    isExpanded: true,
                    hint: const Text(
                      "Select brand",
                    ),
                    value: controller.selectSecondBrand.value,
                    items: controller.brandName
                        .toList()
                        .map(
                          (e) => DropdownMenuItem(
                            value: e,
                            child: Text(e.toString()),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {
                      controller.selectSecondBrand.value = value.toString();
                      controller.fetchSecondModelData();
                      controller.modelSecondName.clear();
                      controller.modelSecondName.add(
                        "Select model",
                      );
                      controller.selectSecondModel.value = "Select model";
                      controller.fetchSecondModelData();
                    },
                    // onChanged: (String? value) {},
                  ),
                ),
                Obx(
                  () => DropdownButton(
                    isExpanded: true,
                    hint: const Text(
                      "Select model",
                    ),
                    value: controller.selectSecondModel.value,
                    items: controller.modelSecondName
                        .toList()
                        .map(
                          (e) => DropdownMenuItem(
                            value: e,
                            child: Text(e.toString()),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {
                      controller.selectSecondModel.value = value.toString();
                    },
                    // onChanged: (String? value) {},
                  ),
                ),
                Obx(
                  () => button(
                    onTap: controller.selectFirstModel.value !=
                                "Select model" &&
                            controller.selectSecondModel.value != "Select model"
                        ? () {
                            // print("object");
                            controller.compareVehicle.value = [];
                            controller.compareVehicleData();
                            // print((controller.compareVehicle.value[0]["features"]));
                          }
                        : null,
                    title: "Compare",
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Obx(
                      () => controller.compareVehicle.isNotEmpty
                          ? Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Column(
                                    children: [
                                      Image.network(
                                        controller.compareVehicle[0]["image"],
                                        height: 100,
                                        width: 100,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 10,
                                        ),
                                        child: Text(
                                          controller.compareVehicle[0]["name"],
                                          style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                      ListView.builder(
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        itemCount:
                                            controller.vehicleOneKey.length,
                                        shrinkWrap: true,
                                        itemBuilder: (context, index) {
                                          return Padding(
                                            padding: const EdgeInsets.only(
                                              bottom: 10,
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  controller
                                                      .vehicleOneKey[index],
                                                  style: const TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w700,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                                Text(
                                                  controller.vehicleOneFeatures[
                                                      index],
                                                  style: const TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    children: [
                                      Image.network(
                                        controller.compareVehicle[1]["image"],
                                        height: 100,
                                        width: 100,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 10,
                                        ),
                                        child: Text(
                                          controller.compareVehicle[1]["name"],
                                          style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                      ListView.builder(
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        itemCount:
                                            controller.vehicleTwoKey.length,
                                        shrinkWrap: true,
                                        itemBuilder: (context, index) {
                                          return Padding(
                                            padding: const EdgeInsets.only(
                                              bottom: 10,
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  controller
                                                      .vehicleTwoKey[index],
                                                  style: const TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w700,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                                Text(
                                                  controller.vehicleTwoFeatures[
                                                      index],
                                                  style: const TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )
                          : const SizedBox(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
