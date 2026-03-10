import 'package:e_gram_panchayat/app/history/history_controller.dart';
import 'package:e_gram_panchayat/app/home/home_controller.dart';
import 'package:e_gram_panchayat/app/utility/model/delete_model.dart';
import 'package:e_gram_panchayat/app/utility/routes.dart';
import 'package:e_gram_panchayat/app/utility/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HistoryInvoiceList extends StatelessWidget {
  const HistoryInvoiceList({super.key});

  @override
  Widget build(BuildContext context) {
    // Controller Import
    final controller = Get.put(HistoryController());

    return Obx(
      () => ListView.builder(
        // Invoice List Box
        controller: controller.scrollController,
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.zero,
        itemCount: controller
            .historyList
            .length, // Set the item count to the length of your data
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                margin: EdgeInsets.only(
                  top: Get.height / 75.6,
                  bottom: Get.height / 75.6,
                ),
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color:
                      controller.colorList[index % controller.colorList.length],
                  borderRadius: BorderRadius.circular(Get.height / 25.02),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Invoice Number
                        Expanded(
                          child: Text(
                            'Invoice No : ${controller.historyList[index]['invoice_number'].toString()}',
                            style: TextStyle(
                              fontFamily: 'krub',
                              fontSize: Get.height / 42,
                              color: dark,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),

                        // Edit & Delete Icon
                        Row(
                          children: [
                            // Edit Icon
                            GestureDetector(
                              onTap: () {
                                if (Get.isSnackbarOpen) {
                                  return;
                                } else {
                                  Get.delete<
                                    HomeController
                                  >(); // Clear the cached controller
                                  Get.toNamed(
                                    AppRouter.home,
                                    arguments: {
                                      'historyId': controller
                                          .historyList[index]['id']
                                          .toString(),
                                    },
                                  );
                                }
                              },
                              child: Image.asset(
                                width: Get.height / 37.8,
                                'assets/images/edit_icon.png',
                              ),
                            ),

                            // Border Design
                            Container(
                              height: Get.height / 37.8,
                              margin: EdgeInsets.only(
                                left: Get.width / 45,
                                right: Get.width / 45,
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1,
                                  color: lightgray.withOpacity(0.6),
                                ),
                              ),
                            ),

                            // Delete Icon
                            GestureDetector(
                              onTap: () {
                                deletemodel();
                              },
                              child: Image.asset(
                                width: Get.height / 37.8,
                                'assets/images/delete_icon.png',
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    SizedBox(height: Get.height / 126),

                    // Date & Time
                    Row(
                      children: [
                        // Icon
                        Image.asset(
                          width: Get.height / 37.8,
                          'assets/images/time_icon.png',
                        ),

                        SizedBox(width: Get.height / 94.5),

                        // Text
                        Text(
                          controller.historyList[index]['created_at']
                              .toString(),
                          style: TextStyle(
                            fontFamily: 'krub',
                            fontSize: Get.height / 50.4,
                            color: dark,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: Get.height / 37.8),

                    // Download Button
                    Row(
                      children: [
                        // Invoice Button
                        Expanded(
                          child: GestureDetector(
                            onTap: () {},
                            child: Container(
                              height: Get.height / 16.32,
                              decoration: BoxDecoration(
                                color: lightgray,
                                borderRadius: BorderRadius.circular(
                                  Get.height / 47.25,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    width: Get.height / 37.8,
                                    'assets/images/download_icon.png',
                                  ),
                                  SizedBox(width: Get.height / 75.6),
                                  Text(
                                    'Invoice',
                                    style: TextStyle(
                                      color: dark.withOpacity(0.5),
                                      fontSize: Get.height / 47.25,
                                      fontFamily: 'krub',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),

                        SizedBox(width: Get.height / 75.6),

                        // Receipt Button
                        Expanded(
                          child: GestureDetector(
                            onTap: () {},
                            child: Container(
                              height: Get.height / 16.32,
                              decoration: BoxDecoration(
                                color: lightgray,
                                borderRadius: BorderRadius.circular(
                                  Get.height / 47.25,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    width: Get.height / 37.8,
                                    'assets/images/download_icon.png',
                                  ),
                                  SizedBox(width: Get.height / 75.6),
                                  Text(
                                    'Receipt',
                                    style: TextStyle(
                                      color: dark.withOpacity(0.5),
                                      fontSize: Get.height / 47.25,
                                      fontFamily: 'krub',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Obx(
                () =>
                    controller.historyList.length <
                        controller.getTotalCountInvoiceList.value
                    ? controller.isLoading.value &&
                              index == controller.historyList.length - 1
                          ? Padding(
                              padding: EdgeInsets.only(
                                bottom: Get.height / 37.8,
                                top: Get.height / 75.6,
                              ),
                              child: CircularProgressIndicator(color: primary),
                            )
                          : SizedBox()
                    : SizedBox(),
              ),
            ],
          );
        },
      ),
    );
  }
}
