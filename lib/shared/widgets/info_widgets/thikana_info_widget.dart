import 'package:flutter/material.dart';
import '../../utils/colors.dart';
import '../medium_text_widget.dart';
import '../small_text_widget.dart';

class ThikanaInfoWidget extends StatelessWidget {
  const ThikanaInfoWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(0),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Colors.black38,
                width: 2,
              ),
              right: BorderSide(
                color: Colors.black38,
                width: 2,
              ),
              left: BorderSide(
                color: Colors.black38,
                width: 2,
              ),
            ),
          ),
          width: double.maxFinite,
          height: 500,
          child: ListView(
            padding: EdgeInsets.all(0),
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SmallSizeText(
                        text: "হোল্ডিং নাম্বার",
                        color: Colors.black,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Icon(
                        Icons.star,
                        size: 8,
                        color: Colors.red,
                      )
                    ],
                  ),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: '',
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      SmallSizeText(
                        text: "ওয়ার্ড নাম্বার",
                        color: Colors.black,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Icon(
                        Icons.star,
                        size: 8,
                        color: Colors.red,
                      )
                    ],
                  ),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'নির্বাচন করুন',
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      SmallSizeText(
                        text: "গ্রাম",
                        color: Colors.black,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Icon(
                        Icons.star,
                        size: 8,
                        color: Colors.red,
                      )
                    ],
                  ),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'নির্বাচন করুন',
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      SmallSizeText(
                        text: "পোস্টাল কোড / জিপ কোড",
                        color: Colors.black,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Icon(
                        Icons.star,
                        size: 8,
                        color: Colors.red,
                      )
                    ],
                  ),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'নির্বাচন করুন',
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      SmallSizeText(
                        text: "ডাকঘর",
                        color: Colors.black,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Icon(
                        Icons.star,
                        size: 8,
                        color: Colors.red,
                      )
                    ],
                  ),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'নির্বাচন করুন',
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      SmallSizeText(
                        text: "হোল্ডিং নাম্বার",
                        color: Colors.black,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Icon(
                        Icons.star,
                        size: 8,
                        color: Colors.red,
                      )
                    ],
                  ),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'নির্বাচন করুন',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MediumSizeText(
              text: "তালিকায় ফিরে যান",
              color: Colors.black,
              weight: FontWeight.w300,
              size: 16,
            ),
            Container(
              height: 40,
              width: 100,
              decoration: BoxDecoration(
                color: AppColors.mainColor,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Center(
                child: MediumSizeText(
                  text: "সংরক্ষন করুন",
                  size: 14,
                  weight: FontWeight.w300,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
