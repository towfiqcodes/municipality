import 'package:Pourosova/shared/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../blocs/totho/totho_bloc.dart';
import '../../../models/get_system/get_system_config_response.dart';
import '../../../shared/utils/select_date.dart';
import '../../../shared/widgets/custom_text.dart';
import '../../../shared/widgets/single_form_field.dart';
import 'dropdown_item_model.dart';
import 'package:intl/intl.dart';

class KhanaProdhanInformation extends StatefulWidget {
  final GetSystemConfigData data;

  const KhanaProdhanInformation({Key? key, required this.data}) : super(key: key);

  @override
  State<KhanaProdhanInformation> createState() => _KhanaProdhanInformationState();
}

class _KhanaProdhanInformationState extends State<KhanaProdhanInformation> {
  DropdownItemModel? selectedHolding;
  DropdownItemModel? selectedGuardian;
  DropdownItemModel? selectedGender;
  DropdownItemModel? selectedMaritalStatus;
  DropdownItemModel? selectedIdentity;
  String selectedReligion = "ইসলাম";
  DropdownItemModel? selectedFamilyFinancialStatus;
  DropdownItemModel? selectedPaymentType;
  DropdownItemModel? selectedAllowance;
  DropdownItemModel? selectedDisabilityStatus;
  DropdownItemModel? selectedFreedomFighterStatus;
  DropdownItemModel? selectedWaterConnectivityStatus;
  bool isNewHolding = false;
  List<DropdownItemModel> holdingTypes = [];
  List<DropdownItemModel> guardianType = [];
  List<DropdownItemModel> gender = [];
  List<DropdownItemModel> maritalStatus = [];
  List<DropdownItemModel> identityType = [];
  List<DropdownItemModel> familyFinancialStatus = [];
  List<DropdownItemModel> paymentTypes = [];
  List<DropdownItemModel> allowances = [];
  List<DropdownItemModel> disabilityStatus = [];
  List<DropdownItemModel> freedomFighterStatus = [];
  List<DropdownItemModel> waterConnectivityStatus = [];
  final nameController = TextEditingController();
  final guardianNameController = TextEditingController();
  final guardianMotherNameController = TextEditingController();
  final dobController = TextEditingController();
  final nidController = TextEditingController();
  final mobileNoController = TextEditingController();
  final religionController = TextEditingController();
  final familyMemberMaleController = TextEditingController();
  final familyMemberFemaleController = TextEditingController();
  final registrationFeeController = TextEditingController();
  final allowanceController = TextEditingController();
  final numberOfMemberHaveBirthCertificateController = TextEditingController();
  final numberOfBirthCertificateController = TextEditingController();
  final annualTaxController = TextEditingController();
  final isGovernmentHoldingController = TextEditingController();
  final govtOfficeNameController = TextEditingController();
  final govtOfficerNameController = TextEditingController();
  final govtOfficerMobileNoController = TextEditingController();
  final govtOfficeLengthController = TextEditingController();
  final govtOfficeWidthController = TextEditingController();
  DateTime? selectedBirthDate;

  @override
  void initState() {
    setDropdownValues();
    super.initState();
  }

  void mapDataToList() {
    holdingTypes = widget.data.holdingType!.entries
        .map((entry) => DropdownItemModel(entry.key, entry.value))
        .toList();

    guardianType = widget.data.guardianType!.entries
        .map((entry) => DropdownItemModel(entry.key, entry.value))
        .toList();

    gender = widget.data.gender!.entries
        .map((entry) => DropdownItemModel(entry.key, entry.value))
        .toList();

    maritalStatus = widget.data.maritalStatus!.entries
        .map((entry) => DropdownItemModel(entry.key, entry.value))
        .toList();

    identityType = widget.data.identityType!.entries
        .map((entry) => DropdownItemModel(entry.key, entry.value))
        .toList();

    familyFinancialStatus = widget.data.familyType!.entries
        .map((entry) => DropdownItemModel(entry.key, entry.value))
        .toList();

    paymentTypes = widget.data.paymentType!.entries
        .map((entry) => DropdownItemModel(entry.key, entry.value))
        .toList();

    disabilityStatus = widget.data.disabilityStatus!.entries
        .map((entry) => DropdownItemModel(entry.key, entry.value))
        .toList();

    freedomFighterStatus = widget.data.freedomFighterStatus!.entries
        .map((entry) => DropdownItemModel(entry.key, entry.value))
        .toList();

    waterConnectivityStatus = widget.data.waterConnectivityStatus!.entries
        .map((entry) => DropdownItemModel(entry.key, entry.value))
        .toList();
  }

  void setDropdownValues() async {
    final prefs = await SharedPreferences.getInstance();
    mapDataToList();

    // holding type
    if (prefs.getString(StorageConstants.holdingType) != null) {
      selectedHolding = holdingTypes.firstWhere(
        (element) => element.value == prefs.getString(StorageConstants.holdingType),
      );
    } else {
      selectedHolding = holdingTypes.isNotEmpty ? holdingTypes[0] : null;
    }

    // new house?
    isNewHolding = prefs.getBool(StorageConstants.isNewHolding) ?? false;

    // name
    nameController.text = prefs.getString(StorageConstants.name) ?? "";

    // guardian type
    if (prefs.getString(StorageConstants.guardianType) != null) {
      selectedGuardian = guardianType.firstWhere(
        (element) => element.value == prefs.getString(StorageConstants.guardianType),
      );
    } else {
      selectedGuardian = guardianType.isNotEmpty ? guardianType[0] : null;
    }

    // guardian name
    guardianNameController.text = prefs.getString(StorageConstants.guardianName) ?? "";

    // mother name
    guardianMotherNameController.text = prefs.getString(StorageConstants.guardianMotherName) ?? "";

    // gender
    if (prefs.getString(StorageConstants.gender) != null) {
      selectedGender = gender.firstWhere(
        (element) => element.value == prefs.getString(StorageConstants.gender),
      );
    } else {
      selectedGender = gender.isNotEmpty ? gender[0] : null;
    }

    // marital status
    if (prefs.getString(StorageConstants.maritalStatus) != null) {
      selectedMaritalStatus = maritalStatus.firstWhere(
        (element) => element.value == prefs.getString(StorageConstants.maritalStatus),
      );
    } else {
      selectedMaritalStatus = maritalStatus.isNotEmpty ? maritalStatus[0] : null;
    }

    // birth date
    selectedBirthDate = prefs.getString(StorageConstants.dateOfBirth) != null
        ? DateTime.parse(prefs.getString(StorageConstants.dateOfBirth)!)
        : null;

    // identity type
    if (prefs.getString(StorageConstants.identityType) != null) {
      selectedIdentity = identityType.firstWhere(
        (element) => element.value == prefs.getString(StorageConstants.identityType),
      );
    } else {
      selectedIdentity = identityType.isNotEmpty ? identityType[0] : null;
    }

    // nid number
    nidController.text = prefs.getString(StorageConstants.identityNumber) ?? "";

    // mobile number
    mobileNoController.text = prefs.getString(StorageConstants.mobile) ?? "";

    // religion
    religionController.text = prefs.getString(StorageConstants.religion) ?? "";

    // family financial status
    if (prefs.getString(StorageConstants.familyType) != null) {
      selectedFamilyFinancialStatus = familyFinancialStatus.firstWhere(
        (element) => element.value == prefs.getString(StorageConstants.familyType),
      );
    } else {
      selectedFamilyFinancialStatus =
          familyFinancialStatus.isNotEmpty ? familyFinancialStatus[0] : null;
    }

    // number of male members
    familyMemberMaleController.text = prefs.getString(StorageConstants.familyMemberMale) ?? "";

    // number of female members
    familyMemberMaleController.text = prefs.getString(StorageConstants.familyMemberFemale) ?? "";

    // registration fee
    registrationFeeController.text = prefs.getString(StorageConstants.registrationFee) ?? "";

    // payment type
    if (prefs.getString(StorageConstants.paymentType) != null) {
      selectedPaymentType = paymentTypes.firstWhere(
        (element) => element.value == prefs.getString(StorageConstants.paymentType),
      );
    } else {
      selectedPaymentType = paymentTypes.isNotEmpty ? paymentTypes[0] : null;
    }

    // allowance
    if (prefs.getString(StorageConstants.allowance) != null) {
      selectedAllowance = allowances.firstWhere(
        (element) => element.value == prefs.getString(StorageConstants.allowance),
      );
    } else {
      selectedAllowance = allowances.isNotEmpty ? allowances[0] : null;
    }

    // allowance amount
    allowanceController.text = prefs.getString(StorageConstants.allowanceDescription) ?? "";

    // disability status
    if (prefs.getString(StorageConstants.disabilityStatus) != null) {
      selectedDisabilityStatus = disabilityStatus.firstWhere(
        (element) => element.value == prefs.getString(StorageConstants.disabilityStatus),
      );
    } else {
      selectedDisabilityStatus = disabilityStatus.isNotEmpty ? disabilityStatus[0] : null;
    }

    // freedom fighter status
    if (prefs.getString(StorageConstants.freedomFighterStatus) != null) {
      selectedFreedomFighterStatus = freedomFighterStatus.firstWhere(
        (element) => element.value == prefs.getString(StorageConstants.freedomFighterStatus),
      );
    } else {
      selectedFreedomFighterStatus =
          freedomFighterStatus.isNotEmpty ? freedomFighterStatus[0] : null;
    }

    // water connectivity status
    if (prefs.getString(StorageConstants.waterConnectivityStatus) != null) {
      selectedWaterConnectivityStatus = waterConnectivityStatus.firstWhere(
        (element) => element.value == prefs.getString(StorageConstants.waterConnectivityStatus),
      );
    } else {
      selectedWaterConnectivityStatus =
          waterConnectivityStatus.isNotEmpty ? waterConnectivityStatus[0] : null;
    }

    // number of birth Certificates
    numberOfBirthCertificateController.text =
        prefs.getString(StorageConstants.numberOfBirthCertificate) ?? "";

    // annual tax
    annualTaxController.text = prefs.getString(StorageConstants.annualTax) ?? "";

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
                      headline: "হোল্ডিং এর ধরণ",
                      isDropdownList: true,
                      hint: "নির্বাচন করুন",
                      dropdownList: holdingTypes,
                      selectedValue: selectedHolding,
                      dropdownOnChanged: (newValue) {
                        setState(() {
                          selectedHolding = newValue;
                        });
                      }),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 24,
                          height: 24,
                          child: Checkbox(
                              value: isNewHolding,
                              activeColor: const Color(0xff299429),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                              side: const BorderSide(color: Color(0xff7B7B7B), width: 1.5),
                              checkColor: Colors.white,
                              onChanged: (value) {
                                setState(() {
                                  isNewHolding = value!;
                                });
                              }),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        const CustomText(text: "নতুন বাড়ি?", fontWeight: FontWeight.bold),
                      ],
                    ),
                  ),
                  singleFormField(headline: "সুবিধাভোগীর নাম", controller: nameController),
                  singleFormField(
                      headline: "অভিভাবকের ধরণ",
                      isDropdownList: true,
                      dropdownList: guardianType,
                      selectedValue: selectedGuardian,
                      dropdownOnChanged: (DropdownItemModel? newValue) {
                        setState(() {
                          selectedGuardian = newValue!;
                        });
                      }),
                  singleFormField(headline: "অভিভাবকের নাম", controller: guardianNameController),
                  singleFormField(headline: "মায়ের নাম", controller: guardianMotherNameController),
                  singleFormField(
                      headline: "লিঙ্গ",
                      isDropdownList: true,
                      dropdownList: gender,
                      selectedValue: selectedGender,
                      dropdownOnChanged: (DropdownItemModel? newValue) {
                        setState(() {
                          selectedGender = newValue!;
                        });
                      }),
                  singleFormField(
                      headline: "বৈবাহিক অবস্থা",
                      isDropdownList: true,
                      dropdownList: maritalStatus,
                      selectedValue: selectedMaritalStatus,
                      dropdownOnChanged: (DropdownItemModel? newValue) {
                        setState(() {
                          selectedMaritalStatus = newValue!;
                        });
                      }),
                  singleFormField(
                      onTap: () {
                        selectBirthDate();
                      },
                      controller: dobController,
                      headline: "জন্ম তারিখ",
                      suffixIcon: Icons.calendar_today,
                      isEnable: false,
                      hint: "dd/mm/yyyy"),
                  singleFormField(
                      headline: "পরিচয়ের ধনণ",
                      isDropdownList: true,
                      dropdownList: identityType,
                      selectedValue: selectedIdentity,
                      dropdownOnChanged: (DropdownItemModel? newValue) {
                        setState(() {
                          selectedIdentity = newValue!;
                        });
                      }),
                  singleFormField(
                      headline: "পরিচয় পত্রের নম্বর (এনআইডি নম্বর / জন্ম সনদ নম্বর জন্ম সনদ নম্বর",
                      controller: nidController),
                  singleFormField(headline: "মোবাইল নম্বর", controller: mobileNoController),
                  singleFormField(headline: "ধর্ম", controller: religionController),
                  singleFormField(
                      headline: "পারিবারিক অবস্থার ধরণ",
                      isDropdownList: true,
                      dropdownList: familyFinancialStatus,
                      selectedValue: selectedFamilyFinancialStatus,
                      dropdownOnChanged: (DropdownItemModel? newValue) {
                        setState(() {
                          selectedFamilyFinancialStatus = newValue!;
                        });
                      }),
                  singleFormField(
                      headline: "পুরুষ সদস্য সংখ্যা", controller: familyMemberMaleController),
                  singleFormField(
                      headline: "মহিলা সদস্য সংখ্যা", controller: familyMemberFemaleController),
                  singleFormField(headline: "নিবন্ধন ফি", controller: registrationFeeController),
                  singleFormField(
                      headline: "পেমেন্টের ধরণ",
                      isDropdownList: true,
                      dropdownList: paymentTypes,
                      selectedValue: selectedPaymentType,
                      dropdownOnChanged: (DropdownItemModel? newValue) {
                        setState(() {
                          selectedPaymentType = newValue!;
                        });
                      }),
                  singleFormField(
                      headline: "ভাতা নির্বাচন করুন",
                      isDropdownList: true,
                      dropdownList: allowances,
                      selectedValue: selectedAllowance,
                      dropdownOnChanged: (DropdownItemModel? newValue) {
                        setState(() {
                          selectedAllowance = newValue!;
                        });
                      }),
                  singleFormField(
                      headline: "ভাতার পরিমাণ লিখুন (টাকা/অন্যান্য)",
                      controller: allowanceController),
                  singleFormField(
                      headline: "পরিবারে কেউ প্রতিবন্ধী আছে?",
                      isDropdownList: true,
                      dropdownList: disabilityStatus,
                      selectedValue: selectedDisabilityStatus,
                      dropdownOnChanged: (DropdownItemModel? newValue) {
                        setState(() {
                          selectedDisabilityStatus = newValue!;
                        });
                      }),
                  singleFormField(
                      headline: "আপনি কি মুক্তিযোদ্ধা?",
                      isDropdownList: true,
                      dropdownList: freedomFighterStatus,
                      selectedValue: selectedFreedomFighterStatus,
                      dropdownOnChanged: (DropdownItemModel? newValue) {
                        setState(() {
                          selectedFreedomFighterStatus = newValue!;
                        });
                      }),
                  singleFormField(
                      headline: "পানির সংযোগ আছে কিনা?",
                      isDropdownList: true,
                      dropdownList: waterConnectivityStatus,
                      selectedValue: selectedWaterConnectivityStatus,
                      dropdownOnChanged: (DropdownItemModel? newValue) {
                        setState(() {
                          selectedWaterConnectivityStatus = newValue!;
                        });
                      }),
                  singleFormField(
                      headline: "পরিবারে জন্ম নিবন্ধনে কত জন আছে?",
                      controller: numberOfMemberHaveBirthCertificateController),
                  singleFormField(headline: "বাৎসরিক কর", controller: annualTaxController),
                  singleFormField(
                      headline: "সরকারি স্থাপনা?", controller: isGovernmentHoldingController),
                  singleFormField(
                      headline: "প্রতিষ্ঠানের নাম", controller: govtOfficeNameController),
                  singleFormField(
                      headline: "প্রতিষ্ঠান পরিচালকের নাম", controller: govtOfficerNameController),
                  singleFormField(
                      headline: "প্রতিষ্ঠান পরিচালকের মোবাইল নম্বর",
                      controller: govtOfficerMobileNoController),
                  singleFormField(
                      headline: "প্রতিষ্ঠানের দৈর্ঘ্য", controller: govtOfficeLengthController),
                  singleFormField(
                      headline: "প্রতিষ্ঠানের প্রস্থ", controller: govtOfficeWidthController),
                ],
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: ElevatedButton(
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
              )),
        )
      ],
    );
  }

  void _saveData() async {
    final prefs = await SharedPreferences.getInstance();
    if (selectedHolding != null) {
      await prefs.setString(StorageConstants.holdingType, selectedHolding!.value);
    }
    await prefs.setBool(StorageConstants.isNewHolding, isNewHolding);
    await prefs.setString(StorageConstants.name, nameController.text.trim());
    if (selectedGuardian != null) {
      await prefs.setString(StorageConstants.guardianType, selectedGuardian!.value);
    }
    await prefs.setString(StorageConstants.guardianName, guardianNameController.text.trim());
    await prefs.setString(
        StorageConstants.guardianMotherName, guardianMotherNameController.text.trim());
    if (selectedGender != null) {
      await prefs.setString(StorageConstants.gender, selectedGender!.value);
    }
    await prefs.setString(StorageConstants.maritalStatus, selectedMaritalStatus!.value);
    await prefs.setString(StorageConstants.dateOfBirth,
        selectedBirthDate != null ? selectedBirthDate.toString() : "");
    if (selectedIdentity != null) {
      await prefs.setString(StorageConstants.identityType, selectedIdentity!.value);
    }
    await prefs.setString(StorageConstants.identityNumber, nidController.text.trim());
    await prefs.setString(StorageConstants.mobile, mobileNoController.text.trim());
    await prefs.setString(StorageConstants.religion, religionController.text.trim());
    if (selectedFamilyFinancialStatus != null) {
      await prefs.setString(StorageConstants.familyType, selectedFamilyFinancialStatus!.value);
    }
    await prefs.setString(
        StorageConstants.familyMemberMale, familyMemberMaleController.text.trim());
    await prefs.setString(
        StorageConstants.familyMemberFemale, familyMemberFemaleController.text.trim());
    await prefs.setString(StorageConstants.registrationFee, registrationFeeController.text.trim());
    if (selectedPaymentType != null) {
      await prefs.setString(StorageConstants.paymentType, selectedPaymentType!.value);
    }
    if (selectedAllowance != null) {
      await prefs.setString(StorageConstants.allowance, selectedAllowance!.value);
    }

    await prefs.setString(StorageConstants.allowanceDescription, allowanceController.text.trim());
    if (selectedDisabilityStatus != null) {
      await prefs.setString(StorageConstants.disabilityStatus, selectedDisabilityStatus!.value);
    }
    if (selectedFreedomFighterStatus != null) {
      await prefs.setString(
          StorageConstants.freedomFighterStatus, selectedFreedomFighterStatus!.value);
    }
    if (selectedWaterConnectivityStatus != null) {
      await prefs.setString(
          StorageConstants.waterConnectivityStatus, selectedWaterConnectivityStatus!.value);
    }
    await prefs.setString(
        StorageConstants.numberOfBirthCertificate, numberOfBirthCertificateController.text.trim());
    await prefs.setString(StorageConstants.annualTax, annualTaxController.text.trim());
    await prefs.setString(
        StorageConstants.isGovernmentHolding, isGovernmentHoldingController.text.trim());
    await prefs.setString(
        StorageConstants.governmentOfficeName, govtOfficeNameController.text.trim());
    await prefs.setString(
        StorageConstants.governmentOfficerName, govtOfficerNameController.text.trim());
    await prefs.setString(
        StorageConstants.governmentOfficerMobileNo, govtOfficerMobileNoController.text.trim());
    await prefs.setString(
        StorageConstants.governmentOfficeLength, govtOfficeLengthController.text.trim());
    await prefs.setString(
        StorageConstants.governmentOfficeWidth, govtOfficeWidthController.text.trim());
    setState(() {});
    BlocProvider.of<TothoBloc>(context).add(const AddressEvent(value: 2));

  }

  void selectBirthDate() async {
    selectedBirthDate = await selectDate(context,
        initialDate: DateTime.now(),
        lastDate: DateTime.now(),
        firstDate: DateTime(DateTime.now().year - 100));
    if (selectedBirthDate != null) {
      dobController.text = DateFormat("dd/MM/yyyy").format(selectedBirthDate!);
    }
    setState(() {});
  }
}
