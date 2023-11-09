import 'package:Pourosova/shared/constants/constants.dart';
import 'package:Pourosova/shared/utils/common_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../blocs/totho/totho_bloc.dart';
import '../../../models/get_system/get_system_config_response.dart';
import '../../../shared/widgets/custom_text.dart';
import '../../../shared/widgets/single_form_field.dart';
import 'dropdown_item_model.dart';

class AddressInformation extends StatefulWidget {
  final GetSystemConfigData data;

  const AddressInformation({Key? key, required this.data}) : super(key: key);

  @override
  State<AddressInformation> createState() => _AddressInformationState();
}

class _AddressInformationState extends State<AddressInformation> {
  DropdownItemModel? selectedWord;
  DropdownItemModel? selectedVillage;
  DropdownItemModel? selectedPostalCode;
  DropdownItemModel? selectedPostOffice;
  List<DropdownItemModel> wordList = [];
  List<DropdownItemModel> villageList = [];
  List<DropdownItemModel> postalCodeList = [];
  List<DropdownItemModel> postOfficeList = [];
  final holdingNoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(border: Border.all(color: Colors.black38)),
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  singleFormField(headline: "হোল্ডিং নং", controller: holdingNoController),
                  singleFormField(
                      headline: "ওয়ার্ড নং",
                      isDropdownList: true,
                      hint: "নির্বাচন করুন",
                      dropdownList: wordList,
                      selectedValue: selectedWord,
                      dropdownOnChanged: (DropdownItemModel? newValue) {
                        setState(() {
                          selectedWord = newValue!;
                        });
                      }),
                  singleFormField(
                      headline: "গ্রাম",
                      isDropdownList: true,
                      hint: "নির্বাচন করুন",
                      dropdownList: villageList,
                      selectedValue: selectedVillage,
                      dropdownOnChanged: (DropdownItemModel? newValue) {
                        setState(() {
                          selectedVillage = newValue!;
                        });
                      }),
                  singleFormField(
                      headline: "পোস্টাল কোড / জিপ কোড",
                      isDropdownList: true,
                      hint: "নির্বাচন করুন",
                      dropdownList: postalCodeList,
                      selectedValue: selectedPostalCode,
                      dropdownOnChanged: (DropdownItemModel? newValue) {
                        setState(() {
                          selectedPostalCode = newValue!;
                        });
                      }),
                  singleFormField(
                      headline: "ডাকঘর",
                      isDropdownList: true,
                      hint: "নির্বাচন করুন",
                      dropdownList: postOfficeList,
                      selectedValue: selectedPostOffice,
                      dropdownOnChanged: (DropdownItemModel? newValue) {
                        setState(() {
                          selectedPostOffice = newValue!;
                        });
                      }),
                ],
              ),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () {
                BlocProvider.of<TothoBloc>(context).add(const KhanaProdhanEvent(value: 1));
              },
              child: const CustomText(text: "তালিকায় ফিরে যান"),
            ),
            ElevatedButton(
                onPressed: () {
                  _saveData();
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(const Color(0xff008000)),
                ),
                child: const CustomText(
                  text: "সংরক্ষন করুন",
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ))
          ],
        )
      ],
    );
  }

  void _saveData() async {
    final prefs = await SharedPreferences.getInstance();
    if (holdingNoController.text.isEmpty) {
      CommonWidget.toast("আপনার হোল্ডিং নং লিখুন");
    } else {
      prefs.setString(StorageConstants.holdingNo, holdingNoController.text.trim());
      if (selectedWord != null) {
        prefs.setString(StorageConstants.wordNo, selectedWord!.value);
      }
      if (selectedVillage != null) {
        prefs.setString(StorageConstants.village, selectedVillage!.value);
      }
      if (selectedPostalCode != null) {
        prefs.setString(StorageConstants.postalCode, selectedPostalCode!.value);
      }
      if (selectedPostOffice != null) {
        prefs.setString(StorageConstants.postOffice, selectedPostOffice!.value);
      }
      setState(() {});
      BlocProvider.of<TothoBloc>(context).add(const OthersEvent(value: 3));
    }
  }
}
