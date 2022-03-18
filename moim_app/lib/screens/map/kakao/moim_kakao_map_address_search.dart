import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AddressSearchPage extends StatefulWidget {
  @override
  _AddressSearchPageState createState() => _AddressSearchPageState();

  const AddressSearchPage({Key? key}) : super(key: key);
}

class _AddressSearchPageState extends State<AddressSearchPage> {
  String _searchText = "";
  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _searchController.addListener(() {
      setState(() {
        _searchText = _searchController.text;
      });
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      textInputAction: TextInputAction.go,
      onSubmitted: (value) async {
        _searchController.text = value;
      },
      controller: _searchController,
      decoration: InputDecoration(
        labelText: "Search",
        hintText: "Search",
        prefixIcon: Icon(Icons.search),
        suffixIcon: _searchController.text.isEmpty
            ? null
            : InkWell(
                onTap: () => _searchController.clear(),
                child: Icon(Icons.clear),
              ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
      ),
    );
  }
}
