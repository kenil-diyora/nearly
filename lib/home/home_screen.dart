import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nearly/config/app_color.dart';
import 'package:nearly/home/controller.dart';
import 'package:nearly/station_detail/station_detail.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeScreenController controller = Get.put(HomeScreenController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.stationData.value = [];
    controller.getStationData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.network(
            "https://media.wired.com/photos/59269cd37034dc5f91bec0f1/master/w_2560%2Cc_limit/GoogleMapTA.jpg",
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(
                bottom: 15,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 15,
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            bottom: 10,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 15,
                                ),
                                decoration: BoxDecoration(
                                  color: ColorConst.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: const Row(
                                  children: [
                                    Icon(
                                      Icons.charging_station_outlined,
                                    ),
                                    Text(
                                      " Tata Nexon EV ",
                                    ),
                                    Icon(
                                      Icons.arrow_drop_down_sharp,
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                  color: ColorConst.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: const Icon(
                                  Icons.filter_alt_outlined,
                                ),
                              ),
                            ],
                          ),
                        ),
                        TextFormField(
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                          decoration: InputDecoration(
                            // constraints: const BoxConstraints(
                            //   maxHeight: 40,
                            // ),
                            prefixIcon: const Icon(
                              Icons.search,
                              size: 20,
                            ),
                            hintText: "Search location....",
                            // hintStyle: const TextStyle(
                            //   fontSize: 14,
                            // ),
                            fillColor: ColorConst.white,
                            filled: true,
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: ColorConst.white,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: ColorConst.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 150,
                    child: Obx(
                      () => ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.stationData.length,
                        itemBuilder: (context, index) {
                          var res = controller.stationData[index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => StationDetail(
                                    stationDetail: res,
                                    index: index,
                                    // index: index,
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              width: 300,
                              margin: const EdgeInsets.symmetric(
                                horizontal: 10,
                              ),
                              padding: const EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                color: ColorConst.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Charging Point Details",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w300,
                                      color: ColorConst.subTitle,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      top: 5,
                                      bottom: 10,
                                    ),
                                    child: Text(
                                      res["name"],
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: ColorConst.title,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      bottom: 5,
                                    ),
                                    child: Row(
                                      children: [
                                        const Icon(
                                          Icons.power,
                                        ),
                                        Text(
                                          "  ${res["charging_port"].toString().replaceAll(
                                                "[",
                                                "",
                                              ).replaceAll(
                                                "]",
                                                "",
                                              )}",
                                          style: const TextStyle(
                                            fontSize: 14,
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
                                        Icons.flash_on,
                                      ),
                                      Text(
                                        "  ${res["power"]}",
                                        style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: ColorConst.title,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
