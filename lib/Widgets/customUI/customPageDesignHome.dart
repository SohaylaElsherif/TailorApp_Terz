import 'package:flutter/material.dart';
import 'package:graduation_project/UI/Products/products.dart';
import 'package:graduation_project/UI/TailorsList/tailorsList.dart';

import '../homeCard.dart';
import 'customPageDesign.dart';

class CustomPageDesignHome extends CustomPageDesign{
  CustomPageDesignHome ({
    Widget child,
    double bannerSize,
  }) : super(
    bannerSize: 250,
  child:Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [
  HomeCard(title: "Tailors", path: TailorsList(title: "Tailors",), image: "scizzors",),
  HomeCard(title: "Products", path: ProductsList(title: "Products",), image: "mannequin",)
  ],
      ),);
}