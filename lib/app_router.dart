import 'package:flutter/material.dart';
import 'package:food_delievery_app/presentation/screens/cart/cart_page.dart';
import 'package:food_delievery_app/presentation/screens/food/popular_food_details.dart';
import 'package:food_delievery_app/presentation/screens/food/recommended_food_details.dart';
import 'package:food_delievery_app/presentation/screens/home/home_page.dart';
import 'package:food_delievery_app/presentation/screens/home/main_food_page.dart';
import 'package:food_delievery_app/presentation/screens/splash_page.dart';
import 'package:get/get.dart';

import 'constants/strings.dart';

class AppRouter {
  static const String initial = '/';
  static const String popularFoodDetails = '/popular-food-details';
  static const recommendedFoodDetails = '/recommended-food-details';
  static const String cartPage = '/cartPage';
  static const String splashPage= '/splash-page';


  static String getInitial() => '$initial';
  static String getSplashPage() => '$splashPage';
  static String getCartPage() => '$cartPage';

  static String getPopularFoodDetails(int pageId, String page) =>
      '$popularFoodDetails?pageId=$pageId&page=$page';

  static String getRecommendedFoodDetails(int pageId,String page) =>
      '$recommendedFoodDetails?pageId=$pageId&page=$page';

  static List<GetPage> routes = [

    GetPage(name: splashPage, page: () => SplashScreen()),
    GetPage(name: initial, page: () => HomePage()),
    GetPage(
        name: popularFoodDetails,
        page: () {
          var pageId = Get.parameters['pageId'];
          var page = Get.parameters['page'];
          return PopularFoodDetails(
            pageId: int.parse(pageId!),
            page: page!,
          );
        },
        transition: Transition.fadeIn),
    GetPage(
        name: recommendedFoodDetails,
        page: () {
          var pageId = Get.parameters['pageId'];
          var page = Get.parameters['page'];
          return RecommendedFoodDetails(pageId: int.parse(pageId!),page:page!);
        },
        transition: Transition.fadeIn),
    GetPage(
        name: cartPage,
        page: () {
          return CartPage();
        },
        transition: Transition.fadeIn)
  ];
}
