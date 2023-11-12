import 'package:Pourosova/providers/holding_entry_provider.dart';
import 'package:Pourosova/shared/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
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
  final _formKey = GlobalKey<FormState>();
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
    setDropdownValues(provider: context.read<HoldingEntryProvider>());
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

  void setDropdownValues({required HoldingEntryProvider provider}) async {
    final prefs = await SharedPreferences.getInstance();
    mapDataToList();

    // holding type
    if (provider.holdingEntryRequest.holdingType != null) {
      selectedHolding = holdingTypes.firstWhere(
        (element) => element.key == provider.holdingEntryRequest.holdingType,
      );
    } else {
      selectedHolding = holdingTypes.isNotEmpty ? holdingTypes[0] : null;
    }

    // new house?
    isNewHolding = provider.holdingEntryRequest.isNewHolding ?? false;

    // name
    nameController.text = provider.holdingEntryRequest.name ?? "";

    // guardian type
    if (provider.holdingEntryRequest.guardianType != null) {
      selectedGuardian = guardianType.firstWhere(
        (element) => element.key == provider.holdingEntryRequest.guardianType,
      );
    } else {
      selectedGuardian = guardianType.isNotEmpty ? guardianType[0] : null;
    }

    // guardian name
    guardianNameController.text = provider.holdingEntryRequest.guardianName ?? "";

    // mother name
    guardianMotherNameController.text = provider.holdingEntryRequest.guardianMotherName ?? "";

    // gender
    if (provider.holdingEntryRequest.gender != null) {
      selectedGender = gender.firstWhere(
        (element) => element.key == provider.holdingEntryRequest.gender,
      );
    } else {
      selectedGender = gender.isNotEmpty ? gender[0] : null;
    }

    // marital status
    if (provider.holdingEntryRequest.maritalStatus != null) {
      selectedMaritalStatus = maritalStatus.firstWhere(
        (element) => element.key == provider.holdingEntryRequest.maritalStatus,
      );
    } else {
      selectedMaritalStatus = maritalStatus.isNotEmpty ? maritalStatus[0] : null;
    }

    // birth date
    selectedBirthDate = provider.holdingEntryRequest.dateOfBirth != null
        ? DateTime.parse(provider.holdingEntryRequest.dateOfBirth!)
        : null;

    // identity type
    if (provider.holdingEntryRequest.identityType != null) {
      selectedIdentity = identityType.firstWhere(
        (element) => element.key == provider.holdingEntryRequest.identityType,
      );
    } else {
      selectedIdentity = identityType.isNotEmpty ? identityType[0] : null;
    }

    // nid number
    nidController.text = provider.holdingEntryRequest.identityNumber ?? "";

    // mobile number
    mobileNoController.text = provider.holdingEntryRequest.mobile ?? "";

    // religion
    religionController.text = provider.holdingEntryRequest.religion ?? "";

    // family financial status
    if (provider.holdingEntryRequest.familyType != null) {
      selectedFamilyFinancialStatus = familyFinancialStatus.firstWhere(
        (element) => element.key == provider.holdingEntryRequest.familyType,
      );
    } else {
      selectedFamilyFinancialStatus =
          familyFinancialStatus.isNotEmpty ? familyFinancialStatus[0] : null;
    }

    // number of male members
    familyMemberMaleController.text = provider.holdingEntryRequest.familyMemberMale ?? "";

    // number of female members
    familyMemberMaleController.text = provider.holdingEntryRequest.familyMemberFemale ?? "";

    // registration fee
    registrationFeeController.text = provider.holdingEntryRequest.registrationFee ?? "";

    // payment type
    if (provider.holdingEntryRequest.paymentType != null) {
      selectedPaymentType = paymentTypes.firstWhere(
        (element) => element.key == provider.holdingEntryRequest.paymentType,
      );
    } else {
      selectedPaymentType = paymentTypes.isNotEmpty ? paymentTypes[0] : null;
    }

    // allowance
    if (provider.holdingEntryRequest.allowance != null) {
      selectedAllowance = allowances.firstWhere(
        (element) => element.key == provider.holdingEntryRequest.allowance,
      );
    } else {
      selectedAllowance = allowances.isNotEmpty ? allowances[0] : null;
    }

    // allowance amount
    allowanceController.text = provider.holdingEntryRequest.allowanceDescription ?? "";

    // disability status
    if (provider.holdingEntryRequest.disabilityStatus != null) {
      selectedDisabilityStatus = disabilityStatus.firstWhere(
        (element) => element.key == provider.holdingEntryRequest.disabilityStatus,
      );
    } else {
      selectedDisabilityStatus = disabilityStatus.isNotEmpty ? disabilityStatus[0] : null;
    }

    // freedom fighter status
    if (provider.holdingEntryRequest.freedomFighterStatus != null) {
      selectedFreedomFighterStatus = freedomFighterStatus.firstWhere(
        (element) => element.key == provider.holdingEntryRequest.freedomFighterStatus,
      );
    } else {
      selectedFreedomFighterStatus =
          freedomFighterStatus.isNotEmpty ? freedomFighterStatus[0] : null;
    }

    // water connectivity status
    if (provider.holdingEntryRequest.waterConnectivityStatus != null) {
      selectedWaterConnectivityStatus = waterConnectivityStatus.firstWhere(
        (element) => element.key == provider.holdingEntryRequest.waterConnectivityStatus,
      );
    } else {
      selectedWaterConnectivityStatus =
          waterConnectivityStatus.isNotEmpty ? waterConnectivityStatus[0] : null;
    }

    // number of birth Certificates
    numberOfBirthCertificateController.text =
        provider.holdingEntryRequest.numberOfBirthCertificate.toString() ?? "";

    // annual tax
    annualTaxController.text = provider.holdingEntryRequest.annualTax ?? "";

    setState(() {});
  }

  void _saveData({required HoldingEntryProvider provider}) async {
    if (selectedHolding != null) {
      provider.updateHoldingEntryRequest(holdingType: selectedHolding!.key);
    }
    if (selectedGuardian != null) {
      provider.updateHoldingEntryRequest(isNewHolding: isNewHolding, name: selectedGuardian!.key);
    }

    if (selectedGender != null) {
      provider.updateHoldingEntryRequest(gender: selectedGender!.key);
    }

    if (selectedIdentity != null) {
      provider.updateHoldingEntryRequest(identityType: selectedIdentity!.key);
    }

    if (selectedFamilyFinancialStatus != null) {
      provider.updateHoldingEntryRequest(familyType: selectedFamilyFinancialStatus!.key);
    }

    if (selectedPaymentType != null) {
      provider.updateHoldingEntryRequest(paymentType: selectedPaymentType!.key);
    }
    if (selectedAllowance != null) {
      provider.updateHoldingEntryRequest(allowance: selectedAllowance!.key);
    }

    if (selectedDisabilityStatus != null) {
      provider.updateHoldingEntryRequest(disabilityStatus: selectedDisabilityStatus!.key);
    }
    if (selectedFreedomFighterStatus != null) {
      provider.updateHoldingEntryRequest(freedomFighterStatus: selectedFreedomFighterStatus!.key);
    }
    if (selectedWaterConnectivityStatus != null) {
      provider.updateHoldingEntryRequest(
          waterConnectivityStatus: selectedWaterConnectivityStatus!.key);
    }
    provider.updateHoldingEntryRequest(
        isNewHolding: isNewHolding,
        name: nameController.text.trim(),
        guardianName: guardianNameController.text.trim(),
        guardianMotherName: guardianMotherNameController.text.trim(),
        maritalStatus: selectedMaritalStatus!.key,
        dateOfBirth: selectedBirthDate != null ? selectedBirthDate.toString() : "",
        identityNumber: nidController.text.trim(),
        mobile: mobileNoController.text.trim(),
        familyMemberMale: familyMemberMaleController.text.trim(),
        familyMemberFemale: familyMemberFemaleController.text.trim(),
        registrationFee: registrationFeeController.text.trim(),
        allowanceDescription: allowanceController.text.trim(),
        numberOfBirthCertificate: int.tryParse(numberOfBirthCertificateController.text.trim()) ?? 0,
        annualTax: annualTaxController.text.trim(),
        govtOfficeName: govtOfficerNameController.text.trim(),
        govtOfficerMobileNo: govtOfficerMobileNoController.text.trim(),
        govtOfficeLength: govtOfficeLengthController.text.trim(),
        govtOfficeWidth: govtOfficeWidthController.text.trim());

    // religion remaining ------------------->
    //await prefs.setString(StorageConstants.religion, religionController.text.trim());
    // isGovernmentHolding remaining ------------------>
    // await prefs.setString(StorageConstants.isGovernmentHolding, isGovernmentHoldingController.text.trim());

    debugPrint(provider.holdingEntryRequest.toString());

    setState(() {});
    BlocProvider.of<TothoBloc>(context).add(const AddressEvent(value: 2));
  }

  void selectBirthDate() async {
    selectedBirthDate = await selectDate(context);
    if (selectedBirthDate != null) {
      dobController.text = DateFormat("dd/MM/yyyy").format(selectedBirthDate!);
    }
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
                                shape:
                                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
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
                    singleFormField(
                      headline: "সুবিধাভোগীর নাম",
                      controller: nameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "সুবিধাভোগীর নাম লিখুন";
                        }
                        return null;
                      },
                    ),
                    singleFormField(
                      headline: "অভিভাবকের ধরণ",
                      isDropdownList: true,
                      dropdownList: guardianType,
                      selectedValue: selectedGuardian,
                      dropdownOnChanged: (DropdownItemModel? newValue) {
                        setState(() {
                          selectedGuardian = newValue!;
                        });
                      },
                    ),
                    singleFormField(
                      headline: "অভিভাবকের নাম",
                      controller: guardianNameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "অভিভাবকের নাম লিখুন";
                        }
                        return null;
                      },
                    ),
                    singleFormField(
                      headline: "মায়ের নাম",
                      controller: guardianMotherNameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "মায়ের নাম লিখুন";
                        }
                        return null;
                      },
                    ),
                    singleFormField(
                      headline: "লিঙ্গ",
                      isDropdownList: true,
                      dropdownList: gender,
                      selectedValue: selectedGender,
                      dropdownOnChanged: (DropdownItemModel? newValue) {
                        setState(() {
                          selectedGender = newValue!;
                        });
                      },
                    ),
                    singleFormField(
                      headline: "বৈবাহিক অবস্থা",
                      isDropdownList: true,
                      dropdownList: maritalStatus,
                      selectedValue: selectedMaritalStatus,
                      dropdownOnChanged: (DropdownItemModel? newValue) {
                        setState(() {
                          selectedMaritalStatus = newValue!;
                        });
                      },
                    ),
                    singleFormField(
                      onTap: () {
                        selectBirthDate();
                      },
                      controller: dobController,
                      headline: "জন্ম তারিখ",
                      suffixIcon: Icons.calendar_today,
                      isEnable: false,
                      hint: "dd/mm/yyyy",
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "জন্ম তারিখ নির্বাচন করুন";
                        }
                        return null;
                      },
                    ),
                    singleFormField(
                      headline: "পরিচয়ের ধনণ",
                      isDropdownList: true,
                      dropdownList: identityType,
                      selectedValue: selectedIdentity,
                      dropdownOnChanged: (DropdownItemModel? newValue) {
                        setState(() {
                          selectedIdentity = newValue!;
                        });
                      },
                    ),
                    singleFormField(
                      headline: "পরিচয় পত্রের নম্বর (এনআইডি নম্বর / জন্ম সনদ নম্বর জন্ম সনদ নম্বর",
                      controller: nidController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "পরিচয় পত্রের নম্বর নাম লিখুন";
                        }
                        return null;
                      },
                    ),
                    singleFormField(
                      headline: "মোবাইল নম্বর",
                      controller: mobileNoController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "মোবাইল নম্বর লিখুন";
                        }
                        if (value.length != 11) {
                          return "১১ ডিজিটের সঠিক মোবাইল নম্বর লিখুন";
                        }
                        return null;
                      },
                    ),
                    singleFormField(
                      headline: "ধর্ম",
                      controller: religionController,
                    ),
                    singleFormField(
                      headline: "পারিবারিক অবস্থার ধরণ",
                      isDropdownList: true,
                      dropdownList: familyFinancialStatus,
                      selectedValue: selectedFamilyFinancialStatus,
                      dropdownOnChanged: (DropdownItemModel? newValue) {
                        setState(() {
                          selectedFamilyFinancialStatus = newValue!;
                        });
                      },
                    ),
                    singleFormField(
                      headline: "পুরুষ সদস্য সংখ্যা",
                      controller: familyMemberMaleController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "পুরুষ সদস্য সংখ্যা";
                        }
                        return null;
                      },
                    ),
                    singleFormField(
                      headline: "মহিলা সদস্য সংখ্যা",
                      controller: familyMemberFemaleController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "মহিলা সদস্য সংখ্যা";
                        }
                        return null;
                      },
                    ),
                    singleFormField(
                      headline: "নিবন্ধন ফি",
                      controller: registrationFeeController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "নিবন্ধন ফি লিখুন";
                        }
                        return null;
                      },
                    ),
                    singleFormField(
                      headline: "পেমেন্টের ধরণ",
                      isDropdownList: true,
                      dropdownList: paymentTypes,
                      selectedValue: selectedPaymentType,
                      dropdownOnChanged: (DropdownItemModel? newValue) {
                        setState(() {
                          selectedPaymentType = newValue!;
                        });
                      },
                    ),
                    singleFormField(
                      headline: "ভাতা নির্বাচন করুন",
                      isDropdownList: true,
                      dropdownList: allowances,
                      selectedValue: selectedAllowance,
                      dropdownOnChanged: (DropdownItemModel? newValue) {
                        setState(() {
                          selectedAllowance = newValue!;
                        });
                      },
                    ),
                    singleFormField(
                        headline: "ভাতার পরিমাণ লিখুন (টাকা/অন্যান্য)",
                        controller: allowanceController,
                        isMandatory: false),
                    singleFormField(
                      headline: "পরিবারে কেউ প্রতিবন্ধী আছে?",
                      isDropdownList: true,
                      dropdownList: disabilityStatus,
                      selectedValue: selectedDisabilityStatus,
                      dropdownOnChanged: (DropdownItemModel? newValue) {
                        setState(() {
                          selectedDisabilityStatus = newValue!;
                        });
                      },
                    ),
                    singleFormField(
                      headline: "আপনি কি মুক্তিযোদ্ধা?",
                      isDropdownList: true,
                      dropdownList: freedomFighterStatus,
                      selectedValue: selectedFreedomFighterStatus,
                      dropdownOnChanged: (DropdownItemModel? newValue) {
                        setState(() {
                          selectedFreedomFighterStatus = newValue!;
                        });
                      },
                    ),
                    singleFormField(
                      headline: "পানির সংযোগ আছে কিনা?",
                      isDropdownList: true,
                      dropdownList: waterConnectivityStatus,
                      selectedValue: selectedWaterConnectivityStatus,
                      dropdownOnChanged: (DropdownItemModel? newValue) {
                        setState(() {
                          selectedWaterConnectivityStatus = newValue!;
                        });
                      },
                    ),
                    singleFormField(
                      headline: "পরিবারে জন্ম নিবন্ধনে কত জন আছে?",
                      controller: numberOfMemberHaveBirthCertificateController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "পরিবারে জন্ম নিবন্ধনে কত জন আছে?";
                        }
                        return null;
                      },
                    ),
                    singleFormField(
                        headline: "বাৎসরিক কর",
                        controller: annualTaxController,
                        isMandatory: false),
                    singleFormField(
                        headline: "সরকারি স্থাপনা?",
                        controller: isGovernmentHoldingController,
                        isMandatory: false),
                    singleFormField(
                        headline: "প্রতিষ্ঠানের নাম",
                        controller: govtOfficeNameController,
                        isMandatory: false),
                    singleFormField(
                        headline: "প্রতিষ্ঠান পরিচালকের নাম",
                        controller: govtOfficerNameController,
                        isMandatory: false),
                    singleFormField(
                        headline: "প্রতিষ্ঠান পরিচালকের মোবাইল নম্বর",
                        controller: govtOfficerMobileNoController,
                        isMandatory: false),
                    singleFormField(
                        headline: "প্রতিষ্ঠানের দৈর্ঘ্য",
                        controller: govtOfficeLengthController,
                        isMandatory: false),
                    singleFormField(
                        headline: "প্রতিষ্ঠানের প্রস্থ",
                        controller: govtOfficeWidthController,
                        isMandatory: false),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: ElevatedButton(
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
                )),
          )
        ],
      ),
    );
  }
}
