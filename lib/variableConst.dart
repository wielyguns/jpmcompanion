import 'package:jpmcompanion/const.dart';

List<Map> menuShortcut = [
  {
    "route": "/create-do-route",
    "icon": "assets/Asset 47300 2.png",
    "title": "Input DO",
    "param": null,
  },
  {
    "route": "/purchase-order-route",
    "icon": "assets/Asset 48300 1.png",
    "title": "Input SO",
    "param": null,
  },
  {
    "route": "/list-do-route",
    "icon": "assets/Asset 50 1.png",
    "title": "Tracking DO",
    "param": {
      "route": trackingDoRoute,
    },
  },
  {
    "route": "/update-do-route",
    "icon": "assets/Asset 87300.png",
    "title": "Update DO",
    "param": null,
  },
  {
    "route": "/list-do-route",
    "icon": "assets/Asset 57300 1.png",
    "title": "List DO",
    "param": {
      "route": doDetailRoute,
    },
  },
  {
    "route": "/pick-up-courier-route",
    "icon": "assets/Asset 55300 1.png",
    "title": "Pick Up",
    "param": {
      "route": pickupCourierRoute,
    },
  },
];

Map deleteMenu = {
  "delete": true,
  "route": "/delete",
  "icon": "assets/times.png",
  "title": "Delete",
};
