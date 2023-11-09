part of 'totho_bloc.dart';

abstract class TothoState extends Equatable {
  const TothoState();
  @override
  List<Object> get props => [];
}

class TothoInitial extends TothoState {}

class GetSystemConfigSuccessState extends TothoState {
  final GetSystemConfigData? systemConfigData;

  const GetSystemConfigSuccessState({this.systemConfigData});

  @override
  List<Object> get props => [systemConfigData!];
}

class GetSystemConfigFailState extends TothoState {
  final String? message;

  const GetSystemConfigFailState({this.message = ""});

  @override
  List<Object> get props => [message!];
}

class SetInformationTypeState extends TothoState {
  final int? infoType;

  const SetInformationTypeState({this.infoType});

  @override
  List<Object> get props => [infoType!];
}


class FamilyInfoState extends TothoState {
  final List<FamilyInformationModel> familyInfoList;

  const FamilyInfoState({this.familyInfoList = const []});

  @override
  List<Object> get props => [FamilyInfoState];
}