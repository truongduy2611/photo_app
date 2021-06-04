part of 'home.dart';

class TodayPhotoContainer extends StatelessWidget {
  const TodayPhotoContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final media = MediaQuery.of(context);
    return BlocBuilder<TodayPhotoBloc, TodayPhotoState>(
      builder: (context, state) {
        if (state is TodayPhotoLoaded) {
          final photo = state.photo;
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
            ),
            child: Column(
              children: [
                AspectRatio(
                  aspectRatio: 1,
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        Routes.photoDetail,
                        arguments: photo,
                      );
                    },
                    child: Hero(
                      tag: photo.id!,
                      child: AppNetworkImage(
                        imageUrl: photo.urls!.regular!,
                        blurHash: photo.blurHash!,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 12.0),
                if (photo.user != null)
                  Row(
                    children: [
                      ClipOval(
                        child: photo.user?.profileImage != null
                            ? Image.network(
                                photo.user!.profileImage!.medium!,
                                height: 32,
                                width: 32,
                              )
                            : const Icon(
                                Icons.account_circle_rounded,
                              ),
                      ),
                      const SizedBox(width: 12.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            photo.user?.name ?? 'User',
                            style: theme.textTheme.subtitle2?.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            '@${photo.user?.username ?? 'username'}',
                          )
                        ],
                      ),
                    ],
                  ),
              ],
            ),
          );
        }

        if (state is TodayPhotoError) {
          return Center(
            child: ErrorContainer(
              message: state.message,
            ),
          );
        }

        return SizedBox(height: media.size.width);
      },
    );
  }
}
