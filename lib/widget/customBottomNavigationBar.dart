import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jpmcompanion/classModel.dart';
import 'package:jpmcompanion/const.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final Function(int) onTap;

  const CustomBottomNavigationBar({Key key, this.onTap}) : super(key: key);
  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar>
    with TickerProviderStateMixin {
  List<BottomBarModel> _data = [
    BottomBarModel(
      icon: 'assets/Asset 50300 1.png',
      title: 'Home',
      route: '/home',
      color: '#FED9E0',
    ),
    BottomBarModel(
      icon: 'assets/Asset 67300 1.png',
      title: 'Map ',
      route: '/map',
      color: '#F57466',
    ),
    BottomBarModel(
      icon: 'assets/Asset 68300 1.png',
      title: 'Timeline',
      route: '/real-time-map',
      color: '#BFA5F8',
    ),
    BottomBarModel(
      icon: 'assets/Asset 51300 1.png',
      title: 'profile',
      route: '/profile',
      color: '#6AD0B8',
    ),
  ];
  List<double> _width = [0.15.wp, 0, 0, 0];
  double _mark = 0.2.wp;
  double _left = 0.11.wp;
  int _position = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  changePosition(index) async {
    setState(() {
      _width[index] = 0.18.wp;
      if (_position > index) {
        _mark = 0.2.wp;
      } else {
        _mark = (0.2 * (index + 1 - _position)).wp;
      }
      for (var i = 0; i < _width.length; i++) {
        if (i != index) {
          _width[i] = 0;
        }
      }
    });
    await Future.delayed(Duration(milliseconds: 200)).then(
      (value) {
        setState(() {
          if (index > 1) {
            _left = (0.1 + index / 5.8).wp;
            _mark = 0.23.wp;
          } else {
            _left = (0.1 + index / 6).wp;
            _mark = 0.18.wp;
          }
          _position = index;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Container(
      width: double.infinity,
      height: 0.08.hp,
      child: Stack(
        alignment: Alignment.center,
        children: [
          AnimatedPositioned(
            left: _left,
            duration: Duration(milliseconds: 200),
            child: AnimatedContainer(
              decoration: BoxDecoration(
                color: Color(hexStringToHexInt(_data[_position].color)),
                borderRadius: BorderRadius.circular(20),
              ),
              duration: Duration(milliseconds: 200),
              width: _mark,
              height: 0.04.hp,
            ),
          ),
          Container(
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: _data.asMap().entries.map<Widget>((e) {
                return GestureDetector(
                  onTap: () {
                    widget.onTap(e.key);
                    changePosition(e.key);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 0.02.wp),
                          child: Image(
                            width: 0.05.wp,
                            height: 0.05.wp,
                            image: AssetImage(e.value.icon),
                          ),
                        ),
                        AnimatedSize(
                          curve: Curves.easeInOut,
                          vsync: this,
                          duration: Duration(milliseconds: 200),
                          child: Container(
                            width: _width[e.key],
                            child: Text(
                              e.value.title,
                              style: TextStyle(
                                color: Color(
                                  hexStringToHexInt('#736B6D'),
                                ),
                                fontWeight: FontWeight.bold,
                                fontFamily: "PlexSans",
                                fontSize: 35.ssp,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          )
        ],
      ),
    );
  }
}
