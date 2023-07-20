import 'dart:async';

import 'package:flutter/material.dart';

abstract class BaseViewModel extends ChangeNotifier {
  bool isLoading = false;

  var isOverlayLoadingStreamController = StreamController<bool>.broadcast();
  Stream<bool> get isOverlayLoadingStream => isOverlayLoadingStreamController.stream;

  @override
  void dispose() {
    isOverlayLoadingStreamController.close();
    super.dispose();
  }

  // ileride notifyListener'a farklı bir business logic eklenebilir.
  void refreshView() {
    notifyListeners();
  }
}
