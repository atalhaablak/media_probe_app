import 'dart:async';

import 'package:flutter/material.dart';

class BaseViewModel extends ChangeNotifier {
  BaseViewModel() {
    init();
  }
  //constructor override edilemediğinden init function yazıldı
  void init() {}
  bool isLoading = false;

  var isOverlayLoadingStreamController = StreamController<bool>.broadcast();
  Stream<bool> get isOverlayLoadingStream => isOverlayLoadingStreamController.stream;

  @override
  void dispose() {
    isOverlayLoadingStreamController.close();
    super.dispose();
  }

  void refreshView() {
    notifyListeners();
  }
}
