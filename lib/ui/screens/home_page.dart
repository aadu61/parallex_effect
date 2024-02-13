import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prallax_effect/business_logic/controllers/home_page_controllers.dart';
import 'package:prallax_effect/utils/parallax_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var statusBarHeight = MediaQuery.of(context).padding.top;
    return GetBuilder<HomePageControllers>(
        init: HomePageControllers(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: Colors.black,
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: statusBarHeight + 20,
                ),
                const Text(
                  "Exclusive trips just for you",
                  style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 30,
                ),
                // Container(
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(30)
                //   ),
                //   height: 700,
                //   width: 300,
                //   child: Stack(
                //     children: [
                //       ClipRRect(
                //        borderRadius: BorderRadius.circular(30),
                //         child: Image.asset("assets/images/rio-bg.jpg",fit: BoxFit.cover,
                //         height: double.infinity,
                //         ),
                //       ),
                //       ClipRRect(
                //         borderRadius: BorderRadius.circular(30),
                //         child: Image.asset("assets/images/rio.png",fit: BoxFit.cover,
                //         width: Get.width,
                //           height: double.infinity,
                //         ),
                //       )
                //     ],
                //   ),
                // )
                ParallaxCards(
                  width: 350,
                  height: 600,
                  foregroundImages: controller.forGroundImage,
                  backgroundImages: controller.backgroundImages,
                  texts: controller.text,
                )
              ],
            ),
          );
        });
  }
}
