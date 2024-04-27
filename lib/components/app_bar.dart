import 'package:flutter/material.dart';

AppBar myAppBar(void Function()? onPressed){
  return AppBar(
      backgroundColor: Colors.transparent,
      leading: IconButton(
        onPressed: onPressed,
        icon: Icon(
          Icons.arrow_back,
          color: Colors.white,
          size: 24,
        ),
      ),
      title: Text(
        "Welcome",
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
      centerTitle: true,
    );
}