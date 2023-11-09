import 'package:Pourosova/shared/shared.dart';
import 'package:Pourosova/shared/widgets/small_text_widget.dart';
import 'package:flutter/material.dart';


class ProfileIconTextWidget extends StatelessWidget {
  final IconData icon;
  final String text1;
  final String text2;
  const ProfileIconTextWidget({
    Key? key,
    required this.icon,
    required this.text1,
    required this.text2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 50,
      width: double.maxFinite,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(5),
            bottomRight: Radius.circular(5),
          )),
      child: Row(
        children: [
          Icon(
            icon,
            color: ColorConstants.primaryColor,
          ),
          SizedBox(
            width: 5,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SmallSizeText(
                text: text1,
                color: Colors.black,
              ),
              SmallSizeText(
                text: text2,
                color: Colors.black87,
              )
            ],
          ),
        ],
      ),
    );
  }
}
