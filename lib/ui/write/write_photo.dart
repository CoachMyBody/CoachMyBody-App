import 'dart:io';
import 'dart:typed_data';

import 'package:coach_my_body/constants/assets.dart';
import 'package:coach_my_body/constants/colors.dart';
import 'package:coach_my_body/constants/translations_key.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:provider/provider.dart';

class PhotoProvider extends ChangeNotifier {
  File _selectedPhoto;
  List<AssetEntity> assets = [];

  File get selectedPhoto => _selectedPhoto;

  set selectedPhoto(File image) {
    _selectedPhoto = image;
    notifyListeners();
  }
}

class WritePhotoScreen extends StatefulWidget {
  @override
  _WritePhotoScreenState createState() => _WritePhotoScreenState();
}

class _WritePhotoScreenState extends State<WritePhotoScreen> {
  // This will hold all the assets we fetched
  List<AssetEntity> assets = [];

  @override
  void initState() {
    _fetchAssets();
    super.initState();
  }

  _fetchAssets() async {
    // Set onlyAll to true, to fetch only the 'Recent' album
    // which contains all the photos/videos in the storage
    final albums = await PhotoManager.getAssetPathList(hasAll: true, onlyAll: true);
    print(albums);
    final recentAlbum = albums.first;

    // Now that we got the album, fetch all the assets it contains
    final recentAssets = await recentAlbum.getAssetListRange(
      start: 0, // start at index 0
      end: 1000000, // end at a very big index (to get all the assets)
    );

    // Update the state and notify UI
    setState(() => assets = recentAssets);
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => PhotoProvider()),
      ],
      child: Scaffold(
        appBar: _buildAppBar(),
        body: _buildBody(),
      ),
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      toolbarHeight: 42.0,
      leadingWidth: 80.0,
      leading: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: Padding(
          padding:
          const EdgeInsets.symmetric(vertical: 11.0, horizontal: 16.0),
          child: Text(COMMON_CANCEL_TXT).tr(),
        ),
      ),
      actions: <Widget>[
        InkWell(
          onTap: () {
            // TODO: Sync selected photo
            Navigator.pop(context);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(
                vertical: 11.0, horizontal: 16.0),
            child: Text(
              COMMON_OK_TXT,
              style: TextStyle(color: AppColors.cmb_blue),
            ).tr(),
          ),
        )
      ],
    );
  }

  Widget _buildBody() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width * 0.777,
          child: assets.isEmpty
              ? Image.asset(Assets.appLogoBright)
              : FutureBuilder<File>(
            future: assets[0].file,
            builder: (_, snapshot) {
              final file = snapshot.data;
              if (file == null) return Image.asset(Assets.appLogoBright);
              return Image.file(file, fit: BoxFit.cover);
            },
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 40,
          color: AppColors.cmb_grey[0],
        ),
        Expanded(
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              // A grid view with 3 items per row
              crossAxisCount: 3,
            ),
            itemCount: assets.length,
            itemBuilder: (_, index) {
              return AssetThumbnail(asset: assets[index]);
            },
          ),
        )
      ],
    );
  }
}

class AssetThumbnail extends StatelessWidget {
  const AssetThumbnail({
    Key key,
    @required this.asset,
  }) : super(key: key);

  final AssetEntity asset;

  @override
  Widget build(BuildContext context) {
    // We're using a FutureBuilder since thumbData is a future
    return FutureBuilder<Uint8List>(
      future: asset.thumbData,
      builder: (_, snapshot) {
        final bytes = snapshot.data;
        // If we have no data, display a spinner
        if (bytes == null) return CircularProgressIndicator();
        // If there's data, display it as an image
        return InkWell(
          onTap: () {
          },
          child: Stack(
            children: [
              // Wrap the image in a Positioned.fill to fill the space
              Positioned.fill(
                child: Image.memory(bytes, fit: BoxFit.cover),
              ),
              // Display a Play icon if the asset is a video
              if (asset.type == AssetType.video)
                Center(
                  child: Container(
                    color: AppColors.cmb_grey[0].withOpacity(0.5),
                    child: Icon(
                      Icons.play_arrow,
                      color: Colors.white,
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
