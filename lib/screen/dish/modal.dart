
import 'package:flutter/cupertino.dart';

class ImageDetail{
  late bool isLoaded = false;
  late int cumulativeBytesLoaded = 0;
  late int expectedTotalBytes = 1;
}

class ImageValuesNotifier extends ValueNotifier<ImageDetail> {
  late ImageDetail _imageDetail;

  ImageValuesNotifier(imageDetail) : super(imageDetail) {
    _imageDetail = imageDetail;
  }

  void changeLoadingState(bool isLoaded) {
    _imageDetail.isLoaded = isLoaded;
    notifyListeners();
  }

  void changeCumulativeBytesLoaded(int cumulativeBytesLoaded) {
    _imageDetail.cumulativeBytesLoaded = cumulativeBytesLoaded;
    notifyListeners();
  }

}