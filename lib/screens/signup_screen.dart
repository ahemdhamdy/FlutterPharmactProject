import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pharmacy_helper/components/CustomShape.dart';
import 'package:shape_of_view/shape_of_view.dart';
import 'package:flutter/material.dart';
import 'package:pharmacy_helper/size_config.dart';
import 'package:pharmacy_helper/constants.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:pharmacy_helper/components/CustomShape.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Positioned(
              child: Align(
                  alignment: FractionalOffset.topCenter,
                  child: Container(
                    child: ClipPath(
                      clipper: CustomShapeClipper(),
                      child: Container(
                        height: 600,
                        width: 500,
                        color: kBackgroundColor,
                      ),
                    ),
                  ))),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
////          ClipPath(
////            clipper: ArcClipper(),
////            child: Container(
////              decoration: BoxDecoration(
////                //color: Colors.blue,
////                gradient: LinearGradient(
////                  begin: FractionalOffset.bottomLeft,
////                  end: FractionalOffset.topRight,
////                  colors: <Color>[kBackgroundColor, Colors.blue.shade500],
////                ),
////              ),
////              height: 150,
////              width: 100,
////            ),
////          ),
//              ShapeOfView(
//                elevation: 10,
//                shape: ArcShape(
//                    direction: ArcDirection.Outside,
//                    height: 20,
//                    position: ArcPosition.Bottom),
//                child: Container(
//                  decoration: BoxDecoration(
//                    gradient: LinearGradient(
//                      begin: FractionalOffset.bottomLeft,
//                      end: FractionalOffset.topRight,
//                      colors: <Color>[kBackgroundColor, Colors.blue.shade500],
//                    ),
//                  ),
//                  height: 100,
//                  width: 100,
//                ),
//              ),

              Container(
                padding: EdgeInsets.only(bottom: 12.0, top: 100.0),
                child: Center(
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                      fontFamily: 'Ubuntu-Regular',
                      fontSize: SizeConfig.safeBlockHorizontal * 13,
                      fontWeight: FontWeight.w900,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Center(
                child: Text(
                  'It\'s easier to sign up now',
                  style: TextStyle(
                    fontFamily: 'Courgette-Regular',
                    fontSize: SizeConfig.safeBlockHorizontal * 5,
                    fontWeight: FontWeight.normal,
                    color: Colors.grey.shade500,
                  ),
                ),
              ),
              Center(
                child: Container(
                  width: SizeConfig.safeBlockHorizontal * 90,
                  padding: EdgeInsets.only(top: 50.0, bottom: 20.0),
                  child: SignInButtonBuilder(
                    backgroundColor: Color(0xFFC02127),
                    image: SvgPicture.asset(
                      'assets/googleicon.svg',
                      width: 48.0,
                      height: 48.0,
                    ),
                    text: 'Sign up with Google',
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    )),
                    onPressed: () {},
                  ),
                ),
              ),
              Center(
                child: Container(
                  height: 50.0,
                  width: SizeConfig.safeBlockHorizontal * 57,
                  //padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 10.0),
                  child: SignInButtonBuilder(
                    elevation: 2,
                    icon: Icons.mail_outline,
                    innerPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                    backgroundColor: Colors.white,
                    iconColor: Colors.grey,
                    text: 'I\'ll use email or phone',
                    textColor: Colors.grey,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(30),
                        ),
                        side: BorderSide(color: Colors.grey)),
                    onPressed: () {},
                  ),
                ),
              ),
//              SizedBox(
//                height: SizeConfig.blockSizeVertical * 10,
//              ),
            ],
          ),
          Positioned(
            child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: Container(
                  padding: EdgeInsets.only(bottom: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Already have account?',
                        style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: SizeConfig.safeBlockHorizontal * 3.5,
                            fontFamily: 'Courgette-Regular'),
                      ),
                      Text(
                        'Login',
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            decorationStyle: TextDecorationStyle.solid,
                            fontSize: SizeConfig.safeBlockHorizontal * 3.7,
                            color: Colors.blue),
                      )
                    ],
                  ),
                )),
          )
        ],
      ),
    );
  }
}
