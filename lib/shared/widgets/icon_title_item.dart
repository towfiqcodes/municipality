import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../shared.dart';

class IconTitleItem extends StatelessWidget {
  const  IconTitleItem({
    Key? key,
    this.onTap,
    this.title = "",
    this.subTitle = "",
    this.icon = "",
    this.backgroundColor = Colors.transparent,
    this.paddingTop = 8,
    this.padingBottom = 8,
    this.paddingLeft = 16,
    this.paddingRight = 32,
    this.marginTop = 10,
    this.marginBottom = 0,
    this.marginLeft = 0,
    this.marginRight = 0,
    this.drawablePadding = 10,
  }) : super(key: key);

  final Function()? onTap;
  final String icon;
  final String title;
  final String subTitle;
  final Color backgroundColor;

  final double paddingLeft, paddingTop, paddingRight, padingBottom;
  final double marginLeft, marginTop, marginRight, marginBottom;
  final double drawablePadding;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: MediaQuery.of(context).size.width*.46,
      margin:
      EdgeInsets.fromLTRB(marginLeft, marginTop, marginRight, marginBottom),
      child: Material(
        borderRadius: BorderRadius.circular(11),
        color: backgroundColor,
        child: InkWell(
          onTap: onTap,
          customBorder:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(11)),
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                paddingLeft, paddingTop, paddingRight, padingBottom),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      color: ColorConstants.darkGray),
                  child: Image.asset(icon),
                ),
                SizedBox(
                  width: drawablePadding,
                ),
                Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Text(
                            title,
                            style: GoogleFonts.roboto(
                                color: ColorConstants.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        // CommonWidget.rowHeight(height: 5),
                        Text(
                          subTitle,
                          style: GoogleFonts.roboto(
                              color: ColorConstants.white,
                              fontSize: 10,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

