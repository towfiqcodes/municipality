import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../blocs/totho/totho_bloc.dart';
import '../../../models/get_system/get_system_config_response.dart';
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
    setDropdownValue();
    super.initState();
  }

  void mapDataToList() {
    electricityStates = widget.data.electricityState!.entries
        .map((entry) => DropdownItemModel(entry.key, entry.value))
        .toList();

    sanitationConditions = widget.data.sanitationState!.entries
        .map((entry) => DropdownItemModel(entry.key, entry.value))
        .toList();

    taxPaidYears = widget.data.fiscalYear!.entries
        .map((entry) => DropdownItemModel(entry.key, entry.value))
        .toList();
  }

  void setDropdownValue() async {
    final prefs = await SharedPreferences.getInstance();
    mapDataToList();

    // electricity state
    if (prefs.getString(StorageConstants.electricityState) != null) {
      selectedElectricityState = electricityStates.firstWhere(
          (element) => element.value == prefs.getString(StorageConstants.electricityState));
    } else {
      selectedElectricityState = electricityStates.isNotEmpty ? electricityStates[0] : null;
    }

    // sanitation state
    if (prefs.getString(StorageConstants.sanitationState) != null) {
      selectedSanitationCondition = sanitationConditions.firstWhere(
          (element) => element.value == prefs.getString(StorageConstants.sanitationState));
    } else {
      selectedSanitationCondition =
          sanitationConditions.isNotEmpty ? sanitationConditions[0] : null;
    }

    // fiscal year
    selectedTaxPaidYear = taxPaidYears.isNotEmpty ? taxPaidYears[0] : null;

    // total house
    noOfHouseController.text = prefs.getString(StorageConstants.totalRoom) ?? "";
    setState(() {});
  }

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
                      dropdownOnChanged: (DropdownItemModel? newValue) {
                        setState(() {
                          selectedHouseType = newValue!;
                        });
                      }),
                  singleFormField(headline: "মোট বাড়ি", controller: noOfHouseController),
                  singleFormField(
                      headline: "পেশা",
                      isDropdownList: true,
                      hint: "নির্বাচন করুন",
                      dropdownList: occupationList,
                      selectedValue: selectedOccupation,
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
    prefs.setString(StorageConstants.electricityState, selectedElectricityState!.value);
    prefs.setString(StorageConstants.sanitationState, selectedSanitationCondition!.value);
    prefs.setString(StorageConstants.fiscalYear, selectedTaxPaidYear!.value);
    prefs.setString(StorageConstants.totalRoom, noOfHouseController.text.trim());
    setState(() {});
    BlocProvider.of<TothoBloc>(context).add(const FamilyInformationEvent(value: 4));
  }
}
