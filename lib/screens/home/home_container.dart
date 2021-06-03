part of 'home.dart';

class HomeContainer extends StatelessWidget {
  const HomeContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final photoListBloc = BlocProvider.of<PhotoListBloc>(context);
    final todayPhotoBloc = BlocProvider.of<TodayPhotoBloc>(context);

    return Scaffold(
      body: BlocBuilder<PhotoListBloc, PhotoListState>(
        builder: (context, state) {
          List<UnsplashPhotoModel>? photoList;
          if (state is PhotoListLoaded) {
            photoList = state.photoList;
          }

          return SafeArea(
            top: false,
            child: SmartRefresher(
              controller: photoListBloc.refreshController,
              header: const MaterialClassicHeader(),
              onRefresh: () {
                photoListBloc.add(RefreshPhotoListEvent());
                todayPhotoBloc.add(FetchNewPhotoEvent());
              },
              child: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    pinned: true,
                    expandedHeight: 128,
                    backgroundColor: Theme.of(context)
                        .appBarTheme
                        .backgroundColor
                        ?.withAlpha(220),
                    flexibleSpace: AppSpaceBar(
                      title: S.current.discoverTitle,
                    ),
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 24.0,
                    ),
                    sliver: SliverToBoxAdapter(
                      child: Text(
                        S.current.whatsNewTodayTitle.toUpperCase(),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SliverToBoxAdapter(
                    child: TodayPhotoContainer(),
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 24.0,
                    ),
                    sliver: SliverToBoxAdapter(
                      child: Text(
                        S.current.browseAllTitle.toUpperCase(),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  if (state is PhotoListError)
                    SliverFillRemaining(
                      child: Center(
                        child: ErrorContainer(
                          message: state.message,
                        ),
                      ),
                    )
                  else if (photoList?.isNotEmpty == true)
                    SliverPadding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      sliver: SliverStaggeredGrid.countBuilder(
                        itemCount: photoList!.length,
                        crossAxisCount: 10,
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 8,
                        staggeredTileBuilder: (index) {
                          return StaggeredTile.count(
                            5,
                            index.isEven ? 10 : 5,
                          );
                        },
                        itemBuilder: (context, i) {
                          final photo = photoList![i];
                          return AppNetworkImage(
                            imageUrl: photo.urls!.regular!,
                            blurHash: photo.blurHash!,
                            fit: BoxFit.cover,
                          );
                        },
                      ),
                    )
                  else
                    SliverFillRemaining(
                      child: Center(
                        child: photoList == null
                            ? const SizedBox(
                                height: 16,
                                width: 16,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2.0,
                                ),
                              )
                            : const EmptyContainer(),
                      ),
                    ),
                  if (state is PhotoListLoaded)
                    const SliverPadding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 32.0,
                      ),
                      sliver: SliverToBoxAdapter(
                        child: _SeeMoreButton(),
                      ),
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _SeeMoreButton extends StatefulWidget {
  const _SeeMoreButton({Key? key}) : super(key: key);

  @override
  _SeeMoreButtonState createState() => _SeeMoreButtonState();
}

class _SeeMoreButtonState extends State<_SeeMoreButton> {
  bool _isLoading = false;
  void _onLoadMore() {
    setState(() {
      _isLoading = true;
    });
    BlocProvider.of<PhotoListBloc>(context).add(FetchPhotoListEvent(onDone: () {
      setState(() {
        _isLoading = false;
      });
    }));
  }

  @override
  Widget build(BuildContext context) {
    return OutlinedAppButton(
      onPressed: _isLoading ? null : _onLoadMore,
      child: _isLoading
          ? const MiniCircularProgressIndicator()
          : Text(S.current.seeMoreText.toUpperCase()),
    );
  }
}
