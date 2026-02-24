import 'package:e_gram_panchayat/app/utility/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HisroryDeleteDialogScreen extends StatelessWidget {
  const HisroryDeleteDialogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        decoration: BoxDecoration(
          color: tertiary,
          borderRadius: BorderRadius.circular(Get.height / 29.07),
        ),
        child: Padding(
          padding: EdgeInsets.all(Get.height / 44.47),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/images/Trash.png',
                height: Get.height / 12.81,
                width: Get.height / 12.81,
              ),
              SizedBox(height: Get.height / 58.15),
              Text(
                'Confirm Delete?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xffFF0000),
                  fontSize: Get.height / 47.25,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Krub',
                ),
              ),
              SizedBox(height: Get.height / 58.15),
              Text(
                'Are you sure you want to delete this record? This action cannot be undone.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: darkgray,
                  fontSize: Get.height / 54,
                  fontFamily: 'Krub',
                ),
              ),
              SizedBox(height: Get.height / 44.47),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        height: Get.height / 16.8,
                        decoration: BoxDecoration(
                          color: lightgray,
                          borderRadius: BorderRadius.circular(
                            Get.height / 47.25,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'Cancel',
                            style: TextStyle(
                              color: dark,
                              fontSize: Get.height / 47.25,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Krub',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: Get.height / 37.8),
                  Expanded(
                    child: Container(
                      height: Get.height / 16.8,
                      decoration: BoxDecoration(
                        color: primary,
                        borderRadius: BorderRadius.circular(Get.height / 47.25),
                      ),
                      child: Center(
                        child: Text(
                          'Delete',
                          style: TextStyle(
                            color: tertiary,
                            fontSize: Get.height / 47.25,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Krub',
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
