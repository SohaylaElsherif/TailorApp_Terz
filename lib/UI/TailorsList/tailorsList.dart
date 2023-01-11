import 'package:flutter/material.dart';
import 'package:graduation_project/Services/auth.dart';
import 'package:graduation_project/UI/TailorsList/tailorsListProvider.dart';
import 'package:graduation_project/Widgets/customUI/colors.dart';
import 'package:graduation_project/Widgets/customUI/icons.dart';
import 'package:graduation_project/Widgets/customUI/searchBar.dart';
import 'package:graduation_project/Widgets/header.dart';
import 'package:graduation_project/Widgets/sideMenu.dart';
import 'package:graduation_project/Widgets/tailor_card.dart';
import 'package:provider/provider.dart';
import 'package:graduation_project/Widgets/AppDrawer.dart';

class TailorsList extends StatefulWidget {
  final String title;

  const TailorsList({Key key, this.title}) : super(key: key);
  @override
  _TailorsListState createState() => _TailorsListState();
}

class _TailorsListState extends State<TailorsList> {
  // @override
  // void initState() {
  //   super.initState();
  // futureMovies = fetchMovies();
  // controller = new ScrollController()..addListener(_scrollListener);
  // }
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
    TailorsProvider provider =
        Provider.of<TailorsProvider>(context, listen: false);
    return Scaffold(

        // appBar: AppBar(
        //   backgroundColor: Color.fromRGBO(62, 71, 84, 1),
        //   elevation: 0,
        //   // Here we take the value from the MyHomePage object that was created by
        //   // the App.build method, and use it to set our appbar title.
        //   title: Column(
        //     children: [CustomLayOut(),
        //       Center(child: Padding(
        //         padding: const EdgeInsets.only(top: 8.0),
        //         child: Text(widget.title,
        //         style: TextStyle(color: Color.fromRGBO(244, 181, 86, 1), fontSize: 35, fontWeight: FontWeight.bold),),
        //       )),
        //     ],

        //   ),
        // ),
        body: AppDrawer(
      auth: Auth(),
      child: Container(
        color: Color.fromRGBO(62, 71, 84, 1),
        child: Column(
          children: [
            ScreenHeader(
              title: widget.title,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 140,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Colors.white,
                    ),
                    child: TextField(
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
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        prefixIcon: Icon(
                          Icons.search,
                          color: PrimaryColor,
                        ),
                        hintText: "Search",
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 20.0),
                            borderRadius: BorderRadius.circular(20.0)),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.white, width: 32.0),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 90,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Colors.white,
                    ),
                    child: TextButton(
                      onPressed: () => {},
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Row(
                          children: [
                            Icon(
                              MyFlutterApp.filter,
                              color: PrimaryColor,
                            ),
                            Text(
                              " Filter",
                              style: TextStyle(
                                fontSize: 12,
                                color: PrimaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 110,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Colors.white,
                    ),
                    child: TextButton(
                      onPressed: () => {},
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Row(
                          children: [
                            Icon(
                              MyFlutterApp.sewing_machine,
                              color: PrimaryColor,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 4.0),
                              child: Text(
                                "Services",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: PrimaryColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Consumer<TailorsProvider>(
                  builder: (buildContext, tailorProvider, _) {
                return (tailorProvider.data != null)
                    ? ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        //  physics: NeverScrollableScrollPhysics(),
                        itemCount: (tailorProvider.list.isNotEmpty) ? tailorProvider.list.length : tailorProvider.data.length,
                        itemBuilder: (ctx, index) {
                          var tailors;
                          if (tailorProvider.list.isNotEmpty) {
                            tailors = tailorProvider.list[index];
                          } else {
                            tailors = tailorProvider.data[index];
                          }
                          return Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: TailorCard(
                                tailor: tailors,
                              ));
                        })
                    : Align(
                        alignment: Alignment.center,
                        child: Center(
                            child: CircularProgressIndicator(
                          valueColor:
                              new AlwaysStoppedAnimation<Color>(Colors.white),
                        )));
              }),
            ),
          ],
        ),
      ),
    ));
  }
}
