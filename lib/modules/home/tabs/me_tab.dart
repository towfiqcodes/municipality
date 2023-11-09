import 'package:Pourosova/models/dashboard/dashboard_response.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../blocs/auth/auth_bloc.dart';
import '../../../blocs/auth/auth_event.dart';
import '../../../blocs/auth/auth_state.dart';
import '../../../blocs/home/home_bloc.dart';
import '../../../blocs/home/home_event.dart';
import '../../../blocs/home/home_state.dart';
import '../../../models/response/users_response.dart';
import '../../../routes/route_path.dart';
import '../../../shared/constants/colors.dart';
import '../../../shared/utils/common_widget.dart';
import '../../../shared/utils/size_config.dart';
import '../../../shared/widgets/border_button.dart';
import '../../../shared/widgets/gradient_background.dart';
import '../../../shared/widgets/icon_title_item.dart';
import '../../../shared/widgets/profile_icon_text.dart';

class MeTab extends StatefulWidget {
  @override
  _MeTabState createState() => _MeTabState();
}

class _MeTabState extends State<MeTab> {
  DashboardData? user;

  @override
  void initState() {
    BlocProvider.of<HomeBloc>(context).add(HomeGetUserEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<HomeBloc, HomeState>(
          bloc: BlocProvider.of<HomeBloc>(context),
          listener: (context, state) {
            if (state is HomeGetUserSuccessState) {
              setState(() {
                user = state.user;
              });
            }
          },
        ),
        BlocListener<AuthBloc, AuthState>(
          bloc: BlocProvider.of<AuthBloc>(context),
          listener: (context, state) {
            if (state is AuthSignoutState) {
              Navigator.pushNamed(context, RoutePath.auth);
            }
          },
        ),
        BlocListener<AuthBloc, AuthState>(
          bloc: BlocProvider.of<AuthBloc>(context),
          listener: (context, state) {
            if (state is AuthSignoutState) {
              Navigator.pushNamed(context, RoutePath.root);
            }
          },
        ),

      ],
      child: _buildWidget(),
    );
  }

  Widget _buildWidget() {
    return Scaffold(
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(
                height: 60,
              ),
              Center(
                child:_buildAvatar()
              ),

              const SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                      color: Colors.grey.shade600, spreadRadius: 1, blurRadius: 2)
                ], color: Colors.white, borderRadius: BorderRadius.circular(5)),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      height: 40,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5),
                          topRight: Radius.circular(5),
                        ),
                      ),
                      child: Text(
                        "About",
                        style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                    ),
                    const Divider(color: Colors.black),
                    ProfileIconTextWidget(
                      icon: Icons.person_pin,
                      text1: "Name",
                      text2:"${user?.userInfo?.fullName}",
                    ),
                    const Divider(color: Colors.black),
                    ProfileIconTextWidget(
                      icon: Icons.phone_android_outlined,
                      text1: "Phone Number",
                      text2: "${user?.userInfo?.phone}",
                    ),
                    const Divider(color: Colors.black),
                    ProfileIconTextWidget(
                      icon: Icons.location_on,
                      text1: "Address",
                      text2: "${user?.companyInfo?.address}",
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                      color: Colors.grey.shade600, spreadRadius: 1, blurRadius: 2)
                ], color: Colors.white, borderRadius: BorderRadius.circular(5)),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      height: 40,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5),
                          topRight: Radius.circular(5),
                        ),
                      ),
                      child: Text(
                        "Settings",
                        style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                    ),
                    const Divider(color: Colors.black),
                    Container(
                      padding: const EdgeInsets.all(10),
                      height: 90,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(5),
                            bottomRight: Radius.circular(5),
                          )),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.lock,
                                color: ColorConstants.cardBackgroundColor,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "Change Password",
                                style: TextStyle(fontSize: 14),
                              )
                            ],
                          ),
                          Icon(Icons.arrow_forward_ios)
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: (){
                  BlocProvider.of<AuthBloc>(context).add(AuthSignoutEvent());
                },
                child: Container(
                  height: 50,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    color: ColorConstants.primaryColor,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                    child: Text(
                      "Logout",
                      style: GoogleFonts.lato(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );


  }

  Widget _buildUserInfo() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Me',
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 30,
        ),
      //  _buildAvatar(),
        SizedBox(
          height: 20,
        ),
        Container(
          margin: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
              border: Border.all(
                  width: 1, color: ColorConstants.linebackgroundColor),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  height: 30,
                  padding: EdgeInsets.only(left: 10.0, top: 10.0),
                  width: double.infinity,
                  color: ColorConstants.cardBackgroundColor,
                  child: Text("Holding",
                      style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w500,
                          color: ColorConstants.textColor,
                          fontSize: 12))),
              Divider(
                color: Colors.grey,
              ),
              Container(
                height: 80,
                padding: EdgeInsets.all(10.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                              color: ColorConstants.darkGray),
                          child: Image.asset(
                              'assets/images/ic_holding_entry.png'),
                        ),
                        CommonWidget.rowHeight(height: 5),
                        Text(
                          "Holding Entry",
                          style: GoogleFonts.roboto(
                              color: ColorConstants.textColor,
                              fontSize: 10,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                              color: ColorConstants.darkGray),
                          child: Image.asset(
                              'assets/images/ic_holding_card_active.png'),
                        ),
                        CommonWidget.rowHeight(height: 5),
                        Text(
                          "Holding Card Active",
                          style: GoogleFonts.roboto(
                              color: ColorConstants.textColor,
                              fontSize: 10,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                              color: ColorConstants.darkGray),
                          child: Image.asset(
                              'assets/images/ic_payment_receive.png'),
                        ),
                        CommonWidget.rowHeight(height: 5),
                        Text(
                          "Payment Receive",
                          style: GoogleFonts.roboto(
                              color: ColorConstants.textColor,
                              fontSize: 10,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildAvatar() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: ColorConstants.primaryColor),
        borderRadius: BorderRadius.circular(70),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(60.0),
          child: SizedBox(
            height: 110,
            width: 110,
            child:
          CachedNetworkImage(
              fit: BoxFit.fill,
              imageUrl:
                  user?.companyInfo?.logo ?? 'https://reqres.in/img/faces/1-image.jpg',
              placeholder: (context, url) => Image(
                image: AssetImage('assets/images/profile.webp'),
              ),
              errorWidget: (context, url, error) => Image(
                image: AssetImage('assets/images/profile.webp'),
              ),
            ),
          ),
        ),
      ),
    );
  }

}
