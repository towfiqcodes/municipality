import 'package:flutter/material.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

import '../shared.dart';

class GradientBackground extends StatelessWidget {
  final bool needWave;
  final Widget? child;
  final bool needTopSafeArea;
  final bool needTopRadius;

  GradientBackground({
    Key? key,
    this.needWave = true,
    this.needTopSafeArea = true,
    this.needTopRadius = false,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return needTopSafeArea
        ? Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/ic_login_bg.jpg"), fit: BoxFit.fill),
        borderRadius: needTopRadius
            ? BorderRadius.only(
          topLeft: Radius.circular(25.0),
          topRight: Radius.circular(25.0),
        )
            : null,

      ),
            child: SafeArea(
              child: _buildBackground(context),
            ),
          )
        : _buildBackground(context);
  }

  Widget _buildBackground(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
    image: DecorationImage(
        image: AssetImage("assets/images/ic_login_bg.jpg", ), fit: BoxFit.cover),
            borderRadius: needTopRadius
                ? BorderRadius.only(
                    topLeft: Radius.circular(25.0),
                    topRight: Radius.circular(25.0),
                  )
                : null,

          ),
          child: child,
        ),
        if (needWave)
          Positioned(
            bottom: 0,
            left: 0,
            child: WaveWidget(
              config: CustomConfig(
                gradients: [
                  // [ColorConstants.darkOrange, ColorConstants.lightOrange],
                  // [ColorConstants.darkOrange, hexToColor('#FFD4AA')],
                  // [ColorConstants.lightOrange, hexToColor('#FFD4AA')],
                  // [hexToColor('#FF2A00'), hexToColor('#FFD4AA')]
                  [ColorConstants.primaryColor, ColorConstants.toscaColor],
                  [ColorConstants.primaryColor, hexToColor('#808D9E')],
                  [ColorConstants.lightOrange, hexToColor('#E9ECF2')],
                  [hexToColor('#808D9E'), hexToColor('#E9ECF2')]
                ],
                durations: [35000, 19440, 10800, 6000],
                heightPercentages: [0.20, 0.23, 0.25, 0.30],
                blur: MaskFilter.blur(BlurStyle.solid, 1),
                gradientBegin: Alignment.bottomLeft,
                gradientEnd: Alignment.topRight,
              ),
              waveAmplitude: 20,
              size: Size(
                MediaQuery.of(context).size.width,
                60.0,
              ),
            ),
          ),
      ],
    );
  }
}
