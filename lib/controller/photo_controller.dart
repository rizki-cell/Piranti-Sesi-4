import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/photo.dart';
import 'package:flutter_application_1/model/repository/photo_repository.dart';

class PhotoController extends ChangeNotifier {
  final List<Photos> _photos = [];
  final List<Photos> _bookmarkPhotos = [];
  bool _isLoading = false;

  List<Photos> get photos => _photos;
  List<Photos> get bookmarkPhotos => _bookmarkPhotos;
  bool get isLoading => _isLoading;

  fetch() async {
    setLoading(true);
    photos.clear();
    photos.addAll(await PhotoRepository().photos());
    setLoading(false);
  }

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
}
