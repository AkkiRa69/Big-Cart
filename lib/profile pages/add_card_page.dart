import 'package:flutter/material.dart';
import 'package:grocery_store/components/liner_button.dart';
import 'package:grocery_store/helper/util.dart';

class AddCardPage extends StatelessWidget {
  const AddCardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF4F5F9),
      appBar: _buildAppBar(context),
      body: _buildBody(context),
      bottomNavigationBar: _buildBottomAppBar(context),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return myAppBar(() {}, "My Cards");
  }

  Widget _buildBody(BuildContext context) {
    return Column(
      children: [
        //card
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [
                Color(0xff6CC51D),
                Color(0xff6CC51D),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBottomAppBar(BuildContext context) {
    return BottomAppBar(
      color: Colors.transparent,
      elevation: 0,
      child: LinearButton(
        onPressed: () {},
        text: "Add credit card",
      ),
    );
  }
}
