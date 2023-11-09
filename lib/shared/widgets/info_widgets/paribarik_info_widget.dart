import 'package:flutter/material.dart';
import '../../utils/colors.dart';
import '../medium_text_widget.dart';
import '../table_widget.dart';

class ParibarikInfoWidget extends StatelessWidget {
  const ParibarikInfoWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.all(0),
          padding: const EdgeInsets.all(5),
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
          height: 360,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(),
                  Container(
                    height: 40,
                    width: 150,
                    decoration: BoxDecoration(
                      color: Colors.redAccent,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: MediumSizeText(
                        text: "নতুন তথ্য যোগ করুন",
                        size: 14,
                        weight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const TableWidget(),
            ],
          ),
        ),
        const SizedBox(
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
