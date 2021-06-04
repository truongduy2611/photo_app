import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:photo_app/models/unsplash_photo.dart';
import 'package:photo_app/widgets/back_button.dart';
import 'package:photo_app/widgets/user_list_tile.dart';
import 'package:photo_view/photo_view.dart';

class PhotoDetailPage extends StatelessWidget {
  const PhotoDetailPage({Key? key, required this.photo}) : super(key: key);

  final UnsplashPhotoModel photo;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            if (photo.urls!.regular != null)
              PhotoView(
                imageProvider: CachedNetworkImageProvider(photo.urls!.regular!),
                heroAttributes: PhotoViewHeroAttributes(tag: photo.id!),
                errorBuilder: (_, __, ___) => Icon(
                  Icons.error,
                  color: Theme.of(context).errorColor,
                ),
              ),
            const Positioned(
              left: 16.0,
              top: 16.0,
              child: SafeArea(
                child: Material(
                  color: Colors.white54,
                  borderRadius: BorderRadius.all(Radius.circular(32)),
                  clipBehavior: Clip.antiAlias,
                  child: AppBackButton(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 16.0,
              right: 16.0,
              bottom: 16.0,
              child: SafeArea(
                child: UserListTile(
                  user: photo.user,
                  textColor: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
