import 'package:e_gram_panchayat/app/home/home_controler.dart';
import 'package:e_gram_panchayat/app/utility/theme.dart';
import 'package:e_gram_panchayat/app/utility/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize Controller

    final controller = Get.put(HomeControler());

    return Scaffold(
      backgroundColor: primary,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(children: [header(), formsection(controller)]),
            ),
            bottomnewbar(),
          ],
        ),
      ),
    );
  }
}

//<=============== HEADER SECTION ===============>

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
//<=============== FORM SECTION  ===============>

Widget formsection(HomeControler controller) {
  return Container(
    width: Get.width,

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
          //<=============== Village Field  ===============>
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
              controller: controller.village,
              onChanged: (value) {
                controller.validatevillage(value);
              },

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
          Obx(
            () => controller.villageError.value == ""
                ? SizedBox.shrink()
                : Padding(
                    padding: EdgeInsets.only(top: Get.height / 108),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        controller.villageError.value,
                        style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: Get.height / 81,
                          fontWeight: FontWeight.w400,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
          ),
          SizedBox(height: Get.height / 37.8),
          //<=============== Taluka Field ===============>
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
              controller: controller.taluka,
              onChanged: (value) {
                controller.validatetaluka(value);
              },
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
          Obx(
            () => controller.talukaError.value == ""
                ? SizedBox.shrink()
                : Padding(
                    padding: EdgeInsets.only(top: Get.height / 108),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        controller.talukaError.value,
                        style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: Get.height / 81,
                          fontWeight: FontWeight.w400,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
          ),
          SizedBox(height: Get.height / 37.8),
          //<=============== District Field  ===============>
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
              controller: controller.district,
              onChanged: (value) {
                controller.validatedistrict(value);
              },
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
          Obx(
            () => controller.districtError.value == ""
                ? SizedBox.shrink()
                : Padding(
                    padding: EdgeInsets.only(top: Get.height / 108),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        controller.districtError.value,
                        style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: Get.height / 81,
                          fontWeight: FontWeight.w400,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
          ),
          SizedBox(height: Get.height / 37.8),
          //<=============== Description One Field  ===============>
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
              controller: controller.descriptionOne,
              onChanged: (value) {
                controller.validatedescriptionOne(value);
              },
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
          Obx(
            () => controller.descriptionOneError.value == ""
                ? SizedBox.shrink()
                : Padding(
                    padding: EdgeInsets.only(top: Get.height / 108),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        controller.descriptionOneError.value,
                        style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: Get.height / 81,
                          fontWeight: FontWeight.w400,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
          ),

          SizedBox(height: Get.height / 37.8),
          //<=============== Description Two Field ===============>
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
              controller: controller.descriptionTwo,
              onChanged: (value) {
                controller.validatedescriptionTwo(value);
              },
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
          Obx(
            () => controller.descriptionTwoError.value == ""
                ? SizedBox.shrink()
                : Padding(
                    padding: EdgeInsets.only(top: Get.height / 108),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        controller.descriptionTwoError.value,
                        style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: Get.height / 81,
                          fontWeight: FontWeight.w400,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
          ),
          SizedBox(height: Get.height / 37.8),
          //<=============== Description Three Field  ===============>
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
              controller: controller.descriptionThree,
              onChanged: (value) {
                controller.validatedescriptionThree(value);
              },
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
          Obx(
            () => controller.descriptionThreeError.value == ""
                ? SizedBox.shrink()
                : Padding(
                    padding: EdgeInsets.only(top: Get.height / 108),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        controller.descriptionThreeError.value,
                        style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: Get.height / 81,
                          fontWeight: FontWeight.w400,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
          ),
          SizedBox(height: Get.height / 37.8),
          //<=============== Description Four Field ===============>
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
              controller: controller.descriptionFour,
              onChanged: (value) {
                controller.validatedescriptionFour(value);
              },
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
          Obx(
            () => controller.descriptionFourError.value == ""
                ? SizedBox.shrink()
                : Padding(
                    padding: EdgeInsets.only(top: Get.height / 108),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        controller.descriptionFourError.value,
                        style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: Get.height / 81,
                          fontWeight: FontWeight.w400,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
          ),
          SizedBox(height: Get.height / 32.8),
          //<=============== Payment Option Selection  ===============>
          Row(
            children: [
              //<===============  Cash Option ===============>
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
              //<===============  Cheque Option  ===============>
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

          /// ================= Cheque Details Section =================
          Obx(
            () => controller.selectedType.value == 'Cheque'
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //<=============== Cheque Number Field ===============>
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

                      //<=============== Bank Name Field ===============>
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

                      //<===============  Cheque Date Field ===============>
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

          //<===============   Save Button ===============>
          GestureDetector(
            onTap: () {
              controller.saveUserData();
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
//<============ Bottom Navigation Bar ==================>

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
          //<============ Home Button ==================>
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
          //<============ History Button ==================>
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
