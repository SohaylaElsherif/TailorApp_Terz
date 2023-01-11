import 'package:flutter/material.dart';
import 'package:graduation_project/Services/auth.dart';
import 'package:graduation_project/UI/Products/productsProvider.dart';
import 'package:graduation_project/Widgets/AppDrawer.dart';
import 'package:graduation_project/Widgets/customUI/colors.dart';
import 'package:graduation_project/Widgets/customUI/searchBar.dart';
import 'package:graduation_project/Widgets/header.dart';
import 'package:graduation_project/Widgets/product_card.dart';
import 'package:provider/provider.dart';

class ProductsList extends StatefulWidget {
  final String title;

  const ProductsList({Key key, this.title}) : super(key: key);
  @override
  _TailorsListState createState() => _TailorsListState();
}

class _TailorsListState extends State<ProductsList> {
  TextEditingController _controller = TextEditingController();
  String _searchText;

  @override
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
    return Scaffold(
      // backgroundColor: Color.fromRGBO(62, 71, 84, 1),
      body: AppDrawer(
        auth: Auth(),
        child: Container(
          color: Color.fromRGBO(62, 71, 84, 1),
          child: Column(
            children: [
              ScreenHeader(
                title: widget.title,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: Container(
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
                ),
              ),
              Expanded(
                child: Consumer<ProductsProvider>(
                    builder: (buildContext, productProvider, _) {
                  return (productProvider.products != null)
                      ? GridView.builder(
                          shrinkWrap: true,
                          gridDelegate:
                              new SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.65,
                          ),
                          itemCount: (productProvider.filteredList.isNotEmpty) ? productProvider.filteredList.length : productProvider.products.length,
                          itemBuilder: (ctx, index) {
                            var products;
                            if (productProvider.filteredList.isNotEmpty) {
                              products = productProvider.filteredList[index];
                            } else {
                              products = productProvider.products[index];
                            }
                            final tailors = productProvider.tailors;
                            return Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: ProductCard(
                                  tailor: tailors,
                                  product: products,
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
      ),
    );
  }
}
