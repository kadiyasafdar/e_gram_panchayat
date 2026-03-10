import 'package:e_gram_panchayat/app/history/history_List.dart';
import 'package:e_gram_panchayat/app/history/history_search_bottomsheet.dart';
import 'package:e_gram_panchayat/app/history/history_controller.dart';
import 'package:e_gram_panchayat/app/utility/routes.dart';
import 'package:e_gram_panchayat/app/utility/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Controller Import
    final controller = Get.put(HistoryController());

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: primary,
        body: SafeArea(
          child: Column(
            children: [
              // Header Design
              historyHeaderWidget(),

              // History List Box Design
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(
                    left: Get.width / 18,
                    right: Get.width / 18,
                    top: Get.height / 75.6,
                  ),
                  width: Get.width,
                  decoration: BoxDecoration(
                    color: tertiary,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(Get.height / 18.57),
                      topRight: Radius.circular(Get.height / 18.57),
                    ),
                  ),
                  child: Obx(
                    () => controller.isLoading.value
                        ? invoiceListShimmerWidget()
                        : controller.historyList.isEmpty &&
                              !controller.isLoading.value
                        ? noDataFoundWidget()
                        : HistoryInvoiceList(),
                  ),
                ),
              ),

              // Footer Tabs
              footerTabWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

// History Header Widget Design

Widget historyHeaderWidget() {
  return Padding(
    padding: EdgeInsets.only(
      // top: Get.height / 18.57,
      top: Get.height / 37.8,
      bottom: Get.height / 31.5,
      right: Get.width / 18,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(),

        // Title
        Text(
          'History',
          style: TextStyle(
            color: lightgray,
            fontFamily: 'krub',
            fontWeight: FontWeight.w700,
            fontSize: Get.height / 34.32,
          ),
        ),

        // Filter Search Icon
        GestureDetector(
          onTap: () {
            Get.bottomSheet(HistoryBottomsheetScreen());
          },
          child: Container(
            padding: EdgeInsets.all(8),
            width: Get.height / 21.4,
            height: Get.height / 21.4,
            decoration: BoxDecoration(
              color: lightgray.withOpacity(0.2),
              borderRadius: BorderRadius.circular(Get.height / 7.58),
            ),
            child: Image.asset(
              width: Get.height / 75.6,
              'assets/images/history_filter_icon.png',
            ),
          ),
        ),
      ],
    ),
  );
}

// Footer Tab Widget Design

Widget footerTabWidget() {
  return Padding(
    padding: EdgeInsets.only(
      top: Get.height / 37.8,
      bottom: Get.height / 37.8,
      left: Get.width / 14.4,
      right: Get.width / 14.4,
    ),
    child: Row(
      children: [
        // Home Tab
        Expanded(
          child: GestureDetector(
            onTap: () {
              Get.offAllNamed(AppRouter.home);
            },
            child: Container(
              height: Get.height / 12.84,
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(width: 1, color: lightgray),
                borderRadius: BorderRadius.circular(Get.height / 29.05),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    width: Get.height / 31.5,
                    'assets/images/home_icon_active.png',
                  ),
                  SizedBox(width: Get.height / 75.6),
                  Text(
                    'Home',
                    style: TextStyle(
                      color: lightgray,
                      fontSize: Get.height / 42,
                      fontFamily: 'krub',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

        SizedBox(width: Get.height / 50.4),

        // History Tab
        Expanded(
          child: GestureDetector(
            onTap: () {
              Get.offAllNamed(AppRouter.history);
            },
            child: Container(
              height: Get.height / 12.84,
              decoration: BoxDecoration(
                color: lightgray,
                borderRadius: BorderRadius.circular(Get.height / 29.05),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    width: Get.height / 31.5,
                    'assets/images/history_icon_active.png',
                  ),
                  SizedBox(width: Get.height / 75.6),
                  Text(
                    'History',
                    style: TextStyle(
                      color: primary,
                      fontSize: Get.height / 42,
                      fontFamily: 'krub',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

// No Data Found Widget

Widget noDataFoundWidget() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      // Image Icon
      Image.asset(width: Get.height / 3.78, 'assets/images/empty_icon.png'),

      SizedBox(height: Get.height / 50.4),

      // Title Text
      Text(
        'Currently Empty',
        style: TextStyle(
          color: dark,
          fontSize: Get.height / 34.32,
          fontFamily: 'krub',
          fontWeight: FontWeight.w700,
        ),
        textAlign: TextAlign.center,
      ),

      SizedBox(height: Get.height / 50.4),

      Text(
        'No history data available for E-Gram Panchayat. Stay tuned for updates on its evolution, governance, digital transformation, and rural development initiatives.',
        style: TextStyle(
          color: dark.withOpacity(0.5),
          fontSize: Get.height / 54,
          fontFamily: 'krub',
          fontWeight: FontWeight.w400,
        ),
        textAlign: TextAlign.center,
      ),
    ],
  );
}

// Invoice List Shimmer Widget Design

Widget invoiceListShimmerWidget() {
  return SingleChildScrollView(
    child: Column(
      children: List.generate(7, (index) {
        return Column(
          children: [
            Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                width: double.infinity,
                height: Get.height / 5.04,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Get.height / 47.25),
                  color: Colors.grey[300],
                ),
              ),
            ),
            SizedBox(height: Get.height / 50.4),
          ],
        );
      }),
    ),
  );
}
