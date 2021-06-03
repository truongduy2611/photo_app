import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_app/constants/assets.dart';
import 'package:photo_app/generated/l10n.dart';
import 'package:photo_app/global_blocs/today_photo/today_photo_bloc.dart';
import 'package:photo_app/models/unsplash_user.dart';
import 'package:photo_app/routes/routes.dart';
import 'package:photo_app/widgets/button.dart';
import 'package:photo_app/widgets/mini_circular_progress_indicator.dart';
import 'package:photo_app/widgets/network_image.dart';
import 'package:photo_app/widgets/user_list_tile.dart';

class LogoutPage extends StatelessWidget {
  const LogoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaSize = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    return Material(
      child: Column(
        children: [
          Expanded(
            child: BlocBuilder<TodayPhotoBloc, TodayPhotoState>(
              builder: (context, state) {
                late Widget image;
                UnsplashUserModel? user;
                var brightness = Brightness.light;

                if (state is TodayPhotoError) {
                  /// fallback to default image
                  image = Image.asset(Assets.background1);
                } else if (state is TodayPhotoLoaded) {
                  image = AppNetworkImage(
                    imageUrl: state.photo.urls!.regular!,
                    blurHash: state.photo.blurHash!,
                    fit: BoxFit.cover,
                  );

                  user = state.photo.user;

                  brightness = state.photo.color != null
                      ? ThemeData.estimateBrightnessForColor(state.photo.color!)
                      : brightness;
                } else {
                  image = const MiniCircularProgressIndicator();
                }

                final isDark = brightness == Brightness.dark;
                return AnnotatedRegion<SystemUiOverlayStyle>(
                  value: isDark
                      ? SystemUiOverlayStyle.light
                      : SystemUiOverlayStyle.dark,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        width: mediaSize.width,
                        height: mediaSize.height,
                        child: image,
                      ),
                      Center(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              Assets.logoTransparent,
                              height: 96,
                              width: 96,
                            ),
                            Text(
                              'photo',
                              style: theme.textTheme.headline4!.copyWith(
                                fontSize: 64,
                                color: isDark ? Colors.white : Colors.black,
                              ),
                            )
                          ],
                        ),
                      ),
                      Positioned(
                        bottom: 16.0,
                        right: 16.0,
                        left: 16.0,
                        child: UserListTile(
                          user: user,
                          textColor: isDark ? Colors.white : Colors.black,
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
          SafeArea(
            top: false,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0)
                  .copyWith(top: 20.0),
              child: Row(
                children: [
                  Expanded(
                    child: OutlinedAppButton(
                      onPressed: () {
                        Navigator.pushNamed(context, Routes.login);
                      },
                      child: Text(S.current.loginButtonText),
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  Expanded(
                    child: FilledAppButton(
                      onPressed: () {
                        Navigator.pushNamed(context, Routes.register);
                      },
                      child: Text(S.current.registerButtonText),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
