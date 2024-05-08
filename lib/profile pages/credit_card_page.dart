// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grocery_store/components/address_text_field.dart';
import 'package:grocery_store/components/address_tile.dart';
import 'package:grocery_store/components/liner_button.dart';
import 'package:grocery_store/helper/util.dart';
import 'package:grocery_store/model/address_model.dart';
import 'package:grocery_store/profile%20pages/add_card_page.dart';
import 'package:grocery_store/providers/address_provider.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class MyCreditCardPage extends StatelessWidget {
  MyCreditCardPage({super.key});

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
    return myAppBar(() {
      Navigator.push(
          context,
          PageTransition(
              child: AddCardPage(), type: PageTransitionType.rightToLeft));
    }, "My Cards");
  }

  TextEditingController name = TextEditingController();
  TextEditingController cardNum = TextEditingController();
  TextEditingController expires = TextEditingController();
  TextEditingController cvv = TextEditingController();

  Widget _buildBody(BuildContext context) {
    List<AddressModel> add = context.watch<AddressProvider>().addressList;
    return SingleChildScrollView(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 17, vertical: 17),
            decoration: BoxDecoration(
              color: Color(0xffffffff),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //default text
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xffEBFFD7),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                    ),
                  ),
                  padding: EdgeInsets.all(5),
                  child: Text(
                    "DEFAULT",
                    style: TextStyle(
                      color: Color(0xff6CC51D),
                    ),
                  ),
                ),

                //new address
                AddressTile(
                  color: Color(0xffF5F5F5),
                  add: add[add.length - 1],
                  icon: "assets/icons/master.png",
                ),
                //container
                Divider(
                  color: Color(0xffEBEBEB),
                ),
                //text field
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 17),
                  child: Column(
                    children: [
                      AddressTextField(
                        controller: name,
                        hintText: "Name",
                        icon: CupertinoIcons.person_alt_circle,
                      ),
                      AddressTextField(
                        controller: cardNum,
                        hintText: "Card number",
                        icon: CupertinoIcons.creditcard,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: AddressTextField(
                              controller: expires,
                              hintText: "Expires date",
                              icon: CupertinoIcons.calendar,
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Expanded(
                            child: AddressTextField(
                              controller: cvv,
                              hintText: "Cvv",
                              icon: CupertinoIcons.lock,
                            ),
                          ),
                        ],
                      ),
                      fackeToggle("Make default")
                    ],
                  ),
                ),
                //make deault
              ],
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: add.length,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              if (add.isEmpty) {
                return Container();
              }
              if (index % 2 == 0) {
                return Container(
                  decoration: BoxDecoration(
                    color: Color(0xffffffff),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  margin: EdgeInsets.only(left: 17, right: 17, bottom: 10),
                  child: AddressTile(
                    color: Color(0xffF5F5F5),
                    add: add[index],
                    icon: "assets/icons/master.png",
                  ),
                );
              } else {
                return Container(
                  decoration: BoxDecoration(
                    color: Color(0xffffffff),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  margin: EdgeInsets.only(left: 17, right: 17, bottom: 10),
                  child: AddressTile(
                    color: Color(0xffF5F5F5),
                    add: add[index],
                    icon: "assets/icons/visa.png",
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _buildBottomAppBar(BuildContext context) {
    return BottomAppBar(
      elevation: 0,
      color: Colors.transparent,
      child: LinearButton(text: "Save settings", onPressed: () {}),
    );
  }
}
