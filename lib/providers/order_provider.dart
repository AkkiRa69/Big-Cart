import 'package:flutter/material.dart';
import 'package:grocery_store/model/order_model.dart';

class OrderProvider extends ChangeNotifier {
  int _orderNo = 9084;

  List<OrderModel> _orderList = [];

  List<OrderModel> get orderList => _orderList;

  int get orderNo => _orderNo;

  void setOrderNo() {
    _orderNo++;
    notifyListeners();
  }

  bool isEmpty() {
    return _orderList.isEmpty;
  }

  void addOrderToList(OrderModel item) {
    _orderList.add(item);
    notifyListeners();
  }
}
