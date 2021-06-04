import 'dart:io';

import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';

class PhotoAssetModel extends ChangeNotifier {
  PhotoAssetModel() {
    _fetchAssets();
  }

  Future<File> _selectedImage;
  List<AssetEntity> _assets = [];

  Future<File> get selectedImage => _selectedImage;

  set selectedImage(Future<File> image) {
    _selectedImage = image;
    notifyListeners();
  }

  List<AssetEntity> get assets => _assets;

  set assets(List<AssetEntity> inAssets) {
    _assets = inAssets;
    notifyListeners();
  }

  void _fetchAssets() async {
    // Set onlyAll to true, to fetch only the 'Recent' album
    // which contains all the photos/videos in the storage
    final albums = await PhotoManager.getAssetPathList(
        hasAll: true, onlyAll: true, type: RequestType.image);
    final recentAlbum = albums.first;

    // Now that we got the album, fetch all the assets it contains
    final recentAssets = await recentAlbum.getAssetListRange(
      start: 0, // start at index 0
      end: 1000000, // end at a very big index (to get all the assets)
    );

    _assets = recentAssets;
    _selectedImage = _assets[0].file;

    notifyListeners();
  }
}