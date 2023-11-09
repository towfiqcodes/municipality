import 'dart:async';

import 'package:Pourosova/shared/constants/common.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

import '../../api/api_provider.dart';
import '../../api/api_repository.dart';
import '../../models/get_system/get_system_config_response.dart';
import '../../modules/home/new_designs/family_info/family_info_model.dart';

part 'totho_event.dart';
part 'totho_state.dart';

class TothoBloc extends Bloc<TothoEvent, TothoState> {
  TothoBloc() : super(TothoInitial()) ;

  final ApiRepository _apiRepository = ApiRepository(apiProvider: new ApiProvider());
  String selectedPage = CommonConstants.khanaProdhanTottho;

  @override
  Stream<TothoState> mapEventToState(TothoEvent event) async* {
    if (event is GetSystemConfigEvent) {
      yield* _mapGetSystemConfigState(event);
    }

    if (event is KhanaProdhanEvent) {
      yield* _mapSetInformationTypeEventToState(event);
    }

    if (event is AddressEvent) {
      yield* _mapSetInformationTypeEventToState(event);
    }

    if (event is OthersEvent) {
      yield* _mapSetInformationTypeEventToState(event);
    }

    if (event is FamilyInformationEvent) {
      yield* _mapSetInformationTypeEventToState(event);
    }

    if (event is AddFamilyInfoEvent) {
      yield* _mapAddFamilyInfoEventToState(event);
    }

  }


  Stream<TothoState> _mapGetSystemConfigState(GetSystemConfigEvent event) async* {
    try {
      print("fetching data");
      final res = await _apiRepository.getSystemData();
      if (res.error==false) {
        print("fetching data finish");
        yield GetSystemConfigSuccessState(systemConfigData: res.data!);
      } else {
        yield const GetSystemConfigFailState(message: '');
      }
    } catch (e) {
      if(e is DioError){
        if(e.response?.statusCode==401){
          print("object ${e.response?.statusCode}");
        }
      }
    }
  }

  Stream<TothoState> _mapSetInformationTypeEventToState(TothoEvent event) async* {
    if(event is KhanaProdhanEvent){
      print("infoType = ${event.value}");
      yield SetInformationTypeState(infoType: event.value);
    }

    if(event is AddressEvent){
      yield SetInformationTypeState(infoType: event.value);
    }

    if(event is OthersEvent){
      yield SetInformationTypeState(infoType: event.value);
    }

    if(event is FamilyInformationEvent){
      yield SetInformationTypeState(infoType: event.value);
    }
  }


  Stream<TothoState> _mapAddFamilyInfoEventToState(AddFamilyInfoEvent event) async* {
    event.familyInfoList.add(FamilyInformationModel(id: const Uuid().v4()));
    yield FamilyInfoState(familyInfoList: event.familyInfoList);
  }
}
