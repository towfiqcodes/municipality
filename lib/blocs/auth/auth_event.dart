import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../models/request/login_request.dart';
import '../../models/request/register_request.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AuthAppInitEvent extends AuthEvent {}

class AuthRegisterEvent extends AuthEvent {
  final RegisterRequest? registerRequest;

  const AuthRegisterEvent({this.registerRequest});

  @override
  List<Object> get props => [registerRequest!];
}

class AuthLoginEvent extends AuthEvent {
  final LoginRequest? loginRequest;

  const AuthLoginEvent({this.loginRequest});

  @override
  List<Object> get props => [loginRequest!];
}

class AuthSignoutEvent extends AuthEvent {}
// class AuthOnTapEvent extends AuthEvent {
//
// }

class Increment extends AuthEvent {
  final int value1;
  const Increment({this.value1 = 1});
}

class Decrement extends AuthEvent {
  final int value1;
  const Decrement({this.value1 = 2});
}

