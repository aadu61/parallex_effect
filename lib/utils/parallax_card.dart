// Automatic FlutterFlow imports
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:async';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:sensors_plus/sensors_plus.dart';

class ParallaxCards extends StatefulWidget {
  const ParallaxCards({
    Key? key,
    this.width,
    this.height,
    this.foregroundImages,
    this.backgroundImages,
    this.texts,
  }) : super(key: key);

  final double? width;
  final double? height;
  final List<String>? foregroundImages;
  final List<String>? backgroundImages;
  final List<String>? texts;

  @override
  _ParallaxCardsState createState() => _ParallaxCardsState();
}

class _ParallaxCardsState extends State<ParallaxCards> {
  double? accelerometerXAxis;
  StreamSubscription<dynamic>? accelerometerListener;
  late final List<String> foregroundImages;
  late final List<String> backgroundImages;
  late final List<String> texts;

  @override
  void initState() {
    super.initState();
    foregroundImages = widget.foregroundImages ??
        [
          'assets/images/rio.png'
        ];
    backgroundImages = widget.backgroundImages ??
        [
          'assets/images/rio-bg.jpg'
        ];
    texts = widget.texts ?? ['Brazil'];
    accelerometerListener = accelerometerEvents.listen(
          (AccelerometerEvent event) {
        setState(() {
          accelerometerXAxis = event.x;
        });
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    accelerometerListener?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: widget.height,
        viewportFraction: 0.80,
        enableInfiniteScroll: false,
      ),
      items: foregroundImages.asMap().entries.map((entry) {
        int index = entry.key;
        String foregroundImage = entry.value;

        return Builder(
          builder: (BuildContext context) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    // Background Image
                    AnimatedPositioned(
                      duration: const Duration(milliseconds: 100),
                      right: accelerometerXAxis != null
                          ? (-350 + accelerometerXAxis! * 30)
                          : -350,
                      child: Image.asset(
                        backgroundImages[index],
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                    // Foreground Image
                    AnimatedPositioned(
                      duration: const Duration(milliseconds: 100),
                      width: 320,
                      height: 700,
                      bottom: -60,
                      right: accelerometerXAxis != null
                          ? (-13 + accelerometerXAxis! * 1.5)
                          : -13,
                      child: Image.asset(
                        foregroundImage,
                        fit: BoxFit.fill,
                      ),
                    ),
                    // Text (Country name)
                    Column(
                      children: [
                        const SizedBox(height: 60),
                        const Text(
                          'FEATURED',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                            letterSpacing: 1,
                          ),
                        ),
                        Text(
                          texts[index],
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 55,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
