import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:ui' as ui;

import 'package:moim_app/components/maps/google/marker/painter/reverse_water_drops.dart';

class GoogleMapComponent extends StatefulWidget {

  final CameraPosition initialCameraPosition;

  GoogleMapComponent({
    Key? key,
    this.initialCameraPosition = const CameraPosition(
      target: LatLng(37.4998, 127.0351),
      zoom: 14)
  }) : super(key: key);

  @override
  _GoogleMapComponentState createState() => _GoogleMapComponentState(this.initialCameraPosition);
}

class _GoogleMapComponentState extends State<GoogleMapComponent> {

  final CameraPosition cameraPosition;

  Map<MarkerId, Marker> _markers = Map();

  _GoogleMapComponentState(this.cameraPosition);

  _onTap(LatLng position) async {
    final markerId = MarkerId(_markers.length.toString());

    final bytes = await _myPainterToBitmap(position.toString());

    final marker = Marker(
        markerId: markerId,
        position: position,
        anchor: Offset(0.5, 0.5),
        icon: BitmapDescriptor.fromBytes(bytes));

    setState(() {
      _markers[markerId] = marker;
    });
  }

  Future<Uint8List> _myPainterToBitmap(String label) async {
    ui.PictureRecorder recorder = ui.PictureRecorder();
    final Canvas canvas = Canvas(recorder);
    ui.Image networkImage = await getImage('https://picsum.photos/200');
    ReverseWaterDrops myPainter = ReverseWaterDrops(label, networkImage);
    myPainter.paint(canvas, Size(100, 230));

    final ui.Image image = await recorder.endRecording().toImage(100, 230);
    final ByteData? byteData =
    await image.toByteData(format: ui.ImageByteFormat.png);
    return byteData!.buffer.asUint8List();
  }

  Future<ui.Image> getImage(String path) async {
    var completer = Completer<ImageInfo>();
    var img = new NetworkImage(path);
    img.resolve(const ImageConfiguration()).addListener(ImageStreamListener((info, _) {
      completer.complete(info);
    }));
    ImageInfo imageInfo = await completer.future;
    return imageInfo.image;
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: cameraPosition,
      markers: Set.of(_markers.values),
      onTap: _onTap,
    );
  }
}
