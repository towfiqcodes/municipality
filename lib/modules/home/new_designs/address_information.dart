import 'package:Pourosova/providers/holding_entry_provider.dart';
import 'package:Pourosova/shared/constants/constants.dart';
import 'package:Pourosova/shared/utils/common_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
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
  final _formKey = GlobalKey<FormState>();
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
    final HoldingEntryProvider holdingEntryProvider = Provider.of<HoldingEntryProvider>(context);
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(border: Border.all(color: Colors.black38)),
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    singleFormField(
                      headline: "হোল্ডিং নং",
                      controller: holdingNoController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "হোল্ডিং নং লিখুন";
                        }
                        return null;
                      },
                    ),
                    singleFormField(
                        headline: "ওয়ার্ড নং",
                        isDropdownList: true,
                        hint: "নির্বাচন করুন",
                        dropdownList: wordList,
                        selectedValue: selectedWord,
                        dropdownValidator: (value) {
                          if (selectedWord == null) {
                            return "ওয়ার্ড নির্বাচন করুন";
                          }
                          return null;
                        },
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
                        dropdownValidator: (value) {
                          if (selectedVillage == null) {
                            return "গ্রাম নির্বাচন করুন";
                          }
                          return null;
                        },
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
                        dropdownValidator: (value) {
                          if (selectedPostalCode == null) {
                            return "পোস্টাল কোড নির্বাচন করুন";
                          }
                          return null;
                        },
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
                        dropdownValidator: (value) {
                          if (selectedPostOffice == null) {
                            return "ডাকঘর নির্বাচন করুন";
                          }
                          return null;
                        },
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
                    if (_formKey.currentState!.validate()) {
                      _saveData(provider: holdingEntryProvider);
                    }
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
      ),
    );
    ;
  }

  void _saveData({required HoldingEntryProvider provider}) async {
    provider.updateHoldingEntryRequest(holdingNo: holdingNoController.text.trim());
    if (selectedWord != null) {
      provider.updateHoldingEntryRequest(wardNo: selectedWord!.key);
    }
    if (selectedVillage != null) {
      provider.updateHoldingEntryRequest(village: selectedVillage!.key);
    }
    if (selectedPostalCode != null) {
      provider.updateHoldingEntryRequest(postCode: selectedPostalCode!.key);
    }
    if (selectedPostOffice != null) {
      provider.updateHoldingEntryRequest(postOffice: selectedPostOffice!.key);
    }
    setState(() {});
    BlocProvider.of<TothoBloc>(context).add(const OthersEvent(value: 3));
  }
}
