import 'package:flutter/material.dart';

import '../../routes/route_path.dart';
import '../../shared/constants/colors.dart';
import '../../shared/constants/common.dart';
import '../../shared/utils/size_config.dart';
import '../../shared/widgets/border_button.dart';
import '../../shared/widgets/gradient_button.dart';

class AuthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Center(
          child: _buildItems(context),
        ),
      ),
    );
  }

  Widget _buildItems(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(horizontal: 30.0),
      children: [
        Icon(
          Icons.home,
          size: SizeConfig().screenWidth * 0.26,
          color: Colors.blueGrey,
        ),
        SizedBox(height: 20.0),
        Text(
          'Welcome',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: CommonConstants.largeText,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).textTheme.headline6?.color,
          ),
        ),
        SizedBox(height: 10.0),
        Text(
          'Let\'s start now!',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: CommonConstants.normalText,
            color: Theme.of(context).textTheme.subtitle1?.color,
          ),
        ),
        SizedBox(height: 50.0),
        GradientButton(
          text: 'Sign In',
          onPressed: () {
            Navigator.pushNamed(context, RoutePath.login);
          },
        ),
        SizedBox(height: 20.0),
        BorderButton(
          text: 'Sign Up',
          onPressed: () {
            Navigator.pushNamed(context, RoutePath.register);
          },
        ),
        SizedBox(height: 62.0),
        Text(
          'This is a demo only used for test.',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: CommonConstants.smallText,
            color: ColorConstants.tipColor,
          ),
        ),
      ],
    );
  }
}
