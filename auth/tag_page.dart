import 'package:flutter/material.dart';
import 'package:flutter_virtual_live/localization/application_localizations.dart';
import 'package:flutter_virtual_live/ui/home/user_profile.dart';
import '../../utils/component/text/large_text.dart';
import '../../utils/component/text/small_text.dart';
import '../../utils/constant/assets_const.dart';
import '../../utils/helper/app_colors.dart';

class TagPage extends StatefulWidget {
  const TagPage({Key? key}) : super(key: key);

  @override
  State<TagPage> createState() => _TagPageState();
}

class _TagPageState extends State<TagPage> {
  int count = 1;
  List<Map<String, dynamic>> serviceList = [
    {"title": "#Music", "isSelect": false},
    {"title": "#Dance", "isSelect": false},
    {"title": "#Active", "isSelect": false},
    {"title": "#Warm", "isSelect": false},
    {"title": "#Lonely", "isSelect": false},
    {"title": "#Adventure", "isSelect": false},
    {"title": "#Party", "isSelect": false},
    {"title": "#Shy", "isSelect": false},
    {"title": "#Gaming", "isSelect": false},
    {"title": "Single", "isSelect": false},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: _getBody(),
    );
  }

  _getBody() {
    return Container(
      decoration: (AppColors.backGroundColor()),
      child: SafeArea(
          child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * .9519,
            width: double.infinity,
            child: Stack(children: [
              Container(
                height: 200,
                width: double.infinity,
                decoration: (const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      AppColors.backgroundColor1,
                      AppColors.backgroundColor2
                    ],
                  ),
                )),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const UserProfilePage()));
                      },
                      child: Align(
                        alignment: FractionalOffset.topRight,
                        child: Container(
                          margin: const EdgeInsets.only(right: 18),
                          height: 30,
                          width: 62,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: AppColors.whiteColor20,
                              borderRadius: BorderRadius.circular(6)),
                          child: Center(
                            child: SmallText(
                              text: "skip".toLocalization(context),
                              color: AppColors.whiteColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    LargeText(
                      text: "selectYourInterest".toLocalization(context),
                      fontWeight: FontWeight.w400,
                      color: AppColors.whiteColor,
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 110,
                right: 0,
                left: 0,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20),
                  child: Container(
                    height: 30,
                    decoration: const BoxDecoration(
                        color: AppColors.whiteColor20,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(30.0),
                          topLeft: Radius.circular(30.0),
                        )),
                  ),
                ),
              ),
              Positioned(
                top: 120,
                right: 0,
                left: 0,
                child: Column(
                  children: [
                    Container(
                        height: MediaQuery.of(context).size.height,
                        width: double.infinity,
                        padding: EdgeInsets.zero,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(30.0),
                              topLeft: Radius.circular(30.0),
                            )),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Wrap(
                              children: List<Widget>.generate(
                                  serviceList.length, (index) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (count < 4) {
                                    serviceList[index]["isSelect"] =
                                        !serviceList[index]["isSelect"];
                                    if (serviceList[index]["isSelect"] ==
                                        true) {
                                      count++;
                                    } else {
                                      count--;
                                    }
                                  } else {
                                    if (count == 4 &&
                                        serviceList[index]["isSelect"] ==
                                            true) {
                                      count--;

                                      serviceList[index]["isSelect"] =
                                          !serviceList[index]["isSelect"];
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                        content: const Text(
                                            "Unblocked You can choose only 3 tags of your interest."),
                                        behavior: SnackBarBehavior.floating,
                                        margin: EdgeInsets.only(
                                          bottom: MediaQuery.of(context)
                                                  .size
                                                  .height -
                                              100,
                                          left: 10,
                                          right: 10,
                                        ),
                                      ));
                                    }
                                  }
                                });
                              },
                              child: Container(
                                height: 37,
                                margin: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 10),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 10),
                                decoration: serviceList[index]["isSelect"]
                                    ? BoxDecoration(
                                        image: const DecorationImage(
                                          image: AssetImage(
                                            buttonImage,
                                          ),
                                          fit: BoxFit.fill,
                                        ),
                                        borderRadius: BorderRadius.circular(30),
                                        border: Border.all(
                                            color: AppColors.borderColor),
                                      )
                                    : BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        border: Border.all(
                                            color: AppColors.borderColor),
                                      ),
                                child: SmallText(
                                  text: serviceList[index].values.first,
                                ),
                              ),
                            );
                          })),
                        )),
                  ],
                ),
              )
            ]),
          )
        ],
      )),
    );
  }
}
