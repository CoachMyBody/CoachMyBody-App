import 'dart:io';
import 'dart:typed_data';

import 'package:coach_my_body/constants/assets.dart';
import 'package:coach_my_body/constants/colors.dart';
import 'package:coach_my_body/constants/translations_key.dart';
import 'package:coach_my_body/providers/write/photo_assets_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:provider/provider.dart';

class WritePhotoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => PhotoAssetModel()),
      ],
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: Builder(builder: (BuildContext ctx) => _buildBody(ctx)),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return AppBar(
      toolbarHeight: 42.0,
      leadingWidth: 80.0,
      leading: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 11.0, horizontal: 16.0),
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
            padding:
                const EdgeInsets.symmetric(vertical: 11.0, horizontal: 16.0),
            child: Text(
              COMMON_OK_TXT,
              style: TextStyle(color: AppColors.cmb_blue),
            ).tr(),
          ),
        )
      ],
    );
  }

  Widget _buildBody(BuildContext context) {
    var photoAssetModel = Provider.of<PhotoAssetModel>(context, listen: true);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        SelectedPhotoView(),
        Container( // TODO: Select Album
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width * 0.1111,
          color: AppColors.cmb_grey[0],
        ),
        Expanded(
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
            ),
            itemCount: photoAssetModel.assets.length,
            itemBuilder: (_, index) {
              return AssetThumbnail(asset: photoAssetModel.assets[index]);
            },
          ),
        )
      ],
    );
  }
}

class SelectedPhotoView extends StatelessWidget {
  const SelectedPhotoView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width * 0.777,
      child: Consumer<PhotoAssetModel>(
        builder: (context, photoAssetConsumer, child) {
          return photoAssetConsumer.assets.isEmpty
              ? Image.asset(Assets.appLogoBright)
              : FutureBuilder<File>(
                  future: photoAssetConsumer.selectedImage,
                  builder: (_, snapshot) {
                    final file = snapshot.data;
                    if (null == file) return Image.asset(Assets.appLogoBright);
                    return Image.file(file, fit: BoxFit.cover);
                  },
                );
        },
      ),
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
    var photoAssetModel = Provider.of<PhotoAssetModel>(context);

    return FutureBuilder<Uint8List>(
      future: asset.thumbData,
      builder: (_, snapshot) {
        final bytes = snapshot.data;
        if (bytes == null) return CircularProgressIndicator();
        return InkWell(
          onTap: () {
            photoAssetModel.selectedImage = asset.file;
          },
          child: Stack(
            children: [
              // Wrap the image in a Positioned.fill to fill the space
              Positioned.fill(
                child: Image.memory(bytes, fit: BoxFit.cover),
              ),
              // Video image doesn't support yet.
              // if (asset.type == AssetType.video)
              //   Center(
              //     child: Container(
              //       color: AppColors.cmb_grey[0].withOpacity(0.5),
              //       child: Icon(
              //         Icons.play_arrow,
              //         color: Colors.white,
              //       ),
              //     ),
              //   ),
            ],
          ),
        );
      },
    );
  }
}
