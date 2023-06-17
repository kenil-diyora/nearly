import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nearly/charging_history/controller.dart';
import 'package:nearly/station_detail/controller.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../config/app_color.dart';

class StationDetail extends StatefulWidget {
  final Map stationDetail;
  final int index;

  const StationDetail({
    Key? key,
    required this.stationDetail,
    required this.index,
  }) : super(key: key);

  @override
  State<StationDetail> createState() => _StationDetailState();
}

class _StationDetailState extends State<StationDetail> {
  StationDetailController controller = Get.put(StationDetailController());
  ChargingHistoryController historyController =
      Get.put(ChargingHistoryController());

  // HomeScreenController homeScreenController = Get.put(HomeScreenController());

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
        onTap: () async {
          final SharedPreferences pref = await SharedPreferences.getInstance();
          controller.checkInStation.value = widget.index;
          controller.currentStationName.value = widget.stationDetail["name"];

          if (controller.checkInStation.value == widget.index) {
            controller.checkIn.value = !controller.checkIn.value;
          }
          print(controller.checkIn);
          print(controller.checkInStation);

          // controller.currentStationName.value = widget.stationDetail["name"];
          // controller.checkIn.value = !controller.checkIn.value;
          // if(controller.checkIn.value == false){
          //   F
          // }

          // if (controller.checkIn.value == false) {
          //   String? collectionId;
          //   FirebaseFirestore.instance
          //       .collection("charging_history")
          //       .where("uid", isEqualTo: pref.getString("uid"))
          //       .get()
          //       .then((value) {
          //     for (var i in value.docs) {
          //       collectionId = i.id;
          //     }
          //     FirebaseFirestore.instance
          //         .collection("charging_history")
          //         .doc(collectionId)
          //         .update({
          //       "charging_end":
          //           DateFormat.yMd().add_jm().format(DateTime.now()),
          //     });
          //   });
          // } else {
          //   FirebaseFirestore.instance.collection("charging_history").add(
          //     {
          //       "uid": pref.getString("uid"),
          //       "image":
          //           "https://static.punemirror.com/full/21b0dd30-9d36-4d52-ba39-05bbc694f1b5.jpg",
          //       "station": widget.stationDetail["name"],
          //       "port": widget.stationDetail["charging_port"]
          //           .toString()
          //           .replaceAll(
          //             "[",
          //             "",
          //           )
          //           .replaceAll(
          //             "]",
          //             "",
          //           ),
          //       "location": widget.stationDetail["location"].toString(),
          //       "charging_start":
          //           DateFormat.yMd().add_jm().format(DateTime.now()),
          //     },
          //   );
          // }
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
            // controller.currentStationName.isNotEmpty &&
            //         widget.stationDetail["name"] ==
            //             controller.currentStationName.value &&
            //         controller.checkIn.value == true
            //     ? "Check Out"
            //     :
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
