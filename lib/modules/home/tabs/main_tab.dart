import 'package:Pourosova/models/dashboard/dashboard_response.dart';
import 'package:Pourosova/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../blocs/home/home_bloc.dart';
import '../../../blocs/home/home_event.dart';
import '../../../blocs/home/home_state.dart';
import '../../../models/response/users_response.dart';
import '../../../routes/route_path.dart';
import '../../../shared/constants/colors.dart';
import '../../../shared/utils/common_widget.dart';
import '../totho_screen.dart';

class MainTab extends StatefulWidget {
  @override
  _MainTabState createState() => _MainTabState();
}

class _MainTabState extends State<MainTab> {
  // List<Datum> users = [];
  DashboardData? users;

  @override
  void initState() {
    BlocProvider.of<HomeBloc>(context).add(HomeLoadUsersEvent());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeBloc, HomeState>(
      bloc: BlocProvider.of<HomeBloc>(context),
      listener: (context, state) {
        if (state is HomeLoadUsersSuccessState) {
          setState(() {
            users = state.users!;
          });
        }

        if (state is HomeLoadUsersFailState) {
          CommonWidget.toast(state.message!);
        }
      },
      child: Container(
        color: Colors.cyan,
        child: _buildWidget(),
      ),
    );
  }

  Widget _buildWidget() {
    return SafeArea(
      child: Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * .25,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/img.png"),
                fit: BoxFit.fill,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://images.unsplash.com/photo-1547721064-da6cfb341d50'),
                  ),
                  CommonWidget.rowHeight(height: 20),
                  Text(
                    users?.companyInfo?.name??"N/A",
                    style: GoogleFonts.roboto(
                        fontSize: CommonConstants.mediumText,
                        color: ColorConstants.white,
                        fontWeight: FontWeight.bold),
                  ),
                  CommonWidget.rowHeight(height: 20),
                  Text(
                    users?.userInfo?.fullName??"N/A",
                    style: GoogleFonts.roboto(
                        fontSize: CommonConstants.xSmallText,
                        color: ColorConstants.white,
                        fontWeight: FontWeight.w500),
                  ),
                  CommonWidget.rowHeight(height: 10),
                  Text(
                    users?.userInfo?.phone??"01*********",
                    style: GoogleFonts.roboto(
                        fontSize: CommonConstants.xSmallText,
                        color: ColorConstants.white,
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),
          ),
          Row(
            children: [
              IconTitleItem(
                title: "${users?.totalHolding}",
                subTitle: 'Holding Entry',
                icon: 'assets/images/ic_holding_entry.png',
                marginLeft: 10,
                backgroundColor: ColorConstants.holdingbackgroundColor,
                onTap: () {
                //  Navigator.pushNamed(context, RoutePath.cards);
                },
              ),
              IconTitleItem(
                title: "${users?.activeHolding}",
                subTitle: 'Holding Card Active',
                icon: 'assets/images/ic_holding_card_active.png',
                marginLeft: 5,
                backgroundColor: ColorConstants.holdingCardbackgroundColor,
                onTap: () {
                 // Navigator.pushNamed(context, RoutePath.cards);
                },
              ),
            ],
          ),
          Row(
            children: [
              IconTitleItem(
                title: "${users?.tradeLicenses}",
                subTitle: 'Trading Entry',
                icon: 'assets/images/ic_trading_entry.png',
                marginLeft: 10,
                backgroundColor: ColorConstants.tradingbackgroundColor,
                onTap: () {
                 // Navigator.pushNamed(context, RoutePath.cards);
                },
              ),
              IconTitleItem(
                title: "${users?.activeTrade}",
                subTitle: 'Trading Card Active',
                icon: 'assets/images/ic_trading_card_active.png',
                marginLeft: 5,
                backgroundColor: ColorConstants.tradingCardbackgroundColor,
                onTap: () {
                 // Navigator.pushNamed(context, RoutePath.cards);
                },
              ),
            ],
          ),
         //holding
        Container(
          margin: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            border: Border.all(
                width: 1, color: ColorConstants.lineColor),
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
                    InkWell(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const TothoScreen(title: "Holding Entry",)),
                        );
                      },
                      child: Column(
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
          //trading
          // Container(
          //   margin: const EdgeInsets.all(10.0),
          //   decoration: BoxDecoration(
          //     border: Border.all(
          //         width: 1, color: ColorConstants.linebackgroundColor),
          //     borderRadius: BorderRadius.circular(10),
          //   ),
          //   child: Card(
          //     color: Colors.white,
          //     shadowColor: Colors.grey,
          //     elevation: 5,
          //     child: Column
          //       (
          //       mainAxisAlignment: MainAxisAlignment.center,
          //       crossAxisAlignment: CrossAxisAlignment.center,
          //       children: [
          //         Container(
          //           height: 30,
          //           padding: EdgeInsets.only(left: 10.0,top: 10.0),
          //           width: double.infinity,
          //           color: ColorConstants.cardBackgroundColor,
          //             child: Text("Trading", style: GoogleFonts.roboto(fontWeight: FontWeight.w500, color: ColorConstants.textColor, fontSize: 12))),
          //         Divider(
          //           color: Colors.grey,
          //         ),
          //         Container(
          //           height: 80,
          //           padding: EdgeInsets.all(10.0),
          //           child: Row(
          //             crossAxisAlignment: CrossAxisAlignment.start,
          //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //             children: [
          //               Column(
          //                 crossAxisAlignment: CrossAxisAlignment.center,
          //                 mainAxisAlignment: MainAxisAlignment.center,
          //                 children: [
          //                   Container(
          //                     height: 30,
          //                     width: 30,
          //                     decoration: BoxDecoration(
          //                         borderRadius: BorderRadius.all(Radius.circular(30)),
          //                         color: ColorConstants.darkGray),
          //                     child: Image.asset('assets/images/ic_trading_entry.png'),
          //                   ),
          //                   CommonWidget.rowHeight(height: 5),
          //                   Text(
          //                     "Trading Entry",
          //                     style: GoogleFonts.roboto(
          //                         color: ColorConstants.textColor,
          //                         fontSize: 10,
          //                         fontWeight: FontWeight.w400),
          //                   ),
          //                 ],
          //               ),
          //               Column(
          //                 crossAxisAlignment: CrossAxisAlignment.center,
          //                 mainAxisAlignment: MainAxisAlignment.center,
          //                 children: [
          //                   Container(
          //                     height: 30,
          //                     width: 30,
          //                     decoration: BoxDecoration(
          //                         borderRadius: BorderRadius.all(Radius.circular(30)),
          //                         color: ColorConstants.darkGray),
          //                     child: Image.asset('assets/images/ic_trading_card_active.png'),
          //                   ),
          //                   CommonWidget.rowHeight(height: 5),
          //                   Text(
          //                     "Trading Card Active",
          //                     style: GoogleFonts.roboto(
          //                         color: ColorConstants.textColor,
          //                         fontSize: 10,
          //                         fontWeight: FontWeight.w400),
          //                   ),
          //                 ],
          //               ),
          //               Column(
          //                 crossAxisAlignment: CrossAxisAlignment.center,
          //                 mainAxisAlignment: MainAxisAlignment.center,
          //                 children: [
          //                   Container(
          //                     height: 30,
          //                     width: 30,
          //                     decoration: BoxDecoration(
          //                         borderRadius: BorderRadius.all(Radius.circular(30)),
          //                         color: ColorConstants.darkGray),
          //                     child: Image.asset('assets/images/ic_payment_receive.png'),
          //                   ),
          //                   CommonWidget.rowHeight(height: 5),
          //
          //                   Text(
          //                     "Payment Receive",
          //                     style: GoogleFonts.roboto(
          //                         color: ColorConstants.textColor,
          //                         fontSize: 10,
          //                         fontWeight: FontWeight.w400),
          //                   ),
          //                 ],
          //               ),
          //             ],
          //           ),
          //         )
          //
          //       ],
          //     ),
          //
          //   ),
          // ),

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
                    padding: EdgeInsets.only(left: 10.0,top: 10.0),
                    width: double.infinity,
                    color: ColorConstants.cardBackgroundColor,
                    child: Text("Trading", style: GoogleFonts.roboto(fontWeight: FontWeight.w500, color: ColorConstants.textColor, fontSize: 12))),
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
                                borderRadius: BorderRadius.all(Radius.circular(30)),
                                color: ColorConstants.darkGray),
                            child: Image.asset('assets/images/ic_trading_entry.png'),
                          ),
                          CommonWidget.rowHeight(height: 5),
                          Text(
                            "Trading Entry",
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
                                borderRadius: BorderRadius.all(Radius.circular(30)),
                                color: ColorConstants.darkGray),
                            child: Image.asset('assets/images/ic_trading_card_active.png'),
                          ),
                          CommonWidget.rowHeight(height: 5),
                          Text(
                            "Trading Card Active",
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
                                borderRadius: BorderRadius.all(Radius.circular(30)),
                                color: ColorConstants.darkGray),
                            child: Image.asset('assets/images/ic_payment_receive.png'),
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
      )

          // StaggeredGridView.countBuilder(
          //   crossAxisCount: 4,
          //   itemCount: users.length,
          //   itemBuilder: (BuildContext context, int index) => new Container(
          //     color: ColorConstants.lightGray,
          //     child: Column(
          //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //       children: [
          //         Text('${users[index].lastName} ${users[index].firstName}'),
          //         CachedNetworkImage(
          //           fit: BoxFit.fill,
          //           imageUrl: users[index].avatar ??
          //               'https://reqres.in/img/faces/1-image.jpg',
          //           placeholder: (context, url) => Image(
          //             image: AssetImage('assets/images/icon_success.png'),
          //           ),
          //           errorWidget: (context, url, error) => Icon(Icons.error),
          //         ),
          //         Text('${users[index].email}'),
          //       ],
          //     ),
          //   ),
          //   staggeredTileBuilder: (int index) =>
          //       new StaggeredTile.count(2, index.isEven ? 3 : 2),
          //   mainAxisSpacing: 4.0,
          //   crossAxisSpacing: 4.0,
          // ),
          ),
    );
  }
}
