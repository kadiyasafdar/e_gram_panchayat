import 'package:e_gram_panchayat/app/history/hisrory_delete_dialog_screen.dart';
import 'package:e_gram_panchayat/app/history/history_bottomsheet_screen.dart';
import 'package:e_gram_panchayat/app/history/history_controller.dart';
import 'package:e_gram_panchayat/app/home/home_controller.dart';
import 'package:e_gram_panchayat/app/utility/theme.dart';
import 'package:e_gram_panchayat/app/utility/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Main History Screen
class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HistoryController());

    return Scaffold(
      backgroundColor: primary,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [header(), innvoiceHistoryItem(controller)],
              ),
            ),
            bottomnewbar(),
          ],
        ),
      ),
    );
  }
}

//<=============== Header Section  ===============>

Widget header() {
  return Padding(
    padding: EdgeInsets.all(Get.height / 37.8),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(width: Get.height / 47.25, height: Get.height / 47.25),

        Text(
          'History',
          style: TextStyle(
            color: tertiary,
            fontSize: Get.height / 34.36,
            fontWeight: FontWeight.w700,
            fontFamily: 'Krub',
          ),
        ),

        GestureDetector(
          onTap: () {
            Get.bottomSheet(HistoryBottomsheetScreen());
          },
          child: Container(
            decoration: BoxDecoration(
              color: gray.withValues(alpha: 0.5),
              borderRadius: BorderRadius.circular(100),
            ),
            child: Padding(
              padding: EdgeInsets.all(Get.height / 108),
              child: Image.asset(
                'assets/images/instant_mix.png',
                width: Get.height / 47.25,
                height: Get.height / 47.25,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

//<=============== Invoice List Section ===============>

Widget innvoiceHistoryItem(HistoryController controller) {
  return Container(
    width: Get.width,
    height: Get.height / 0.88,
    decoration: BoxDecoration(
      color: tertiary,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(Get.height / 18.9),
        topRight: Radius.circular(Get.height / 18.9),
      ),
    ),
    child: Padding(
      padding: EdgeInsets.all(Get.height / 37.8),
      child: Obx(
        () => ListView.builder(
          controller: controller.scrollController,
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          itemCount: controller.historyList.length,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(bottom: Get.height / 37.8),
              padding: EdgeInsets.all(Get.height / 37.8),
              decoration: BoxDecoration(
                color:
                    controller.colorList[index % controller.colorList.length],
                borderRadius: BorderRadius.circular(Get.height / 25.02),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Invoice Number + Icons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          'Invoice No : ${controller.historyList[index]['invoice_number']}',
                          style: TextStyle(
                            color: dark,
                            fontSize: Get.height / 42,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Krub',
                          ),
                        ),
                      ),

                      Row(
                        children: [
                          /// Edit
                          GestureDetector(
                            onTap: () {
                              Get.delete<HomeController>();

                              Get.toNamed(
                                AppRouter.home,
                                arguments: {
                                  'historyId': controller
                                      .historyList[index]['id']
                                      .toString(),
                                },
                              );
                            },
                            child: Image.asset(
                              'assets/images/border_color.png',
                              width: Get.height / 42,
                              height: Get.height / 42,
                            ),
                          ),

                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: Get.height / 126,
                            ),
                            child: Container(
                              width: Get.height / 630,
                              height: Get.height / 42,
                              color: tertiary,
                            ),
                          ),

                          /// Delete
                          GestureDetector(
                            onTap: () {
                              Get.dialog(HisroryDeleteDialogScreen());
                            },
                            child: Icon(
                              Icons.delete_forever_rounded,
                              size: Get.height / 42,
                              color: error,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  SizedBox(height: Get.height / 126),

                  /// Date
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/acute.png',
                        width: Get.height / 37.8,
                        height: Get.height / 37.8,
                        color: darkgray,
                      ),
                      SizedBox(width: Get.height / 75.6),

                      Text(
                        controller.historyList[index]['created_at'].toString(),
                        style: TextStyle(
                          color: darkgray,
                          fontSize: Get.height / 50.4,
                          fontFamily: 'Krub',
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: Get.height / 50.4),

                  /// Buttons
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: Get.height / 16.8,
                          decoration: BoxDecoration(
                            color: tertiary,
                            borderRadius: BorderRadius.circular(
                              Get.height / 47.25,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/Mask group.png',
                                height: Get.height / 37.8,
                                width: Get.height / 37.8,
                              ),
                              SizedBox(width: Get.height / 58.15),
                              Text(
                                'Invoice',
                                style: TextStyle(
                                  color: darkgray,
                                  fontSize: Get.height / 47.25,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Krub',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      SizedBox(width: Get.height / 58.15),

                      Expanded(
                        child: Container(
                          height: Get.height / 16.8,
                          decoration: BoxDecoration(
                            color: tertiary,
                            borderRadius: BorderRadius.circular(
                              Get.height / 47.25,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/Mask group.png',
                                height: Get.height / 37.8,
                                width: Get.height / 37.8,
                              ),
                              SizedBox(width: Get.height / 58.15),
                              Text(
                                'Receipt',
                                style: TextStyle(
                                  color: darkgray,
                                  fontSize: Get.height / 47.25,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Krub',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    ),
  );
}

//<============ bottom navigation bar section ==================>

Widget bottomnewbar() {
  return Container(
    width: Get.width,
    height: Get.height / 7.8,
    decoration: BoxDecoration(color: primary),
    child: Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Get.height / 25.2,
        vertical: Get.height / 37.8,
      ),
      child: Row(
        children: [
          /// Home Button
          Expanded(
            child: GestureDetector(
              onTap: () {
                Get.toNamed(AppRouter.home);
              },
              child: Container(
                height: Get.height / 13.5,
                decoration: BoxDecoration(
                  color: tertiary,
                  borderRadius: BorderRadius.circular(Get.height / 29.07),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/Frame.png',
                      height: Get.height / 31.5,
                      width: Get.height / 31.5,
                    ),
                    SizedBox(width: Get.height / 58.15),
                    Text(
                      'Home',
                      style: TextStyle(
                        color: primary,
                        fontSize: Get.height / 42,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Krub',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          SizedBox(width: Get.height / 37.8),

          /// History Button
          Expanded(
            child: Container(
              height: Get.height / 13.5,
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: tertiary),
                borderRadius: BorderRadius.circular(Get.height / 29.07),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/Frame (1).png',
                    height: Get.height / 31.5,
                    width: Get.height / 31.5,
                  ),
                  SizedBox(width: Get.height / 58.15),
                  Text(
                    'History',
                    style: TextStyle(
                      color: tertiary,
                      fontSize: Get.height / 42,
                      fontFamily: 'Krub',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
