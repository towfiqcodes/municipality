import 'package:Pourosova/shared/widgets/custom_text.dart';
import 'package:flutter/material.dart';

import '../../modules/home/new_designs/dropdown_item_model.dart';

Widget singleFormField(
    {required String headline,
      FontWeight headlineWeight = FontWeight.w700,
      double headlineFontSize = 14,
      bool isDropdownList = false,
      bool isMandatory = true,
      List<DropdownItemModel> dropdownList = const [],
      DropdownItemModel? selectedValue,
      String hint = "",
      IconData? suffixIcon,
      Function(DropdownItemModel?)? dropdownOnChanged,
      bool isEnable = true, TextEditingController? controller, Function()? onTap}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 15),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(text: TextSpan(
          style: TextStyle(color: Colors.black, fontSize: headlineFontSize, fontWeight: headlineWeight),
          children: <TextSpan>[
            TextSpan(text: "$headline "),
            TextSpan(text: '*', style: TextStyle(color: Colors.red.shade900,) ),
          ],
        )),
        const SizedBox(height: 6),
        if (isDropdownList)
          SizedBox(
            height: 40,
            child: DropdownButtonFormField<DropdownItemModel>(
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: const BorderSide(color: Color(0xffCCCCCC), width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: const BorderSide(color: Color(0xffCCCCCC), width: 1),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: const BorderSide(color: Color(0xffCCCCCC), width: 1),
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10)),
              dropdownColor: Colors.grey.shade200,
              icon: const Icon(
                Icons.keyboard_arrow_down_sharp,
                color: Color(0xff444547),
                size: 24,
              ),
              hint: CustomText(text: hint, color: Colors.black),
              items: dropdownList.map<DropdownMenuItem<DropdownItemModel>>((DropdownItemModel value) {
                return DropdownMenuItem<DropdownItemModel>(
                  value: value,
                  child: CustomText(text: value.value, fontSize: 14, color: const Color(0xff070501)),
                );
              }).toList(),
              onChanged: dropdownOnChanged,
              value: selectedValue,
            ),
          ),
        if (!isDropdownList)
          GestureDetector(
            onTap: isEnable? null : onTap,
            child: SizedBox(
              height: 40,
              child: TextFormField(
                controller: controller,
                cursorColor: Colors.black,
                enabled: isEnable,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                  fontSize: 14
                ),
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: const BorderSide(color: Color(0xffCCCCCC), width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: const BorderSide(color: Color(0xffCCCCCC), width: 1),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: const BorderSide(color: Color(0xffCCCCCC), width: 1),
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    hintText: hint,
                    suffixIcon: suffixIcon != null
                        ? Icon(
                      suffixIcon,
                      color: Colors.black,
                      size: 16,
                    )
                        : null,
                    hintStyle: const TextStyle(color: Colors.grey, fontSize: 14)),
              ),
            ),
          )
      ],
    ),
  );
}