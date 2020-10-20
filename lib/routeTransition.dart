import 'package:flutter/material.dart';

class RouteAnimation extends MaterialPageRoute {
  RouteAnimation(
      {WidgetBuilder builder,
      RouteSettings settings,
      Animation<Offset> position,
      Widget child})
      : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    Animation<Offset> custom =
        Tween<Offset>(begin: Offset(1.0, -1.0), end: Offset(0, 0))
            .animate(animation);
    return SlideTransition(
      position: custom,
      child: child,
    );
  }
}

class RouteAnimationDurationTween extends PageRouteBuilder {
  Widget widget;
  RouteAnimationDurationTween({this.widget})
      : super(
          pageBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation) {
            return widget;
          },
          transitionsBuilder: (BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child) {
            Animation<Offset> custom =
                Tween<Offset>(begin: Offset(1.0, 0), end: Offset(0, 0))
                    .animate(animation);
            return SlideTransition(
              position: custom,
              child: child,
            );
          },
        );
}

class RouteAnimationDurationTweenReverse extends PageRouteBuilder {
  Widget widget;
  RouteAnimationDurationTweenReverse({this.widget})
      : super(
          pageBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation) {
            return widget;
          },
          transitionsBuilder: (BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child) {
            Animation<Offset> custom =
                Tween<Offset>(begin: Offset(-1, 0), end: Offset(0, 0))
                    .animate(animation);
            return SlideTransition(
              position: custom,
              child: child,
            );
          },
        );
}

class RouteAnimationDurationUp extends PageRouteBuilder {
  Widget widget;
  RouteAnimationDurationUp({this.widget})
      : super(
          pageBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation) {
            return widget;
          },
          transitionsBuilder: (BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child) {
            Animation<Offset> custom =
                Tween<Offset>(begin: Offset(0, 1), end: Offset(0, 0))
                    .animate(animation);
            return SlideTransition(
              position: custom,
              child: child,
            );
          },
        );
}

class RouteAnimationDurationFade extends PageRouteBuilder {
  Widget widget;
  RouteAnimationDurationFade({this.widget})
      : super(
          pageBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation) {
            return widget;
          },
          transitionsBuilder: (BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );
}
