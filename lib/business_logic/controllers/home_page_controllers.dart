import 'package:get/get.dart';

class HomePageControllers extends GetxController{


  RxList<String> forGroundImage = RxList([
    "assets/images/rio.png",
    "assets/images/france.png",
    "assets/images/iceland.png",
  ]);

  RxList<String> backgroundImages = RxList([
    "assets/images/rio-bg.jpg",
    "assets/images/france-bg.jpg",
    "assets/images/iceland-bg.jpg",
  ]);
  RxList<String> text = RxList([
    "Brazil",
    "France",
    "Iceland",
  ]);

}