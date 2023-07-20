import 'dart:async';

import 'package:flutter/material.dart';

abstract class BaseViewModel extends ChangeNotifier {
  // ileride notifyListener'a farklı bir business logic eklenebilir.
  void refreshView() {
    notifyListeners();
  }
}
