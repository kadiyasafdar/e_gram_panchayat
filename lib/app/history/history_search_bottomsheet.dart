import 'package:e_gram_panchayat/app/utility/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HistoryBottomsheetScreen extends StatelessWidget {
  const HistoryBottomsheetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      decoration: BoxDecoration(
        color: tertiary,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(Get.height / 25.2),
          topRight: Radius.circular(Get.height / 25.2),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Header Section
          Container(
            width: Get.height,
            decoration: BoxDecoration(color: primary.withValues(alpha: 0.10)),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Get.height / 37.8,
                vertical: Get.height / 50.4,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Header Title
                  Text(
                    'Search',
                    style: TextStyle(
                      color: primary,
                      fontSize: Get.height / 50.4,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Krub',
                    ),
                  ),

                  // Close Button
                  GestureDetector(
                    onTap: () {
                      Get.back(); // Close bottom sheet
                    },
                    child: Icon(
                      Icons.close,
                      size: Get.height / 37.8,
                      color: primary,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Body Section
          Padding(
            padding: EdgeInsets.all(Get.height / 37.8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Invoice Number Label
                Text(
                  'Invoice Number',
                  style: TextStyle(
                    color: dark,
                    fontSize: Get.height / 54,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Krub',
                  ),
                ),

                SizedBox(height: Get.height / 84),

                // Invoice Number Input Field
                SizedBox(
                  height: Get.height / 16.8,
                  child: TextField(
                    cursorColor: dark,
                    style: TextStyle(
                      color: dark,
                      fontSize: Get.height / 50.4,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Krub',
                    ),
                    decoration: InputDecoration(
                      hintText: 'Enter Invoice Number',
                      hintStyle: TextStyle(
                        color: darkgray,
                        fontSize: Get.height / 58.1,
                        fontFamily: 'Krub',
                      ),
                      filled: true,
                      fillColor: lightgray,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(Get.height / 54),
                        borderSide: BorderSide(
                          color: primary,
                          width: Get.height / 756,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(Get.height / 54),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: Get.height / 37.8),

                // Date Label
                Text(
                  'Date',
                  style: TextStyle(
                    color: dark,
                    fontSize: Get.height / 54,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Krub',
                  ),
                ),

                SizedBox(height: Get.height / 84),

                // Date Input Field
                SizedBox(
                  height: Get.height / 16.8,
                  child: TextField(
                    cursorColor: dark,
                    style: TextStyle(
                      color: dark,
                      fontSize: Get.height / 50.4,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Krub',
                    ),
                    decoration: InputDecoration(
                      suffixIcon: Icon(
                        Icons.calendar_month_outlined,
                        color: darkgray,
                      ),
                      hintText: 'Select date',
                      hintStyle: TextStyle(
                        color: darkgray,
                        fontSize: Get.height / 58.1,
                        fontFamily: 'Krub',
                      ),
                      filled: true,
                      fillColor: lightgray,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(Get.height / 54),
                        borderSide: BorderSide(
                          color: primary,
                          width: Get.height / 756,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(Get.height / 54),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: Get.height / 37.8),

                // Action Buttons Row
                Row(
                  children: [
                    // Reset Button
                    Expanded(
                      child: Container(
                        height: Get.height / 15.75,
                        decoration: BoxDecoration(
                          color: lightgray,
                          borderRadius: BorderRadius.circular(
                            Get.height / 47.25,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Reset',
                              style: TextStyle(
                                color: dark,
                                fontSize: Get.height / 54,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Krub',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(width: Get.height / 37.8),

                    // Search Button
                    Expanded(
                      child: Container(
                        height: Get.height / 15.75,
                        decoration: BoxDecoration(
                          color: primary,
                          borderRadius: BorderRadius.circular(
                            Get.height / 47.25,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Search',
                              style: TextStyle(
                                color: tertiary,
                                fontSize: Get.height / 54,
                                fontWeight: FontWeight.w600,
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
          ),
        ],
      ),
    );
  }
}
