import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void snackBar(BuildContext context) {
  final materialBanner = MaterialBanner(
    /// need to set following properties for best effect of awesome_snackbar_content
    elevation: 0,
    backgroundColor: Colors.transparent,
    forceActionsBelow: true,
    content: AwesomeSnackbarContent(
      title: 'Oh Shit!!',
      message: 'Please! Fill all the information.',

      /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
      contentType: ContentType.failure,
      // to configure for material banner
      inMaterialBanner: true,
    ),
    actions: const [SizedBox.shrink()],
  );

  ScaffoldMessenger.of(context)
    ..hideCurrentMaterialBanner()
    ..showMaterialBanner(materialBanner);
}

Widget fackeToggle(String text) {
  return Row(
    children: [
      Icon(
        Icons.toggle_on,
        color: Color(0xff6CC51D),
        size: 40,
      ),
      SizedBox(
        width: 5,
      ),
      Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    ],
  );
}

AppBar myAppBar(void Function()? onPressed,String text){
  return AppBar(
      backgroundColor: Color(0xffffffff),
      centerTitle: true,
      title: Text(text),
      actions: [
        IconButton(
          onPressed: onPressed,
          icon: Icon(CupertinoIcons.add_circled),
          iconSize: 25,
        ),
      ],
    ); 
}