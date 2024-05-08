import 'package:flutter/material.dart';

class MyTransactionPage extends StatelessWidget {
  const MyTransactionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text("My Transactions"),
    );
  }
}
