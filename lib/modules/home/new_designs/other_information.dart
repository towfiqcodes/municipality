import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../blocs/totho/totho_bloc.dart';
import '../../../models/get_system/get_system_config_response.dart';
import '../../../providers/holding_entry_provider.dart';
import '../../../shared/constants/storage.dart';
import '../../../shared/widgets/custom_text.dart';
import '../../../shared/widgets/single_form_field.dart';
import 'dropdown_item_model.dart';

class OtherInformation extends StatefulWidget {
  final GetSystemConfigData data;

  const OtherInformation({Key? key, required this.data}) : super(key: key);

  @override
  State<OtherInformation> createState() => _OtherInformationState();
}

class _OtherInformationState extends State<OtherInformation> {
  final _formKey = GlobalKey<FormState>();
  DropdownItemModel? selectedElectricityState;
  DropdownItemModel? selectedSanitationCondition;
  DropdownItemModel? selectedHouseType;
  DropdownItemModel? selectedOccupation;
  DropdownItemModel? selectedTaxPaidYear;
  List<DropdownItemModel> electricityStates = [];
  List<DropdownItemModel> sanitationConditions = [];
  List<DropdownItemModel> houseTypes = [];
  List<DropdownItemModel> occupationList = [];
  List<DropdownItemModel> taxPaidYears = [];
  final noOfHouseController = TextEditingController();

  @override
  void initState() {
    setDropdownValue(provider: context.read<HoldingEntryProvider>());
    super.initState();
  }

  void mapDataToList() {
    electricityStates = widget.data.electricityState!.entries
        .map((entry) => DropdownItemModel(entry.key, entry.value))
        .toList();

    sanitationConditions = widget.data.sanitationState!.entries
        .map((entry) => DropdownItemModel(entry.key, entry.value))
        .toList();

    houseTypes = widget.data.houseType!.entries
        .map((entry) => DropdownItemModel(entry.key, entry.value))
        .toList();

    taxPaidYears = widget.data.fiscalYear!.entries
        .map((entry) => DropdownItemModel(entry.key, entry.value))
        .toList();

    occupationList = widget.data.occupation!.entries
        .map((entry) => DropdownItemModel(entry.key, entry.value))
        .toList();
  }

  void setDropdownValue({required HoldingEntryProvider provider}) async {
    mapDataToList();

    // electricity state
    if (provider.holdingEntryRequest.houseHoldingOtherInfo?.electricityState != null) {
      selectedElectricityState = electricityStates.firstWhere(
            (element) => element.key == provider.holdingEntryRequest.houseHoldingOtherInfo?.electricityState,
      );
    } else {
      selectedElectricityState = electricityStates.isNotEmpty ? electricityStates[0] : null;
    }

    // sanitation state
    if (provider.holdingEntryRequest.houseHoldingOtherInfo?.sanitationState != null) {
      selectedSanitationCondition = sanitationConditions.firstWhere(
            (element) => element.key == provider.holdingEntryRequest.houseHoldingOtherInfo?.sanitationState,
      );
    } else {
      selectedSanitationCondition = sanitationConditions.isNotEmpty ? sanitationConditions[0] : null;
    }

    // house type
    if (provider.holdingEntryRequest.houseHoldingOtherInfo?.houseType != null) {
      selectedHouseType = houseTypes.firstWhere(
            (element) => element.key == provider.holdingEntryRequest.houseHoldingOtherInfo?.houseType,
      );
    } else {
      selectedHouseType = houseTypes.isNotEmpty ? houseTypes[0] : null;
    }

    // fiscal year
    if (provider.holdingEntryRequest.houseHoldingOtherInfo?.fiscalYear != null) {
      selectedTaxPaidYear = taxPaidYears.firstWhere(
            (element) => element.key == provider.holdingEntryRequest.houseHoldingOtherInfo?.fiscalYear,
      );
    } else {
      selectedTaxPaidYear = taxPaidYears.isNotEmpty ? taxPaidYears[0] : null;
    }

    // occupation
    if (provider.holdingEntryRequest.houseHoldingOtherInfo?.occupation != null) {
      selectedOccupation = occupationList.firstWhere(
            (element) => element.key == provider.holdingEntryRequest.houseHoldingOtherInfo?.occupation,
      );
    } else {
      selectedOccupation = occupationList.isNotEmpty ? occupationList[0] : null;
    }

    // total house
    noOfHouseController.text = provider.holdingEntryRequest.houseHoldingOtherInfo?.totalRoom ?? "";
    setState(() {});
  }

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
                        headline: "বৈদ্যুতিক অবস্থা",
                        isDropdownList: true,
                        hint: "নির্বাচন করুন",
                        dropdownList: electricityStates,
                        selectedValue: selectedElectricityState,
                        dropdownOnChanged: (DropdownItemModel? newValue) {
                          setState(() {
                            selectedElectricityState = newValue!;
                          });
                        }),
                    singleFormField(
                        headline: "স্যানিটেশনের অবস্থা",
                        isDropdownList: true,
                        hint: "নির্বাচন করুন",
                        dropdownList: sanitationConditions,
                        selectedValue: selectedSanitationCondition,
                        dropdownOnChanged: (DropdownItemModel? newValue) {
                          setState(() {
                            selectedSanitationCondition = newValue!;
                          });
                        }),
                    singleFormField(
                        headline: "বাড়ির ধরন",
                        isDropdownList: true,
                        hint: "নির্বাচন করুন",
                        dropdownList: houseTypes,
                        selectedValue: selectedHouseType,
                        dropdownValidator: (value) {
                          if (selectedHouseType == null) {
                            return "বাড়ির ধরন নির্বাচন করুন";
                          }
                          return null;
                        },
                        dropdownOnChanged: (DropdownItemModel? newValue) {
                          setState(() {
                            selectedHouseType = newValue!;
                          });
                        }),
                    singleFormField(
                      headline: "মোট বাড়ি",
                      controller: noOfHouseController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "মোট বাড়ির সংখ্যা লিখুন";
                        }
                        return null;
                      },
                    ),
                    singleFormField(
                        headline: "পেশা",
                        isDropdownList: true,
                        hint: "নির্বাচন করুন",
                        dropdownList: occupationList,
                        selectedValue: selectedOccupation,
                        dropdownValidator: (value) {
                          if (selectedOccupation == null) {
                            return "পেশা নির্বাচন করুন";
                          }
                          return null;
                        },
                        dropdownOnChanged: (DropdownItemModel? newValue) {
                          setState(() {
                            selectedOccupation = newValue!;
                          });
                        }),
                    singleFormField(
                        headline: "শেষ ট্যাক্স প্রদানের অর্থবছর",
                        isDropdownList: true,
                        hint: "নির্বাচন করুন",
                        dropdownList: taxPaidYears,
                        selectedValue: selectedTaxPaidYear,
                        dropdownValidator: (value) {
                          if (selectedTaxPaidYear == null) {
                            return "ট্যাক্স প্রদানের অর্থবছর নির্বাচন করুন";
                          }
                          return null;
                        },
                        dropdownOnChanged: (DropdownItemModel? newValue) {
                          setState(() {
                            selectedTaxPaidYear = newValue!;
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
                  BlocProvider.of<TothoBloc>(context).add(const AddressEvent(value: 2));
                },
                child: const CustomText(text: "তালিকায় ফিরে যান"),
              ),
              ElevatedButton(
                  onPressed: () {
                    if(_formKey.currentState!.validate()) {
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
  }

  void _saveData({required HoldingEntryProvider provider}) async {
    provider.updateHoldingEntryRequest(electricityState: selectedElectricityState!.key);
    provider.updateHoldingEntryRequest(sanitationState: selectedSanitationCondition!.key);
    provider.updateHoldingEntryRequest(fiscalYear: selectedTaxPaidYear!.key);
    provider.updateHoldingEntryRequest(totalRoom:  noOfHouseController.text.trim());
    provider.updateHoldingEntryRequest(occupation:  selectedOccupation!.key);
    provider.updateHoldingEntryRequest(houseType:  selectedHouseType!.key);
    setState(() {});
    log(provider.holdingEntryRequest.toString());
    BlocProvider.of<TothoBloc>(context).add(const FamilyInformationEvent(value: 4));
  }
}
