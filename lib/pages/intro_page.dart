// ignore_for_file: prefer_const_constructors, must_be_immutable, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:grocery_store/pages/home_page.dart';
import 'package:page_transition/page_transition.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroPage extends StatefulWidget {
  IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  final List<String> images = [
    "Online_Groceries_cuate.png",
    "Delivery_cuate.png",
    "Passionate_cuate.png"
  ];

  List title = [
    [
      "Buy Grocery",
      "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy"
    ],
    [
      "Fast Delivery",
      "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy"
    ],
    [
      "Enjoy Quality Food",
      "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy"
    ],
  ];

  PageController _controller = PageController();

  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        currentPage = _controller.page?.round() ?? 0;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _controller,
                itemCount: images.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 30),
                          child: Image.asset(
                            "assets/images/${images[index]}",
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            title[index][0],
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 24),
                          ),
                        ),
                        Text(
                          title[index][1],
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              child: HomePage(),
                              type: PageTransitionType.bottomToTop));
                    },
                    child: Text(
                      "Skip",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  SmoothPageIndicator(
                    controller: _controller,
                    count: images.length,
                    effect: WormEffect(
                      dotHeight: 7,
                      dotWidth: 7,
                      activeDotColor: Color(0xFF6CC51D),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      if (currentPage < images.length - 1) {
                        _controller.nextPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.ease,
                        );
                      } else {
                        // Navigate to homepage when last page is reached
                        Navigator.push(
                            context,
                            PageTransition(
                                child: HomePage(),
                                type: PageTransitionType.rightToLeft));
                      }
                    },
                    child: Text(
                      "Next",
                      style: TextStyle(
                        color: Color(0xFF6CC51D),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
