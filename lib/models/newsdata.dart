import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

class NewsData with ChangeNotifier {
  List<dynamic> _map = [];
  bool _error = false;

  String _errorMsg = "";
  Future<void> get fetchData async {
    final response =
        await get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

    if (response.statusCode == 200) {
      try {
        _map = jsonDecode(response.body);
        _error = false;
      } catch (e) {
        _error = true;
        _errorMsg = e.toString();
        _map = [];
      }
    } else {
      _error = true;
      _errorMsg = 'Connection problem';
      _map = [];
    }
    notifyListeners();
  }

  void initialValues() {
    _map = [];
    _error = false;

    _errorMsg = "";
    notifyListeners();
  }

  List<dynamic> get map => _map;
  bool get error => _error;
  String get errorMsg => _errorMsg;
}
