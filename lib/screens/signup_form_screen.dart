import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:pharmacy_helper/constants.dart';
import 'package:pharmacy_helper/size_config.dart';
import 'package:pharmacy_helper/components/CustomShape.dart';

class SignUpFormScreen extends StatefulWidget {
  @override
  _SignUpFormScreenState createState() => _SignUpFormScreenState();
}

class _SignUpFormScreenState extends State<SignUpFormScreen> {
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();
  final FocusNode _UsernameFocus = FocusNode();
  final FocusNode _EmailFocus = FocusNode();
  final FocusNode _PasswardFocus = FocusNode();
  final FocusNode _PhoneFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Stack(
        children: <Widget>[
          Positioned(
              child: Align(
                  alignment: FractionalOffset.topCenter,
                  child: Container(
                    child: ClipPath(
                      clipper: CustomShapeClipper(),
                      child: Container(
                        height: SizeConfig.blockSizeVertical * 90,
                        width: SizeConfig.screenWidth,
                        color: Colors.white,
                      ),
                    ),
                  ))),
          Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: SizeConfig.blockSizeVertical * 5,
                  ),
                  FormBuilder(
                    key: _fbKey,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: SizeConfig.safeBlockHorizontal * 7,
                          vertical: 0.0),
                      child: Column(
                        children: <Widget>[
                          InputFormFieldRound(
                            iAttribute: 'USER NAME',
                            iLabelText: 'USER NAME',
                            iHintText: 'ex\.Jacoup josef',
                            iFocusNode: _UsernameFocus,
                            iNextFocusNode: _EmailFocus,
                            iKeyboardType: TextInputType.text,
                            iValidators: [
                              FormBuilderValidators.required(
                                  errorText: 'This field Cannot be empty'),
                              FormBuilderValidators.maxLength(25),
                            ],
                          ),
                          SizedBox(
                            height: SizeConfig.blockSizeVertical * 2.2,
                          ),
                          InputFormFieldRound(
                            iAttribute: 'EMAIL ADDRESS',
                            iLabelText: 'EMAIL ADDRESS',
                            iHintText: 'ex\.jacoup@example.com',
                            iFocusNode: _EmailFocus,
                            iNextFocusNode: _PasswardFocus,
                            iKeyboardType: TextInputType.emailAddress,
                            iValidators: [
                              FormBuilderValidators.required(),
                              FormBuilderValidators.email(
                                  errorText: 'Unvalid Email address'),
                              FormBuilderValidators.maxLength(100),
                            ],
                          ),
                          SizedBox(
                            height: SizeConfig.blockSizeVertical * 2.2,
                          ),
                          InputFormFieldRound(
                            iAttribute: 'PASSWORD',
                            iLabelText: 'PASSWORD',
                            iHintText: '000000',
                            iFocusNode: _PasswardFocus,
                            iKeyboardType: TextInputType.text,
                            iInputAction: TextInputAction.done,
                            iValidators: [
                              FormBuilderValidators.required(),
                              FormBuilderValidators.minLength(6),
                              FormBuilderValidators.maxLength(30),
                              (val) {
                                String pattern =
                                    r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])';
                                RegExp regExp = new RegExp(pattern);
                                if (!regExp.hasMatch(val)) {
                                  return 'Invalid passward :  1 uppercase, compine chars and numbers';
                                }
                              }
                            ],
                            iObscureText: true,
                          ),
                          Transform.scale(
                            scale: 0.8,
                            child: FormBuilderSwitch(
                              inactiveThumbColor: Colors.black,
                              activeTrackColor: Colors.black87,
                              activeColor: Colors.lightBlue,
                              decoration: InputDecoration(
                                errorStyle: TextStyle(
                                  color: Colors.red.shade300,
                                  fontWeight: FontWeight.bold,
                                ),
                                border: InputBorder.none,
                              ),
                              label: Text(
                                'I accept the tems and conditions',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              attribute: "accept_terms_switch",
                              initialValue: false,
                              validators: [
                                FormBuilderValidators.requiredTrue(
                                  errorText:
                                      "You must accept terms and conditions to continue",
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: SizeConfig.safeBlockHorizontal * 50,
                            child: MaterialButton(
                              minWidth: 30.0,
                              padding: EdgeInsets.symmetric(
                                  vertical: 12.0, horizontal: 10.0),
                              height: SizeConfig.safeBlockVertical * 3,
                              shape: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.grey, width: 2.0),
                                  borderRadius: BorderRadius.circular(30.0)),
                              highlightElevation: 2,
                              colorBrightness: Brightness.dark,
                              splashColor: Colors.black12,
                              child: Center(
                                  child: FittedBox(
                                fit: BoxFit.fill,
                                child: Text(
                                  "Sign Up",
                                  style: TextStyle(
                                      fontSize: 15.0,
                                      letterSpacing: 3.0,
                                      color: Colors.black,
                                      fontFamily: 'Courgette-Regular',
                                      fontWeight: FontWeight.w900),
                                ),
                              )),
                              onPressed: () {
                                if (_fbKey.currentState.saveAndValidate()) {
                                  print(_fbKey.currentState.value);
                                }
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class InputFormFieldRound extends StatelessWidget {
  InputFormFieldRound(
      {this.iAttribute,
      this.iLabelText,
      this.iHintText,
      this.iFocusNode,
      this.iNextFocusNode,
      this.iValidators,
      this.iKeyboardType,
      this.iInputAction = TextInputAction.next,
      this.iObscureText = false});
  final TextInputAction iInputAction;
  final FocusNode iFocusNode;
  final FocusNode iNextFocusNode;
  final String iAttribute;
  final String iLabelText;
  final String iHintText;
  final bool iObscureText;
  final TextInputType iKeyboardType;
  final List<FormFieldValidator> iValidators;

  _fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      focusNode: iFocusNode,
      cursorColor: Colors.blueGrey,
      textInputAction: iInputAction,
      maxLines: 1,
      autofocus: true,
      keyboardType: iKeyboardType,
      obscureText: iObscureText,
      onFieldSubmitted: iNextFocusNode != null
          ? (term) {
              _fieldFocusChange(context, iFocusNode, iNextFocusNode);
            }
          : (term) {
              iFocusNode.unfocus();
            },
      style: TextStyle(
          fontWeight: FontWeight.bold,
          fontFamily: 'Ubuntu-Regular',
          letterSpacing: 1.5),
      attribute: iAttribute,
      decoration: InputDecoration(
        helperText: iNextFocusNode == null
            ? '1 uppercase, compine chars and numbers'
            : null,
        errorStyle: TextStyle(
          color: Colors.red.shade300,
          fontWeight: FontWeight.bold,
        ),
        suffixIcon: iNextFocusNode == null
            ? Icon(
                Icons.lock_outline,
              )
            : null,
        enabledBorder: OutlineInputBorder(
            gapPadding: 4.0,
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide(color: Colors.grey, width: 2.0)),
        focusedBorder: OutlineInputBorder(
            gapPadding: 4.0,
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide(color: Colors.lightBlue, width: 2.0)),
        errorBorder: OutlineInputBorder(
            gapPadding: 4.0,
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide(color: Colors.red.shade200, width: 1.5)),
        focusedErrorBorder: OutlineInputBorder(
            gapPadding: 4.0,
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide(color: Colors.red, width: 2.0)),
        labelStyle: TextStyle(
            fontSize: 20.0, color: Colors.black54, fontWeight: FontWeight.bold),
        labelText: iLabelText,
        hintText: iHintText,
      ),
      validators: iValidators,
    );
  }
}
