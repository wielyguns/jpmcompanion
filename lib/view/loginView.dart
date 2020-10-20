import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jpmcompanion/const.dart';
import 'package:jpmcompanion/provider/loginViewModel.dart';
import 'package:jpmcompanion/widget/loadingScreen.dart';
import 'package:stacked/stacked.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return ViewModelBuilder.reactive(
      onModelReady: (model) => model.init(),
      viewModelBuilder: () => LoginViewModel(),
      builder: (context, model, child) => LoadingScreen(
        showLoadingApi: model.isLoadingApi,
        showLoadingScreen: false,
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Scaffold(
            body: Container(
              width: double.infinity,
              height: 1.hp,
              child: SingleChildScrollView(
                child: Form(
                  key: model.formKey,
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 60),
                        child: Image(
                          width: 217,
                          image: AssetImage('assets/imageTop.png'),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 0.02.hp),
                        child: Text(
                          'Welcome back!',
                          style: TextStyle(
                            fontSize: 60.ssp,
                            fontWeight: FontWeight.bold,
                            color: titleColor,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 0.01.hp),
                        child: Text(
                          'Log in to your existant account of JPM',
                          style: TextStyle(
                            fontSize: 40.ssp,
                            color: titleColor,
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(1, 4),
                              color: borderBox,
                            )
                          ],
                        ),
                        margin: EdgeInsets.only(
                          top: 0.04.hp,
                          right: 0.08.wp,
                          left: 0.08.wp,
                        ),
                        child: Stack(
                          alignment: Alignment.centerLeft,
                          children: [
                            TextFormField(
                              validator: (value) {
                                if (value.isEmpty) {
                                  return model.isError('username');
                                }
                                return null;
                              },
                              controller: model.username,
                              decoration: InputDecoration(
                                hintText: 'Username',
                                contentPadding: EdgeInsets.only(
                                  left: 0.12.wp,
                                  right: 0.12.wp,
                                ),
                                enabledBorder: InputBorder.none,
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(
                                    const Radius.circular(50.0),
                                  ),
                                  borderSide: BorderSide(
                                    color: purpleTheme,
                                    width: 2.0,
                                  ),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(
                                    const Radius.circular(50.0),
                                  ),
                                  borderSide: BorderSide(
                                    color: Colors.red,
                                    width: 2.0,
                                  ),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(
                                    const Radius.circular(50.0),
                                  ),
                                  borderSide: BorderSide(
                                    color: Colors.red,
                                    width: 2.0,
                                  ),
                                ),
                                errorStyle: TextStyle(
                                  height: 0,
                                  color: Colors.transparent,
                                ),
                              ),
                            ),
                            Positioned(
                              left: 0.04.wp,
                              child: Icon(
                                FontAwesomeIcons.user,
                                size: 50.ssp,
                              ),
                            ),
                            (model.usernameError != null)
                                ? Positioned(
                                    right: 0.04.wp,
                                    child: Tooltip(
                                      message: model.usernameError,
                                      child: Icon(
                                        FontAwesomeIcons.exclamationCircle,
                                        size: 50.ssp,
                                        color: Colors.red,
                                      ),
                                    ),
                                  )
                                : Container(),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(1, 4),
                              color: borderBox,
                            )
                          ],
                        ),
                        margin: EdgeInsets.only(
                          top: 0.04.hp,
                          right: 0.08.wp,
                          left: 0.08.wp,
                        ),
                        child: Stack(
                          alignment: Alignment.centerLeft,
                          children: [
                            TextFormField(
                              validator: (value) {
                                if (value.isEmpty) {
                                  return model.isError('password');
                                }
                                return null;
                              },
                              controller: model.password,
                              decoration: InputDecoration(
                                hintText: 'Password',
                                contentPadding: EdgeInsets.only(
                                  left: 0.12.wp,
                                  right: 0.12.wp,
                                ),
                                enabledBorder: InputBorder.none,
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(
                                    const Radius.circular(50.0),
                                  ),
                                  borderSide: BorderSide(
                                    color: Color(hexStringToHexInt('#5A4CF4')),
                                    width: 2.0,
                                  ),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(
                                    const Radius.circular(50.0),
                                  ),
                                  borderSide: BorderSide(
                                    color: Colors.red,
                                    width: 2.0,
                                  ),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(
                                    const Radius.circular(50.0),
                                  ),
                                  borderSide: BorderSide(
                                    color: Colors.red,
                                    width: 2.0,
                                  ),
                                ),
                                errorStyle: TextStyle(
                                  height: 0,
                                  color: Colors.transparent,
                                ),
                              ),
                            ),
                            Positioned(
                              left: 0.04.wp,
                              child: Icon(
                                FontAwesomeIcons.lock,
                                size: 50.ssp,
                              ),
                            ),
                            (model.passwordError != null)
                                ? Positioned(
                                    right: 0.04.wp,
                                    child: Tooltip(
                                      message: model.passwordError,
                                      child: Icon(
                                        FontAwesomeIcons.exclamationCircle,
                                        size: 50.ssp,
                                        color: Colors.red,
                                      ),
                                    ),
                                  )
                                : Container(),
                          ],
                        ),
                      ),
                      Container(
                        alignment: Alignment.topRight,
                        margin: EdgeInsets.only(
                          top: 0.01.hp,
                          right: 0.08.wp,
                          left: 0.08.wp,
                        ),
                        child: Text('Lupa Password ?'),
                      ),
                      Container(
                        width: 0.45.wp,
                        margin: EdgeInsets.only(
                          top: 0.08.hp,
                          right: 0.08.wp,
                          left: 0.08.wp,
                          bottom: 0.08.wp,
                        ),
                        decoration: BoxDecoration(
                          color: Color(hexStringToHexInt('#5A4CF4')),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: FlatButton(
                          onPressed: () async {
                            model.login(context);
                          },
                          child: Text(
                            'LOGIN',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 45.ssp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
