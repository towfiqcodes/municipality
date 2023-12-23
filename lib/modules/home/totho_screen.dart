import 'package:Pourosova/blocs/totho/totho_bloc.dart';
import 'package:Pourosova/modules/home/new_designs/address_information.dart';
import 'package:Pourosova/modules/home/new_designs/khana_prodhan_information.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/get_system/get_system_config_response.dart';
import '../../shared/utils/colors.dart';
import '../../shared/utils/common_widget.dart';
import '../../shared/widgets/medium_text_widget.dart';
import 'new_designs/family_info/family__information.dart';
import 'new_designs/other_information.dart';

class TothoScreen extends StatefulWidget {
  final String? title;

  const TothoScreen({Key? key, this.title}) : super(key: key);

  @override
  State<TothoScreen> createState() => _TothoScreenState();
}

class _TothoScreenState extends State<TothoScreen> {
  GetSystemConfigData? data;
  int page = 1;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<TothoBloc>(context).add(GetSystemConfigEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<TothoBloc, TothoState>(
      listener: (context, state) {
        if (state is GetSystemConfigSuccessState) {
          setState(() {
            data = state.systemConfigData;
          });
        }
        if (state is GetSystemConfigFailState) {
          CommonWidget.toast("Failed");
        }
        if (state is SetInformationTypeState) {
          setState(() {
            page = state.infoType!;
            print(state.infoType!);
          });
        }
      },
      child: data != null ? _buildWidget(context, data) : const SizedBox(),
    );
  }

  Widget _buildWidget(BuildContext context, GetSystemConfigData? data) {
    return SafeArea(
      child: Scaffold(
        appBar: CommonWidget.appBar(context, widget.title!, Icons.arrow_back_ios, Colors.green),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
          child: Column(
            children: [
              //image capture
              /*if (page == 1)
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(color: Colors.grey.shade600, spreadRadius: 1, blurRadius: 2)
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    width: double.maxFinite,
                    height: 40,
                    decoration: BoxDecoration(
                      color: AppColors.transGreenColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.camera_alt_rounded,
                          color: Colors.black38,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        MediumSizeText(
                          text: "Capture NID",
                          color: Colors.black,
                          weight: FontWeight.w300,
                          size: 16,
                        )
                      ],
                    ),
                  ),
                ),*/
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  _customTab(
                      title: "খানা প্রধানের তথ্য",
                      type: 1,
                      textColor: page == 1 ? AppColors.mainColor : Colors.black,
                      fontWeight: page == 1 ? FontWeight.bold : FontWeight.normal),
                  _customTab(
                      title: "ঠিকানা",
                      type: 2,
                      textColor: page == 2 ? AppColors.mainColor : Colors.black,
                      fontWeight: page == 2 ? FontWeight.bold : FontWeight.normal),
                  _customTab(
                      title: "অন্যান্য তথ্য",
                      type: 3,
                      textColor: page == 3 ? AppColors.mainColor : Colors.black,
                      fontWeight: page == 3 ? FontWeight.bold : FontWeight.normal),
                  _customTab(
                      title: "পারিবারিক সম্পর্ক সংক্রান্ত তথ্য",
                      type: 4,
                      textColor: page == 4 ? AppColors.mainColor : Colors.black,
                      fontWeight: page == 4 ? FontWeight.bold : FontWeight.normal),
                ],
              ),
              Expanded(
                child: page == 1
                    ? KhanaProdhanInformation(
                        data: data!,
                      )
                    : page == 2
                        ? AddressInformation(data: data!)
                        : page == 3
                            ? OtherInformation(data: data!)
                            : FamilyInformation(data: data!),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _customTab(
      {required String title,
      required Color textColor,
      required FontWeight fontWeight,
      required int type}) {
    return Expanded(
      child: GestureDetector(
        /*onTap: () {
          setState(() {
            page = type;
          });
          if (page == 1) {
            BlocProvider.of<TothoBloc>(context).add(const KhanaProdhanEvent(value: 1));
          }

          if (page == 2) {
            BlocProvider.of<TothoBloc>(context).add(const AddressEvent(value: 2));
          }

          if (page == 3) {
            BlocProvider.of<TothoBloc>(context).add(const OthersEvent(value: 3));
          }

          if (page == 4) {
            BlocProvider.of<TothoBloc>(context).add(const FamilyInformationEvent(value: 4));
          }
        },*/
        child: Container(
          height: MediaQuery.of(context).size.width * .23,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(border: Border.all(color: Colors.black38)),
          alignment: Alignment.center,
          child: Text(
            title,
            style: TextStyle(color: textColor, fontWeight: fontWeight),
          ),
        ),
      ),
    );
  }
}
