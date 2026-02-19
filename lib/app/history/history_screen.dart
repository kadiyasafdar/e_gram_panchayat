import 'package:e_gram_panchayat/app/history/hisrory_delete_dialog_screen.dart';
import 'package:e_gram_panchayat/app/history/history_bottomsheet_screen.dart';
import 'package:e_gram_panchayat/app/utility/colors.dart';
import 'package:e_gram_panchayat/app/utility/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(children: [header(), innvoiceHistoryItem()]),
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
  return Padding(
    padding: EdgeInsets.all(Get.height / 37.8),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,

      children: [
        Text('data', style: TextStyle(color: primary)),
        Text(
          'History',
          style: TextStyle(
            color: tertiary,
            fontSize: Get.height / 34.36,
            fontWeight: FontWeight.w700,
            fontFamily: 'Krub',
          ),
        ),
        //<=============== history bottom sheet ===============>
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

//<=============== InnvoiceHistoryItem ===============>

Widget innvoiceHistoryItem() {
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
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          //<===============  InvoiceCard1234  ===============>
          Container(
            width: Get.width,
            height: Get.height / 4.9,
            decoration: BoxDecoration(
              color: Color(0xffF2E3F3),
              borderRadius: BorderRadius.circular(Get.height / 25.2),
            ),
            child: Padding(
              padding: EdgeInsets.all(Get.height / 37.8),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Invoice No : 1234',
                            style: TextStyle(
                              color: dark,
                              fontSize: Get.height / 42,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'Krub',
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Image.asset(
                            'assets/images/border_color.png',
                            width: Get.height / 42,
                            height: Get.height / 42,
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
                          //<=============== Hisrory Delete Dialog ===============>
                          GestureDetector(
                            onTap: () {
                              Get.dialog(HisroryDeleteDialogScreen());
                            },
                            child: Icon(
                              Icons.delete_forever_rounded,
                              size: Get.height / 42,
                              color: Color(0xffFF0000),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: Get.height / 126),
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
                        '10 Feb 2025',
                        style: TextStyle(
                          color: darkgray,
                          fontSize: Get.height / 50.4,

                          fontFamily: 'Krub',
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: Get.height / 50.4),
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
            ),
          ),
          SizedBox(height: Get.height / 37.8),
          //<===============  InvoiceCard 4567 ===============>
          Container(
            width: Get.width,
            height: Get.height / 4.9,
            decoration: BoxDecoration(
              color: Color(0xffEAEBDB),
              borderRadius: BorderRadius.circular(Get.height / 25.2),
            ),
            child: Padding(
              padding: EdgeInsets.all(Get.height / 37.8),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Invoice No : 4567',
                            style: TextStyle(
                              color: dark,
                              fontSize: Get.height / 42,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'Krub',
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Image.asset(
                            'assets/images/border_color.png',
                            width: Get.height / 42,
                            height: Get.height / 42,
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
                          //<=============== Hisrory Delete Dialog ===============>
                          GestureDetector(
                            onTap: () {
                              Get.dialog(HisroryDeleteDialogScreen());
                            },
                            child: Icon(
                              Icons.delete_forever_rounded,
                              size: Get.height / 42,
                              color: Color(0xffFF0000),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: Get.height / 126),
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
                        '10 Feb 2025',
                        style: TextStyle(
                          color: darkgray,
                          fontSize: Get.height / 50.4,

                          fontFamily: 'Krub',
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: Get.height / 50.4),
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
            ),
          ),
          SizedBox(height: Get.height / 37.8),
          //<===============  InvoiceCard 8652 ===============>
          Container(
            width: Get.width,
            height: Get.height / 4.9,
            decoration: BoxDecoration(
              color: Color(0xffDFF3E3),
              borderRadius: BorderRadius.circular(Get.height / 25.2),
            ),
            child: Padding(
              padding: EdgeInsets.all(Get.height / 37.8),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Invoice No : 8652',
                            style: TextStyle(
                              color: dark,
                              fontSize: Get.height / 42,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'Krub',
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Image.asset(
                            'assets/images/border_color.png',
                            width: Get.height / 42,
                            height: Get.height / 42,
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
                          //<=============== Hisrory Delete Dialog ===============>
                          GestureDetector(
                            onTap: () {
                              Get.dialog(HisroryDeleteDialogScreen());
                            },
                            child: Icon(
                              Icons.delete_forever_rounded,
                              size: Get.height / 42,
                              color: Color(0xffFF0000),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: Get.height / 126),
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
                        '10 Feb 2025',
                        style: TextStyle(
                          color: darkgray,
                          fontSize: Get.height / 50.4,

                          fontFamily: 'Krub',
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: Get.height / 50.4),
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
            ),
          ),
          SizedBox(height: Get.height / 37.8),
          //<===============  InvoiceCard 1256 ===============>
          Container(
            width: Get.width,
            height: Get.height / 4.9,
            decoration: BoxDecoration(
              color: Color(0xffE3F2FD),
              borderRadius: BorderRadius.circular(Get.height / 25.2),
            ),
            child: Padding(
              padding: EdgeInsets.all(Get.height / 37.8),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Invoice No : 1256',
                            style: TextStyle(
                              color: dark,
                              fontSize: Get.height / 42,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'Krub',
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Image.asset(
                            'assets/images/border_color.png',
                            width: Get.height / 42,
                            height: Get.height / 42,
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
                          //<=============== Hisrory Delete Dialog ===============>
                          GestureDetector(
                            onTap: () {
                              Get.dialog(HisroryDeleteDialogScreen());
                            },
                            child: Icon(
                              Icons.delete_forever_rounded,
                              size: Get.height / 42,
                              color: Color(0xffFF0000),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: Get.height / 126),
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
                        '10 Feb 2025',
                        style: TextStyle(
                          color: darkgray,
                          fontSize: Get.height / 50.4,

                          fontFamily: 'Krub',
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: Get.height / 50.4),
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
            ),
          ),
          SizedBox(height: Get.height / 37.8),
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
