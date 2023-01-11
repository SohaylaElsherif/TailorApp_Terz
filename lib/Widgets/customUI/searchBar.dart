import 'package:flutter/material.dart';
import 'package:graduation_project/UI/Products/productsProvider.dart';
import 'package:graduation_project/UI/TailorsList/tailorsListProvider.dart';
import 'package:provider/provider.dart';

import 'colors.dart';

class SearchBar extends StatefulWidget {
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  TextEditingController _controller = TextEditingController();
  String _searchText;

  void initState() {
    _controller.addListener(
      () {
        setState(() {
          _searchText = _controller.text;
        });
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ProductsProvider provider =
        Provider.of<ProductsProvider>(context, listen: false);
    return TextField(
      controller: _controller,
      onChanged: (value) {
                provider.changeSearchString(value);
              },
      style: TextStyle(
        fontSize: 12.0,
        color: SecondryColorLight,
      ),
      decoration: InputDecoration(
        fillColor: Colors.white,
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        prefixIcon: Icon(
          Icons.search,
          color: PrimaryColor,
        ),
        hintText: "Search",
        border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 20.0),
            borderRadius: BorderRadius.circular(20.0)),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 32.0),
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
    );
  }
}
