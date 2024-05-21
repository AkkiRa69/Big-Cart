import 'package:flutter/foundation.dart';
import 'package:grocery_store/model/randomuser_mdel.dart';
import 'package:http/http.dart' as http;

class RandomuserProvider extends ChangeNotifier {
  RandomUserModel _randomUserModel = RandomUserModel(info: Info(), results: []);
  RandomUserModel get randomUserModel => _randomUserModel;

  Future<void> read() async {
    final response =
        await http.get(Uri.parse('https://randomuser.me/api/?results=20'));

    if (response.statusCode == 200) {
      _randomUserModel = await compute(randomUserModelFromMap, response.body);
      notifyListeners();
    } else {
      throw Exception('Failed to load users');
    }
  }
}
