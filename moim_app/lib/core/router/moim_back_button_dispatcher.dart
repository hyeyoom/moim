import 'package:flutter/cupertino.dart';

import 'moim_router_delegate.dart';

class MoimBackButtonDispatcher extends RootBackButtonDispatcher {

  final MoimRouterDelegate _routerDelegate;

  MoimBackButtonDispatcher(this._routerDelegate) : super();

  @override
  Future<bool> didPopRoute() {
    return _routerDelegate.popRoute();
  }
}