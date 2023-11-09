import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitState extends AuthState {}

class AuthSuccessState extends AuthState {}

class AuthFailState extends AuthState {}

class AuthRegisterSuccessState extends AuthState {}

class AuthRegisterFailState extends AuthState {
  final String message;

  AuthRegisterFailState({ this.message=""});

  @override
  List<Object> get props => [message];
}

class AuthLoginSuccessState extends AuthState {}

class AuthLoginFailState extends AuthState {
  final String message;

  AuthLoginFailState({this.message=""});

  @override
  List<Object> get props => [message];
}

class AuthSignoutState extends AuthState {}

class AuthOnTapState extends AuthState {
  final int flag;
  AuthOnTapState({this.flag=1});

  @override
  List<Object> get props => [flag];}

class AuthAppFailureState extends AuthState {
  final String message;

  AuthAppFailureState({ this.message=""});

  @override
  List<Object> get props => [message];
}
