GoogleMap(
              markers: Set.from(marker),
              mapType: MapType.normal,
              initialCameraPosition: _kGooglePlex,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
              zoomControlsEnabled: false,
              zoomGesturesEnabled: true,
              myLocationEnabled: true,
              onCameraMove: (CameraPosition position) {
                if (marker.length > 0) {
                  Marker mark = marker[0];
                  Marker updatedMarker = mark.copyWith(
                    positionParam: position.target,
                  );

                  setState(() {
                    marker[0] = updatedMarker;
                  });
                }
              },
            ),