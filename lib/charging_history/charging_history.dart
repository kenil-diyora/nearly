import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nearly/charging_history/controller.dart';
import 'package:nearly/config/app_color.dart';

class ChargingHistory extends StatefulWidget {
  const ChargingHistory({Key? key}) : super(key: key);

  @override
  State<ChargingHistory> createState() => _ChargingHistoryState();
}

class _ChargingHistoryState extends State<ChargingHistory> {
  final ChargingHistoryController controller =
      Get.put(ChargingHistoryController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.chargingHistory.value = [];
    controller.getChargingHistory();
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
          child: Column(
            children: [
              const Center(
                child: Text(
                  "Charging History",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Obx(
                () => controller.chargingHistory.isNotEmpty
                    ? Expanded(
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: controller.chargingHistory.length,
                          itemBuilder: (context, index) {
                            var res = controller.chargingHistory[index];
                            return Container(
                              padding: const EdgeInsets.all(
                                10,
                              ),
                              margin: const EdgeInsets.symmetric(
                                vertical: 5,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: ColorConst.green,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                            right: 10,
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                res["station"],
                                                style: const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500,
                                                  color: ColorConst.white,
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                  vertical: 10,
                                                ),
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    const Padding(
                                                      padding: EdgeInsets.only(
                                                        right: 5,
                                                      ),
                                                      child: Icon(
                                                        Icons.location_on,
                                                        color: ColorConst.white,
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Text(
                                                        res["location"],
                                                        style: const TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color:
                                                              ColorConst.white,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                  bottom: 10,
                                                ),
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    const Padding(
                                                      padding: EdgeInsets.only(
                                                        right: 5,
                                                      ),
                                                      child: Icon(
                                                        Icons.power,
                                                        color: ColorConst.white,
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Text(
                                                        res["port"],
                                                        textAlign:
                                                            TextAlign.justify,
                                                        style: const TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color:
                                                              ColorConst.white,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.network(
                                          res["image"],
                                          height: 100,
                                          width: 100,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        res["charging_start"],
                                        style: const TextStyle(
                                          fontSize: 12,
                                          color: ColorConst.white,
                                        ),
                                      ),
                                      res["charging_end"] != null
                                          ? Text(
                                              res["charging_end"],
                                              style: const TextStyle(
                                                fontSize: 12,
                                                color: ColorConst.white,
                                              ),
                                            )
                                          : const Text(
                                              "Active",
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                                color: ColorConst.white,
                                              ),
                                            ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      )
                    : const Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                bottom: 10,
                              ),
                              child: Icon(
                                Icons.history,
                              ),
                            ),
                            Text(
                              "History not found",
                            ),
                          ],
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
