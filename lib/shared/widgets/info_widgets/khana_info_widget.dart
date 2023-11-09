import 'package:flutter/material.dart';

import '../../utils/colors.dart';
import '../medium_text_widget.dart';
import '../small_text_widget.dart';

class KhanaInfoWidget extends StatefulWidget {
  const KhanaInfoWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<KhanaInfoWidget> createState() => _KhanaInfoWidgetState();
}

class _KhanaInfoWidgetState extends State<KhanaInfoWidget> {
  final holdingTypeController = TextEditingController();
  final nameController = TextEditingController();
  final guardianTypeController = TextEditingController();
  final guardianNameController = TextEditingController();
  final motherNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(0),
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
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
          height: 400,
          child: ListView(
            padding: const EdgeInsets.all(0),
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SmallSizeText(
                        text: "হোল্ডিং এর ধরন",
                        color: Colors.black,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Icon(
                        Icons.star,
                        size: 8,
                        color: Colors.red,
                      )
                    ],
                  ),
                  TextField(
                    controller: holdingTypeController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'আবাসিক হোল্ডিং',
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      SmallSizeText(
                        text: "সুবিধাভুগির নাম",
                        color: Colors.black,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Icon(
                        Icons.star,
                        size: 8,
                        color: Colors.red,
                      )
                    ],
                  ),
                  TextField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: '',
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      SmallSizeText(
                        text: "অভিভাবকের ধরন",
                        color: Colors.black,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Icon(
                        Icons.star,
                        size: 8,
                        color: Colors.red,
                      )
                    ],
                  ),
                  TextField(
                    controller: guardianTypeController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'পিতার নাম',
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      SmallSizeText(
                        text: "অভিভাবকের নাম",
                        color: Colors.black,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Icon(
                        Icons.star,
                        size: 8,
                        color: Colors.red,
                      )
                    ],
                  ),
                  TextField(
                    controller: guardianNameController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: '',
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      SmallSizeText(
                        text: "মায়ের নাম",
                        color: Colors.black,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Icon(
                        Icons.star,
                        size: 8,
                        color: Colors.red,
                      )
                    ],
                  ),
                  TextField(
                    controller: motherNameController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: '',
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      SmallSizeText(
                        text: "লিঙ্গ",
                        color: Colors.black,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Icon(
                        Icons.star,
                        size: 8,
                        color: Colors.red,
                      )
                    ],
                  ),
                  const TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'পুরুষ',
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      SmallSizeText(
                        text: "বৈবাহিক অবস্থা",
                        color: Colors.black,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Icon(
                        Icons.star,
                        size: 8,
                        color: Colors.red,
                      )
                    ],
                  ),
                  const TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'বিবাহিত',
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      SmallSizeText(
                        text: "জন্ম তারিখ",
                        color: Colors.black,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Icon(
                        Icons.star,
                        size: 8,
                        color: Colors.red,
                      )
                    ],
                  ),
                  const TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'dd/mm/yyy',
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      SmallSizeText(
                        text: "পরিচয়ের ধরন",
                        color: Colors.black,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Icon(
                        Icons.star,
                        size: 8,
                        color: Colors.red,
                      )
                    ],
                  ),
                  const TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'NID নাম্বার',
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      SmallSizeText(
                        text: "পরিচয় পত্রের নাম্বার",
                        color: Colors.black,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Icon(
                        Icons.star,
                        size: 8,
                        color: Colors.red,
                      )
                    ],
                  ),
                  const TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: '',
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      SmallSizeText(
                        text: "মোবাইল নাম্বার",
                        color: Colors.black,
                      ),
                      const SizedBox(
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
                        text: "ধর্ম",
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
                      hintText: 'ইসলাম',
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      SmallSizeText(
                        text: "পারিবারিক অবস্থার ধরন",
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
                      hintText: 'উচ্চ ভিত্ত',
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      SmallSizeText(
                        text: "পুরুষ সদস্য সংখ্যা",
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
        )
      ],
    );
  }
}
