import 'package:flutter/cupertino.dart';
import 'package:moim_app/core/router/router_page_configuration.dart';
import 'package:moim_app/core/router/router_page_state.dart';

class PageAction {
  PageState state;
  PageConfiguration? page;
  List<PageConfiguration>? pages;
  Widget? widget;

  PageAction({this.state = PageState.NONE, this.page = null, this.pages = null, this.widget = null});
}
