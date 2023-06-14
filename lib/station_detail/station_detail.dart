import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nearly/charging_history/controller.dart';
import 'package:nearly/station_detail/controller.dart';

import '../config/app_color.dart';

class StationDetail extends StatefulWidget {
  final Map stationDetail;

  const StationDetail({
    Key? key,
    required this.stationDetail,
  }) : super(key: key);

  @override
  State<StationDetail> createState() => _StationDetailState();
}

class _StationDetailState extends State<StationDetail> {
  StationDetailController controller = Get.put(StationDetailController());
  ChargingHistoryController historyController =
      Get.put(ChargingHistoryController());
  List descriptionValue = [];
  List descriptionKey = [];

  void descriptionData() {
    Map description = widget.stationDetail["description"];
    descriptionKey = description.keys.toList();
    descriptionValue = description.values.toList();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    descriptionData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: GestureDetector(
        onTap: () {
          historyController.chargingHistory.add(
            {
              "image":
                  "https://static.punemirror.com/full/21b0dd30-9d36-4d52-ba39-05bbc694f1b5.jpg",
              "station": widget.stationDetail["name"],
              "port": widget.stationDetail["charging_port"]
                  .toString()
                  .replaceAll(
                    "[",
                    "",
                  )
                  .replaceAll(
                    "]",
                    "",
                  ),
              "location": widget.stationDetail["location"].toString(),
              "charging_start": "12:51",
              "charging_end": "1:51",
            },
          );
        },
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 15,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: ColorConst.green,
          ),
          child: const Text(
            "Check In",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: ColorConst.white,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 15,
                  bottom: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(
                        CupertinoIcons.back,
                      ),
                    ),
                    const Text(
                      "Station Detail",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(
                        CupertinoIcons.back,
                        color: Colors.transparent,
                      ),
                    ),
                  ],
                ),
              ),
              Image.network(
                "https://static.punemirror.com/full/21b0dd30-9d36-4d52-ba39-05bbc694f1b5.jpg",
                width: double.infinity,
                height: 255,
                fit: BoxFit.fill,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                      ),
                      child: Text(
                        widget.stationDetail["name"],
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.power,
                        ),
                        Text(
                          "  ${widget.stationDetail["charging_port"].toString().replaceAll(
                                "[",
                                "",
                              ).replaceAll(
                                "]",
                                "",
                              )}",
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: ColorConst.title,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.flash_on,
                          ),
                          Text(
                            "  ${widget.stationDetail["power"]}",
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: ColorConst.title,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on,
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 8,
                            ),
                            child: Text(
                              widget.stationDetail["location"],
                              textAlign: TextAlign.justify,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: ColorConst.title,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ColorConst.green,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {},
                        child: const Text(
                          "Navigate",
                        ),
                      ),
                    ),
                    const Divider(
                      color: Colors.black26,
                      height: 1,
                      thickness: 1,
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: descriptionKey.length,
                      itemBuilder: (context, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 10,
                                bottom: 5,
                              ),
                              child: Text(
                                descriptionKey[index],
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Text(
                              descriptionValue[index]
                                  .toString()
                                  .replaceAll(
                                    "[",
                                    "",
                                  )
                                  .replaceAll(
                                    "]",
                                    "",
                                  ),
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w300,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
