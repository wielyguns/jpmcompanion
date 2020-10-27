import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jpmcompanion/const.dart';
import 'package:jpmcompanion/provider/mapTabViewModel.dart';
import 'package:stacked/stacked.dart';

class MapTabView extends StatefulWidget {
  @override
  _MapTabViewState createState() => _MapTabViewState();
}

class _MapTabViewState extends State<MapTabView> {
  initState() {
    if (!mounted) {
      return;
    }

    setState(() {});
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => MapTabViewModel(),
      builder: (context, model, child) => GestureDetector(
        child: Scaffold(
          key: model.locationMapKey,
          body: Stack(
            children: [
              Container(
                child: GoogleMap(
                  markers: Set.from(model.marker),
                  mapType: MapType.normal,
                  initialCameraPosition: model.kGooglePlex,
                  onMapCreated: (GoogleMapController controller) {
                    model.controller.complete(controller);
                  },
                  zoomControlsEnabled: false,
                  zoomGesturesEnabled: true,
                  myLocationEnabled: true,
                  onCameraMove: (CameraPosition position) {
                    // if (marker.length > 0) {
                    //   Marker mark = marker[0];
                    //   Marker updatedMarker = mark.copyWith(
                    //     positionParam: position.target,
                    //   );

                    //   setState(() {
                    //     marker[0] = updatedMarker;
                    //   });
                    // }
                  },
                ),
              ),
              Positioned(
                bottom: 10,
                left: 0,
                child: Container(
                  width: 1.wp,
                  child: FlatButton(
                    color: purpleLightTheme,
                    onPressed: () {
                      model.addMarker();
                    },
                    child: Text('add marker'),
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
