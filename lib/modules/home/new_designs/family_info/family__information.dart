import 'package:Pourosova/blocs/totho/totho_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';
import '../../../../models/get_system/get_system_config_response.dart';
import '../../../../shared/constants/storage.dart';
import '../../../../shared/widgets/custom_text.dart';
import 'family_info_model.dart';

class FamilyInformation extends StatefulWidget {
  final GetSystemConfigData data;

  const FamilyInformation({Key? key, required this.data}) : super(key: key);

  @override
  State<FamilyInformation> createState() => _FamilyInformationState();
}

class _FamilyInformationState extends State<FamilyInformation> {
  List<FamilyInformationModel> familyInfoList = [];

  @override
  void initState() {
    addDefaultField();
    super.initState();
  }

  addDefaultField() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String familyInfo = prefs.getString(StorageConstants.familyInfo) ?? "";

    if (familyInfo == "") {
      familyInfoList.add(FamilyInformationModel(id: const Uuid().v4()));
      familyInfoList.add(FamilyInformationModel(id: const Uuid().v4()));
    } else {
      familyInfoList = FamilyInformationModel.decode(familyInfo);
    }
    for(var info in familyInfoList) {
      print(info);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
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
                for(var info in familyInfoList) {
                  print(info);
                }
                _saveData();
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
                familyInfoList[familyInfoList.indexWhere((element) => element.id == model.id)]
                    .name = value;
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
            child: TextFormField(
              textAlign: TextAlign.center,
              cursorColor: Colors.black,
              style: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.normal, fontSize: 12.5),
              decoration:  InputDecoration(
                  hintText: model.relation,
                  hintStyle: const TextStyle(color: Colors.black, fontSize: 13),
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none),
              onChanged: (value) {
                familyInfoList[familyInfoList.indexWhere((element) => element.id == model.id)]
                    .relation = value;
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
              value: model.isAutistic,
              onChanged: (value) {
                familyInfoList[familyInfoList.indexWhere((element) => element.id == model.id)]
                    .isAutistic = value!;
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
              decoration:  InputDecoration(
                  hintText: model.nidNo,
                  hintStyle: const TextStyle(color: Colors.black, fontSize: 13),
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none),
              onChanged: (value) {
                familyInfoList[familyInfoList.indexWhere((element) => element.id == model.id)]
                    .nidNo = value;
                setState(() {});
              },
            ),
          ),
        ),
      ],
    );
  }

  void _saveData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String familyInformation = FamilyInformationModel.encode(familyInfoList);
    prefs.setString(StorageConstants.familyInfo, familyInformation);
  }
}
