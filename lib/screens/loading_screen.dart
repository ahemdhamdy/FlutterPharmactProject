import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pharmacy_helper/constants.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:pharmacy_helper/my_flutter_app_icons.dart';
import 'package:pharmacy_helper/size_config.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Stack(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    'Ph',
                    style: TextStyle(
                      shadows: [
                        Shadow(
                          color: Colors.black,
                          blurRadius: 25.0,
                          offset: Offset(3.0, 15.0),
                        ),
                      ],
                      letterSpacing: 9.0,
                      fontWeight: FontWeight.bold,
                      color: kRedCustomColor,
                      fontFamily: 'Righteous-Regular',
                      fontSize: SizeConfig.safeBlockHorizontal * 10,
                    ),
                  ),
                  Text(
                    'armacy',
                    style: TextStyle(
                      letterSpacing: 5.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontFamily: 'Righteous-Regular',
                      fontSize: SizeConfig.safeBlockHorizontal * 10,
                    ),
                  ),
                  Baseline(
                      child: Container(
                        color: kBackgroundColor,
                        width: SizeConfig.safeBlockHorizontal * 10,
                        height: SizeConfig.safeBlockHorizontal * 10,
                        child: SpinKitWanderingCubes(
                          size: SizeConfig.safeBlockHorizontal * 7,
                          itemBuilder: (_, int index) {
                            return DecoratedBox(
                              decoration: BoxDecoration(
                                color: index.isEven
                                    ? Colors.red.shade800
                                    : Colors.white,
                              ),
                            );
                          },
                        ),
                      ),
                      baseline: 0,
                      baselineType: TextBaseline.alphabetic),
                ],
              ),
              Center(
                child: ColorizeAnimatedTextKit(
                    text: ['Helper', 'Helper'],
                    textStyle: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 20.0,
                        fontFamily: 'Ubuntu-Regular',
                        fontSize: SizeConfig.safeBlockHorizontal * 5),
                    colors: [
                      kBackgroundColor,
                      Colors.white,
                      kBackgroundColor,
                      Colors.white
                    ],
                    textAlign: TextAlign.start,
                    alignment:
                        AlignmentDirectional.topStart // or Alignment.topLeft
                    ),
              ),
            ],
          ),
          Center(
            child: SvgPicture.asset(
              'assets/heart.svg',
              color: Colors.transparent.withAlpha(10),
            ),
          ),
        ],
      ),
    );
  }
}
