part of 'home.dart';

class HomeContainer extends StatelessWidget {
  const HomeContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final photoListBloc = BlocProvider.of<PhotoListBloc>(context);
    final todayPhotoBloc = BlocProvider.of<TodayPhotoBloc>(context);
    final layout = context.layout;
    final fluidGutter =
        layout.fluidMargin > layout.gutter ? layout.fluidMargin : layout.gutter;

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
                    padding: EdgeInsets.symmetric(
                      horizontal: fluidGutter,
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
                    padding: EdgeInsets.symmetric(
                      horizontal: fluidGutter,
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
                      padding: EdgeInsets.symmetric(horizontal: fluidGutter),
                      sliver: SliverStaggeredGrid.countBuilder(
                        itemCount: photoList!.length,
                        crossAxisCount: layout.columns == 8 ? 6 : 4,
                        mainAxisSpacing: layout.gutter / 2,
                        crossAxisSpacing: layout.gutter / 2,
                        staggeredTileBuilder: (index) {
                          return StaggeredTile.fit(
                            layout.columns > 8 ? 1 : 2,
                          );
                        },
                        itemBuilder: (context, i) {
                          final photo = photoList![i];
                          final totalCols = layout.columns == 8
                              ? 3
                              : layout.columns > 8
                                  ? 4
                                  : 2;
                          final totalGutterWidth =
                              (totalCols + 2) * layout.gutter / 2;
                          final containerHeight =
                              (layout.width / totalCols - totalGutterWidth) *
                                  photo.height! /
                                  photo.width!;
                          return InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                Routes.photoDetail,
                                arguments: photo,
                              );
                            },
                            child: Container(
                              color: photo.color,
                              height: containerHeight,
                              child: Hero(
                                tag: photo.id!,
                                child: AppNetworkImage(
                                  imageUrl: photo.urls!.regular!,
                                  blurHash: photo.blurHash!,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
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
                    SliverPadding(
                      padding: EdgeInsets.symmetric(
                        horizontal: fluidGutter,
                        vertical: 32.0,
                      ),
                      sliver: const SliverToBoxAdapter(
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
