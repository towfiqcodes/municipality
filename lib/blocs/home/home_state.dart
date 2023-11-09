import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../models/dashboard/dashboard_response.dart';
import '../../models/response/users_response.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitState extends HomeState {}

class HomeLoadUsersSuccessState extends HomeState {
  final DashboardData? users;

  HomeLoadUsersSuccessState({this.users});

  @override
  List<Object> get props => [users!];
}

class HomeLoadUsersFailState extends HomeState {
  final String? message;

  HomeLoadUsersFailState({this.message = ""});

  @override
  List<Object> get props => [message!];
}

class HomeGetUserSuccessState extends HomeState {
  final DashboardData? user;

  HomeGetUserSuccessState({this.user});

  @override
  List<Object> get props => [user!];
}

class HomeGetUserFailState extends HomeState {
  final String? message;

  HomeGetUserFailState({this.message = ""});

  @override
  List<Object> get props => [message!];
}

class HomeFailureState extends HomeState {
  final String? message;

  HomeFailureState({this.message = ""});

  @override
  List<Object> get props => [message!];
}
