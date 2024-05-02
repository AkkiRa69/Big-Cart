// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import, avoid_unnecessary_containers

import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grocery_store/components/liner_button.dart';
import 'package:grocery_store/pages/order_success.dart';
import 'package:grocery_store/pages/shopping_cart_page.dart';
import 'package:page_transition/page_transition.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:timeline_tile/timeline_tile.dart';

class ShoppingMethodPage extends StatefulWidget {
  const ShoppingMethodPage({super.key});

  @override
  State<ShoppingMethodPage> createState() => _ShoppingMethodPageState();
}

class _ShoppingMethodPageState extends State<ShoppingMethodPage> {
  var currentStep = 0;

  continueStep() {
    if (currentStep < 2) {
      setState(() {
        currentStep++;
      });
    } else {
      Navigator.push(
          context,
          PageTransition(
              child: OrderSuccessPage(), type: PageTransitionType.rightToLeft));
    }
  }

  cacelStep() {
    if (currentStep > 0) {
      setState(() {
        currentStep--;
      });
    }
  }

  onStepTapped(int value) {
    setState(() {
      currentStep = value;
    });
  }

  Widget controlBuilder(context, details) {
    return Row(
      children: [
        Expanded(
          child: LinearButton(
            text: currentStep >= 2 ? "Make a payment" : "Next",
            onPressed: details.onStepContinue,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF4F5F9),
      appBar: _buildAppBar,
      body: _buildBody,
    );
  }

  AppBar get _buildAppBar {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          if (currentStep > 0) {
            setState(() {
              currentStep--;
            });
          } else {
            Navigator.push(
                context,
                PageTransition(
                    child: ShoppingCartPage(),
                    type: PageTransitionType.leftToRight));
          }
        },
        icon: Icon(Icons.arrow_back),
      ),
      centerTitle: true,
      backgroundColor: Color(0xFFFFFFFF),
      title: Text("Shipping Method"),
    );
  }

  Widget get _buildBody {
    return Stepper(
      physics: NeverScrollableScrollPhysics(),
      type: StepperType.horizontal,
      elevation: 0,
      currentStep: currentStep,
      onStepContinue: continueStep,
      onStepCancel: cacelStep,
      onStepTapped: onStepTapped,
      controlsBuilder: controlBuilder,
      steps: [
        Step(
          label: Text(
            "DELIVERY",
            style: TextStyle(fontSize: 14),
          ),
          title: Divider(),
          content: Container(
            height: 550,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _buildShippingMethod(
                      "Standard Delivery",
                      "Order will be delivered between 3 - 4 business days straights to your doorstep.",
                      3.00),
                  _buildShippingMethod(
                      "Next Day Delivery",
                      "Order will be delivered between 3 - 4 business days straights to your doorstep.",
                      5.00),
                  _buildShippingMethod(
                      "Nominated Delivery",
                      "Order will be delivered between 3 - 4 business days straights to your doorstep.",
                      3.00),
                ],
              ),
            ),
          ),
          isActive: currentStep >= 0,
          state: currentStep > 0 ? StepState.complete : StepState.indexed,
        ),
        Step(
          label: Text("ADDRESS"),
          title: Divider(),
          content: Container(
            height: 550,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _buildTextField(CupertinoIcons.person, "Name"),
                  _buildTextField(CupertinoIcons.mail, "Email address"),
                  _buildTextField(CupertinoIcons.phone, "Phone number"),
                  _buildTextField(CupertinoIcons.map_pin_ellipse, "Address"),
                  _buildTextField(CupertinoIcons.keyboard, "Zip code"),
                  _buildTextField(CupertinoIcons.map, "City"),
                  _buildTextField(CupertinoIcons.location_solid, "Country"),
                  Row(
                    children: [
                      Icon(
                        Icons.toggle_on_rounded,
                        color: Color(0xFF6CC51D),
                        size: 38,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Save this address",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          isActive: currentStep >= 1,
          state: currentStep > 1 ? StepState.complete : StepState.indexed,
        ),
        Step(
          label: Text(
            "PAYMENT",
          ),
          title: Divider(),
          content: Container(
            height: 550,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  //card
                  Row(
                    children: [
                      _buildCard("assets/icons/pay.png", "Paypal"),
                      SizedBox(
                        width: 10,
                      ),
                      _buildCard("assets/icons/card.png", "Credit card"),
                      SizedBox(
                        width: 10,
                      ),
                      _buildCard("assets/icons/apple.png", "Apple pay"),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  //credit card
                  Image.asset("assets/icons/credit_card.png"),
                  SizedBox(
                    height: 15,
                  ),
                  //textField
                  _buildTextField(CupertinoIcons.person, "Name on the card"),
                  _buildTextField(CupertinoIcons.creditcard, "Card number"),
                  Row(
                    children: [
                      Expanded(
                          child: _buildTextField(
                              CupertinoIcons.calendar, "Month/Year")),
                      SizedBox(
                        width: 8,
                      ),
                      Expanded(
                          child: _buildTextField(CupertinoIcons.lock, "CVV")),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.toggle_on_rounded,
                        color: Color(0xFF6CC51D),
                        size: 38,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Save this address",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          isActive: currentStep >= 2,
          state: currentStep > 2 ? StepState.complete : StepState.indexed,
        ),
      ],
    );
  }

  Widget _buildShippingMethod(String title, String subTitle, double price) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 18),
      margin: EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 4,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    subTitle,
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  "\$" + price.toStringAsFixed(0),
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    color: Color(0xFF6CC51D),
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(IconData icon, String text) {
    return Container(
      decoration: BoxDecoration(
          color: Color(0xFFFFFFFF), borderRadius: BorderRadius.circular(8)),
      padding: EdgeInsets.all(7),
      margin: EdgeInsets.only(bottom: 8),
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color: Color(0xFF969696),
          ),
          hintText: text,
          hintStyle: TextStyle(color: Color(0xFF969696)),
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget _buildCard(String image, String text) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFFFFFFFF),
          borderRadius: BorderRadius.circular(8),
        ),
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            Image.asset(
              image,
              height: 30,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              text,
              style: TextStyle(
                color: Color(0xFF868889),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
