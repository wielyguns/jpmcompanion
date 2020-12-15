import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jpmcompanion/const.dart';
import 'package:jpmcompanion/model/shippingOrderModel.dart';
import 'package:jpmcompanion/provider/shortcutMenuViewModel.dart';
import 'package:stacked/stacked.dart';

class ShortcutMenuView extends StatefulWidget {
  final urutan;

  const ShortcutMenuView({Key key, this.urutan}) : super(key: key);
  @override
  _ShortcutMenuViewState createState() => _ShortcutMenuViewState();
}

class _ShortcutMenuViewState extends State<ShortcutMenuView> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => ShortcutMenuViewModel(),
      onModelReady: (model) => model.init(context, widget.urutan),
      builder: (context, model, child) => GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          key: model.scaffoldKey,
          backgroundColor: Colors.white,
          body: Stack(
            children: [
              Container(
                child: NotificationListener<OverscrollIndicatorNotification>(
                  onNotification: (notification) {
                    notification.disallowGlow();
                    return;
                  },
                  child: NestedScrollView(
                    physics: AlwaysScrollableScrollPhysics(),
                    headerSliverBuilder: (context, box) {
                      return [
                        SliverAppBar(
                          elevation: 0,
                          leading: IconButton(
                            icon: Icon(
                              FontAwesomeIcons.arrowAltCircleLeft,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          title: Text(
                            'Shortcut Menu',
                            style: TextStyle(
                              fontFamily: "PlexSans",
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          backgroundColor: Colors.amber,
                          bottom: PreferredSize(
                            preferredSize: Size.fromHeight(kToolbarHeight),
                            child: Container(
                              width: 1.wp,
                              alignment: Alignment.bottomCenter,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                  colors: [Colors.amber, Colors.amber],
                                ),
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(0),
                                  bottomRight: Radius.circular(0),
                                ),
                              ),
                              child: Stack(
                                children: [
                                  Container(
                                    height: 0.07.hp,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        begin: Alignment.bottomCenter,
                                        end: Alignment.topCenter,
                                        colors: [Colors.amber, Colors.amber],
                                      ),
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(0),
                                        bottomRight: Radius.circular(0),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.bottomRight,
                                    width: double.infinity,
                                    height: 0.07.hp,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        begin: Alignment.bottomCenter,
                                        end: Alignment.topCenter,
                                        colors: [Colors.white, Colors.white],
                                      ),
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(50),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          pinned: true,
                          flexibleSpace: Container(
                            alignment: Alignment.topRight,
                            width: 1.wp,
                            child: Image(
                              width: 0.5.wp,
                              image: AssetImage('assets/Asset 55300 1.png'),
                            ),
                          ),
                          expandedHeight: kToolbarHeight + 0.1.hp,
                        ),
                      ];
                    },
                    body: Wrap(
                      children: model.menu.map<Widget>(
                        (e) {
                          return Container(
                            padding: EdgeInsets.all(0.01.wp),
                            width: 0.33.wp,
                            height: 0.33.wp,
                            child: RaisedButton(
                              color: Colors.white,
                              onPressed: () {
                                if (e['delete'] != null) {
                                  model.delete(context, e);
                                } else {
                                  model.setShortcut(context, e);
                                }
                              },
                              child: Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Image(
                                      width: 0.15.wp,
                                      image: AssetImage(
                                        e['icon'],
                                      ),
                                    ),
                                    SizedBox(height: 0.02.hp),
                                    Text('${e['title']}'),
                                    SizedBox(height: 0.01.hp),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ).toList(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
