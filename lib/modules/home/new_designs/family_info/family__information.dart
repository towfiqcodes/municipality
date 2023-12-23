import 'dart:convert';

import 'package:Pourosova/blocs/totho/totho_bloc.dart';
import 'package:Pourosova/modules/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';
import '../../../../models/get_system/get_system_config_response.dart';
import '../../../../providers/holding_entry_provider.dart';
import '../../../../shared/constants/storage.dart';
import '../../../../shared/widgets/custom_text.dart';
import '../dropdown_item_model.dart';
import 'family_info_model.dart';
import 'dart:developer' as developer;

class FamilyInformation extends StatefulWidget {
  final GetSystemConfigData data;

  const FamilyInformation({Key? key, required this.data}) : super(key: key);

  @override
  State<FamilyInformation> createState() => _FamilyInformationState();
}

class _FamilyInformationState extends State<FamilyInformation> {
  List<FamilyInformationModel> familyInfoList = [];
  List<DropdownItemModel> relations = [];

  @override
  void initState() {
    mapDataToList();
    addDefaultField();
    super.initState();
  }

  void mapDataToList() {
    relations = widget.data.relation!.entries
        .map((entry) => DropdownItemModel(entry.key, entry.value))
        .toList();
    setState(() {});
    developer.log(relations.toString());
  }

  addDefaultField() async {
    final provider = context.read<HoldingEntryProvider>();

    if (provider.holdingEntryRequest.child == null) {
      familyInfoList.add(FamilyInformationModel(id: const Uuid().v4()));
    } else {
      familyInfoList = provider.holdingEntryRequest.child ?? [];
    }
    for (var info in familyInfoList) {
      print(info);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HoldingEntryProvider>(context);
    return Column(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black38),
            ),
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration:
                              BoxDecoration(border: Border.all(color: const Color(0xffB2B2B2))),
                          height: 50,
                          alignment: Alignment.center,
                          child: const CustomText(
                            text: "নাম",
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          decoration:
                              BoxDecoration(border: Border.all(color: const Color(0xffB2B2B2))),
                          height: 50,
                          alignment: Alignment.center,
                          child: const CustomText(
                            text: "সম্পর্ক",
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          decoration:
                              BoxDecoration(border: Border.all(color: const Color(0xffB2B2B2))),
                          height: 50,
                          alignment: Alignment.center,
                          child: const CustomText(
                            text: "প্রতিবন্ধী",
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          decoration:
                              BoxDecoration(border: Border.all(color: const Color(0xffB2B2B2))),
                          height: 50,
                          alignment: Alignment.center,
                          child: const CustomText(
                            text: "পরিচয় পত্র নম্বর",
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    itemCount: familyInfoList.length,
                    itemBuilder: (context, index) {
                      return familyMemberWidget(familyInfoList[index]);
                    },
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            familyInfoList.removeLast();
                          });
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.red.shade900),
                        ),
                        child: const CustomText(
                          text: "বাতিল করুন",
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            familyInfoList.add(FamilyInformationModel(id: const Uuid().v4()));
                          });
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(const Color(0xff008000)),
                        ),
                        child: const CustomText(
                          text: "নতুন তথ্য যোগ করুন",
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  )
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
                BlocProvider.of<TothoBloc>(context).add(const OthersEvent(value: 3));
              },
              child: const CustomText(text: "তালিকায় ফিরে যান"),
            ),
            ElevatedButton(
              onPressed: () {
                for (var info in familyInfoList) {
                  print(info);
                }
                _saveData(provider: provider);
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(const Color(0xff008000)),
              ),
              child: const CustomText(
                text: "সংরক্ষন করুন",
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            )
          ],
        ),
      ],
    );
  }

  Widget familyMemberWidget(FamilyInformationModel model) {
    int index = familyInfoList.indexWhere((element) => element.id == model.id);
    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(border: Border.all(color: const Color(0xffB2B2B2))),
            height: 50,
            alignment: Alignment.center,
            child: TextFormField(
              textAlign: TextAlign.center,
              cursorColor: Colors.black,
              style: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.normal, fontSize: 12.5),
              decoration: InputDecoration(
                  hintText: model.name,
                  hintStyle: const TextStyle(color: Colors.black, fontSize: 13),
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none),
              onChanged: (value) {
                familyInfoList[index].name = value;
                setState(() {});
              },
            ),
          ),
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color(0xffB2B2B2),
              ),
            ),
            height: 50,
            alignment: Alignment.center,
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
                  contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 2)),
              dropdownColor: Colors.grey.shade200,
              icon: const Icon(
                Icons.keyboard_arrow_down_sharp,
                color: Color(0xff444547),
                size: 24,
              ),
              hint: const CustomText(
                text: "",
                color: Colors.black,
                fontSize: 14,
              ),
              items: relations.map<DropdownMenuItem<DropdownItemModel>>((DropdownItemModel value) {
                return DropdownMenuItem<DropdownItemModel>(
                  value: value,
                  child:
                      CustomText(text: value.value, fontSize: 14, color: const Color(0xff070501)),
                );
              }).toList(),
              isDense: true,
              isExpanded: true,
              value: familyInfoList[index].gender != null
                  ? relations.firstWhere((element) => element.key == familyInfoList[index].gender)
                  : null,
              onChanged: (value) {
                familyInfoList[index].gender = value!.key;
                setState(() {});
              },
            ),
          ),
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(border: Border.all(color: const Color(0xffB2B2B2))),
            height: 50,
            alignment: Alignment.center,
            child: Checkbox(
              value: model.disability == "1" ? true : false,
              onChanged: (value) {
                familyInfoList[familyInfoList.indexWhere((element) => element.id == model.id)]
                    .disability = value == true ? "1" : "2";
                setState(() {});
              },
            ),
          ),
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(border: Border.all(color: const Color(0xffB2B2B2))),
            height: 50,
            alignment: Alignment.center,
            child: TextFormField(
              textAlign: TextAlign.center,
              cursorColor: Colors.black,
              style: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.normal, fontSize: 12.5),
              decoration: InputDecoration(
                  hintText: model.nid,
                  hintStyle: const TextStyle(color: Colors.black, fontSize: 13),
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none),
              onChanged: (value) {
                familyInfoList[familyInfoList.indexWhere((element) => element.id == model.id)].nid =
                    value;
                setState(() {});
              },
            ),
          ),
        ),
      ],
    );
  }

  void _saveData({required HoldingEntryProvider provider}) async {
    provider.updateHoldingEntryRequest(child: familyInfoList);
    provider.updateHoldingEntryRequest(planApprovalStatus: "1");
    developer.log(jsonEncode(provider.holdingEntryRequest.toJson()));

    var response = await provider.createNewHouseHolding();

    if (response?.statusCode == 200) {
      if (jsonDecode(response!.body)["error"] == false) {
        Fluttertoast.showToast(msg: "Data stored successfully!");
        Navigator.push(context, MaterialPageRoute(builder: (_) => HomeScreen()));
      } else {
        Fluttertoast.showToast(msg: "Something went wrong!");
      }
    } else if (response?.statusCode == 401) {
      Fluttertoast.showToast(msg: "Session timeout. Please login again!");
    } else {
      Fluttertoast.showToast(msg: "Something went wrong!");
    }

    developer.log(response?.body ?? "");
  }
}
