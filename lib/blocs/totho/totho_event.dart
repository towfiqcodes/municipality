part of 'totho_bloc.dart';

abstract class TothoEvent extends Equatable {
  const TothoEvent();

  @override
  List<Object> get props => [];
}

class TothoInitEvent extends TothoEvent {}

class GetSystemConfigEvent extends TothoEvent {}

class KhanaProdhanEvent extends TothoEvent {
  final int value;

  const KhanaProdhanEvent({this.value = 1});
}

class AddressEvent extends TothoEvent {
  final int value;

  const AddressEvent({this.value = 2});
}

class OthersEvent extends TothoEvent {
  final int value;

  const OthersEvent({this.value = 3});
}

class FamilyInformationEvent extends TothoEvent {
  final int value;

  const FamilyInformationEvent({this.value = 4});
}

class AddFamilyInfoEvent extends TothoEvent {
  final List<FamilyInformationModel> familyInfoList;

  const AddFamilyInfoEvent({this.familyInfoList = const []});
}
