import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

typedef void VrviewCreatedCallback(VrController controller);

class Vrview extends StatefulWidget {
  final VrviewCreatedCallback onVrCreated;

  Vrview({
    Key key,
    @required this.onVrCreated,
  });

  @override
  _VrviewState createState() => _VrviewState();
}

class _VrviewState extends State<Vrview> {
  @override
  Widget build(BuildContext context) {
    if (defaultTargetPlatform == TargetPlatform.android) {
      return AndroidView(
        viewType: 'vrview',
        onPlatformViewCreated: onPlatformViewCreated,
        creationParamsCodec: const StandardMessageCodec(),
      );
    } else if (defaultTargetPlatform == TargetPlatform.iOS) {
      return UiKitView(
        viewType: 'vrview',
        onPlatformViewCreated: onPlatformViewCreated,
        creationParamsCodec: const StandardMessageCodec(),
      );
    }

    return new Text(
        '$defaultTargetPlatform is not yet supported by this plugin');
  }

  Future<void> onPlatformViewCreated(id) async {
    if (widget.onVrCreated == null) {
      return;
    }
    widget.onVrCreated(new VrController.init(id));
  }
}

class VrController {
  MethodChannel _channel;

  VrController.init(int id) {
    _channel = new MethodChannel('vrview_$id');
  }

  Future<void> loadUrl(String url) async {
    assert(url != null);
    return _channel.invokeMethod('loadUrl', url);
  }
}
