import 'package:flutter/material.dart';
import 'package:moim_app/core/router/router_page_action.dart';
import 'package:moim_app/core/router/router_page_state.dart';
import 'package:provider/provider.dart';

import '../../core/router/app_state.dart';
import '../../core/router/router_consts.dart';

class MainScreen extends StatelessWidget {

  static const String route = '/';

  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hello'),
        actions: [
          IconButton(
            onPressed: () {
              appState.currentAction = PageAction(state: PageState.ADD_PAGE, page: myPageConfig);
            },
            icon: const Icon(Icons.account_box_rounded)
          )
        ],
      ),
      body: Container(
        color: Colors.blue,
      ),
      bottomNavigationBar: BottomAppBar(
        child: SizedBox(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const <Widget>[
              Icon(Icons.phone),
              Icon(Icons.message),
              Icon(Icons.contact_page),
            ],
          ),
        ),
      ),
    );
  }
}
