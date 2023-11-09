import 'package:flutter/material.dart';
import '../../utils/colors.dart';
import '../medium_text_widget.dart';
import '../small_text_widget.dart';

class OnnanoInfoWidget extends StatelessWidget {
  const OnnanoInfoWidget({
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
                        text: "বৈদ্যুতিক আবস্থা",
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
                      hintText: 'হ্যাঁ',
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      SmallSizeText(
                        text: "স্যানিটেশনের অবস্থা",
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
                      hintText: 'পাকা',
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      SmallSizeText(
                        text: "বাড়ির ধরন",
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
                      hintText: 'নপাকা বাড়ি',
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      SmallSizeText(
                        text: "মোট বাড়ি",
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
                        text: "পেশা",
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
                      hintText: 'প্রবাসী',
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      SmallSizeText(
                        text: "শেষ ট্যাক্স প্রদানের অর্থ বছর",
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
        ),
      ],
    );
  }
}
