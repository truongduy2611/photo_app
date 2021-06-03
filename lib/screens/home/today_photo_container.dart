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
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
            ),
            child: Column(
              children: [
                AspectRatio(
                  aspectRatio: 1,
                  child: AppNetworkImage(
                    imageUrl: state.photo.urls!.regular!,
                    blurHash: state.photo.blurHash!,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 12.0),
                if (state.photo.user != null)
                  Row(
                    children: [
                      ClipOval(
                        child: state.photo.user?.profileImage != null
                            ? Image.network(
                                state.photo.user!.profileImage!.medium!,
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
                            state.photo.user?.name ?? 'User',
                            style: theme.textTheme.subtitle2?.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            '@${state.photo.user?.username ?? 'username'}',
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
