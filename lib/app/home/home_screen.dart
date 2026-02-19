import 'package:e_gram_panchayat/app/home/home_controler.dart';
import 'package:e_gram_panchayat/app/utility/colors.dart';
import 'package:e_gram_panchayat/app/utility/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeControler());

    return Scaffold(
      backgroundColor: primary,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [header(), customTextField(controller)],
              ),
            ),
            bottomnewbar(),
          ],
        ),
      ),
    );
  }
}

//<=============== header ===============>

Widget header() {
  return Column(
    children: [
      Center(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: Get.height / 37.8),
          child: Text(
            'Fill-up Form',
            style: TextStyle(
              color: tertiary,
              fontSize: Get.height / 34.36,
              fontWeight: FontWeight.w700,
              fontFamily: 'Krub',
            ),
          ),
        ),
      ),
    ],
  );
}
//<=============== customTextField ===============>

Widget customTextField(HomeControler controller) {
  return Container(
    width: Get.width,
    constraints: BoxConstraints(minHeight: Get.height),
    decoration: BoxDecoration(
      color: tertiary,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(Get.height / 18.9),
        topRight: Radius.circular(Get.height / 18.9),
      ),
    ),
    child: Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Get.height / 37.8,
        vertical: Get.height / 25.2,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //<=============== Village (Gram Panchayat) ===============>
          Text(
            'Village (Gram Panchayat)',
            style: TextStyle(
              color: dark,
              fontSize: Get.height / 50.4,
              fontWeight: FontWeight.w500,
              fontFamily: 'Krub',
            ),
          ),
          SizedBox(height: Get.height / 84),

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
                hintText: 'Enter village name',
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
          //<=============== Taluka===============>
          Text(
            'Taluka',
            style: TextStyle(
              color: dark,
              fontSize: Get.height / 50.4,
              fontWeight: FontWeight.w500,
              fontFamily: 'Krub',
            ),
          ),
          SizedBox(height: Get.height / 84),

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
                hintText: 'Enter taluka name',
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
          //<=============== District ===============>
          Text(
            'District',
            style: TextStyle(
              color: dark,
              fontSize: Get.height / 50.4,
              fontWeight: FontWeight.w500,
              fontFamily: 'Krub',
            ),
          ),
          SizedBox(height: Get.height / 84),

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
                hintText: 'Enter district name',
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
          //<=============== Description One ===============>
          Text(
            'Description One',
            style: TextStyle(
              color: dark,
              fontSize: Get.height / 50.4,
              fontWeight: FontWeight.w500,
              fontFamily: 'Krub',
            ),
          ),
          SizedBox(height: Get.height / 84),

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
                hintText: 'Enter description Price',
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
          //<=============== Description Two ===============>
          Text(
            'Description Two',
            style: TextStyle(
              color: dark,
              fontSize: Get.height / 50.4,
              fontWeight: FontWeight.w500,
              fontFamily: 'Krub',
            ),
          ),
          SizedBox(height: Get.height / 84),

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
                hintText: 'Enter description Price',
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
          //<=============== Description Three  ===============>
          Text(
            'Description Three',
            style: TextStyle(
              color: dark,
              fontSize: Get.height / 50.4,
              fontWeight: FontWeight.w500,
              fontFamily: 'Krub',
            ),
          ),
          SizedBox(height: Get.height / 84),

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
                hintText: 'Enter description Price',
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
          //<=============== Description Four ===============>
          Text(
            'Description Four',
            style: TextStyle(
              color: dark,
              fontSize: Get.height / 50.4,
              fontWeight: FontWeight.w500,
              fontFamily: 'Krub',
            ),
          ),
          SizedBox(height: Get.height / 84),

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
                hintText: 'Enter description Price',
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
          SizedBox(height: Get.height / 32.8),
          //<=============== PaymentOptionSelector ===============>
          Row(
            children: [
              //<===============  CASH   ===============>
              Obx(
                () => GestureDetector(
                  onTap: () => controller.changeType('Cash'),
                  child: Row(
                    children: [
                      Image.asset(
                        controller.selectedType.value == 'Cash'
                            ? 'assets/images/check_box.png'
                            : 'assets/images/check_box_outline_blank.png',
                        height: Get.height / 37.8,
                        width: Get.height / 37.8,
                      ),

                      SizedBox(width: Get.height / 94.5),
                      Text(
                        "Cash",
                        style: TextStyle(
                          color: dark,
                          fontSize: Get.height / 54,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Krub',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: Get.height / 29.07),
              //<===============  CHEQUE  ===============>
              Obx(
                () => GestureDetector(
                  onTap: () => controller.changeType('Cheque'),
                  child: Row(
                    children: [
                      Image.asset(
                        controller.selectedType.value == 'Cheque'
                            ? 'assets/images/check_box.png'
                            : 'assets/images/check_box_outline_blank.png',
                        height: Get.height / 37.8,
                        width: Get.height / 37.8,
                      ),

                      SizedBox(width: Get.height / 94.5),
                      Text(
                        "Cheque",
                        style: TextStyle(
                          color: dark,
                          fontSize: Get.height / 54,
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
          SizedBox(height: Get.height / 34.36),

          /// ================= CHEQUE FORM =================
          Obx(
            () => controller.selectedType.value == 'Cheque'
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //<=============== cheque or draft number ===============>
                      Text(
                        'Cheque / Draft No',
                        style: TextStyle(
                          color: dark,
                          fontSize: Get.height / 50.4,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Krub',
                        ),
                      ),
                      SizedBox(height: Get.height / 84),
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
                            hintText: 'Enter cheque or draft number',
                            hintStyle: TextStyle(
                              color: darkgray,
                              fontSize: Get.height / 58.1,
                              fontFamily: 'Krub',
                            ),
                            filled: true,
                            fillColor: lightgray,
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                Get.height / 54,
                              ),
                              borderSide: BorderSide(
                                color: primary,
                                width: Get.height / 756,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                Get.height / 54,
                              ),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: Get.height / 37.8),

                      //<=============== Bank Name ===============>
                      Text(
                        'Bank Name',
                        style: TextStyle(
                          color: dark,
                          fontSize: Get.height / 50.4,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Krub',
                        ),
                      ),
                      SizedBox(height: Get.height / 84),
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
                            hintText: 'Enter bank name',
                            hintStyle: TextStyle(
                              color: darkgray,
                              fontSize: Get.height / 58.1,
                              fontFamily: 'Krub',
                            ),
                            filled: true,
                            fillColor: lightgray,
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                Get.height / 54,
                              ),
                              borderSide: BorderSide(
                                color: primary,
                                width: Get.height / 756,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                Get.height / 54,
                              ),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: Get.height / 37.8),

                      //<===============  date ===============>
                      Text(
                        'Date',
                        style: TextStyle(
                          color: dark,
                          fontSize: Get.height / 50.4,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Krub',
                        ),
                      ),
                      SizedBox(height: Get.height / 84),
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
                              size: 22,
                              color: dark,
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
                              borderRadius: BorderRadius.circular(
                                Get.height / 54,
                              ),
                              borderSide: BorderSide(
                                color: primary,
                                width: Get.height / 756,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                Get.height / 54,
                              ),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                : const SizedBox(),
          ),
          SizedBox(height: Get.height / 32.8),
          GestureDetector(
            onTap: () {
              Get.toNamed(AppRouter.history);
            },
            child: Container(
              width: Get.width,
              height: Get.height / 13.7,
              decoration: BoxDecoration(
                color: primary,
                borderRadius: BorderRadius.circular(Get.height / 37.8),
              ),
              child: Center(
                child: Text(
                  'Save',
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
          SizedBox(height: Get.height / 32.8),
        ],
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
          Expanded(
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
          SizedBox(width: Get.height / 37.8),
          Expanded(
            child: GestureDetector(
              onTap: () {
                Get.toNamed(AppRouter.history);
              },
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
          ),
        ],
      ),
    ),
  );
}
