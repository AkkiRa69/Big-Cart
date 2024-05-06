// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:grocery_store/components/my_list_tile.dart';
import 'package:grocery_store/pages/about_me_page.dart';
import 'package:page_transition/page_transition.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final List listTile = [
    ["About me", "assets/icons/aboutme.png"],
    ["My Orders", "assets/icons/myorder.png"],
    ["My Favorites", "assets/icons/myfav.png"],
    ["My Address", "assets/icons/myaddress.png"],
    ["Credit Cards", "assets/icons/creditcards.png"],
    ["Transactions", "assets/icons/transaction.png"],
    ["Notifications", "assets/icons/notifications.png"],
    ["Sign out", "assets/icons/signout.png"],
  ];

  final List<Function> funcList = [
    aboutMe,
    myOrder,
    myFav,
    myAddress,
    creditCard,
    transaction,
    notification,
    signOut,
  ];
  static void aboutMe(BuildContext context) {
    Navigator.push(
        context,
        PageTransition(
            child: AboutMePage(), type: PageTransitionType.rightToLeft));
  }

  static void myOrder(BuildContext context) {
    Navigator.push(
        context,
        PageTransition(
            child: AboutMePage(), type: PageTransitionType.rightToLeft));
  }

  static void myFav(BuildContext context) {
    Navigator.push(
        context,
        PageTransition(
            child: AboutMePage(), type: PageTransitionType.rightToLeft));
  }

  static void myAddress(BuildContext context) {
    Navigator.push(
        context,
        PageTransition(
            child: AboutMePage(), type: PageTransitionType.rightToLeft));
  }

  static void creditCard(BuildContext context) {
    Navigator.push(
        context,
        PageTransition(
            child: AboutMePage(), type: PageTransitionType.rightToLeft));
  }

  static void transaction(BuildContext context) {
    Navigator.push(
        context,
        PageTransition(
            child: AboutMePage(), type: PageTransitionType.rightToLeft));
  }

  static void notification(BuildContext context) {
    Navigator.push(
        context,
        PageTransition(
            child: AboutMePage(), type: PageTransitionType.rightToLeft));
  }

  static void signOut(BuildContext context) {
    Navigator.push(
        context,
        PageTransition(
            child: AboutMePage(), type: PageTransitionType.rightToLeft));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Color(0xFFFFFFFF),
      extendBodyBehindAppBar: true,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                alignment: Alignment.bottomCenter,
                height: MediaQuery.of(context).size.height,
                color: Color(0xFFFFFFFF),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.85,
                color: Color(0xFFF4F5F9),
                // color: Colors.amber,
                padding: EdgeInsets.symmetric(vertical: 80),
                child: ListView.builder(
                  itemCount: listTile.length,
                  itemBuilder: (context, index) {
                    if (index == 4) {
                      return MyListTile(
                        click: () => funcList[index](context),
                        icon: listTile[index][1],
                        text: listTile[index][0],
                        size: 18,
                      );
                    }
                    if (index == 7) {
                      return MyListTile(
                        click: () => funcList[index](context),
                        icon: listTile[index][1],
                        text: listTile[index][0],
                        isSign: true,
                      );
                    } else {
                      return MyListTile(
                          click: () => funcList[index](context),
                          icon: listTile[index][1],
                          text: listTile[index][0]);
                    }
                  },
                ),
              ),
              Positioned(
                top: 60,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: 114,
                          width: 114,
                        ),
                        Image.asset(
                          "assets/images/profile.png",
                          height: 114,
                          fit: BoxFit.contain,
                        ),
                        Positioned(
                          bottom: 0,
                          right: 10,
                          child: Image.asset(
                            "assets/icons/camera.png",
                            height: 24,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "San Monyakkhara",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "sanmonyakkhara99@gmail.com",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
