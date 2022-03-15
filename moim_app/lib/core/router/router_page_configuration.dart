import 'package:moim_app/core/router/router_page_action.dart';
import 'package:moim_app/core/router/router_pages.dart';

class PageConfiguration {
  final String key;
  final String path;
  final Pages uiPage;
  PageAction? currentPageAction;

  PageConfiguration ({
    required this.key, required this.path, required this.uiPage,
    this.currentPageAction
  });
}
