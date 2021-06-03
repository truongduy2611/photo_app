part of 'home.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

/// Persist Home Page
class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    final photoRepository = RepositoryProvider.of<PhotoRepository>(context);
    return BlocProvider(
      create: (context) => PhotoListBloc(
        photoRepository: photoRepository,
        refreshController: RefreshController(),
      )..add(const FetchPhotoListEvent()),
      child: BlocProvider(
        create: (context) => TodayPhotoBloc(
          photoRepository: photoRepository,
        )..add(FetchNewPhotoEvent()),
        child: const HomeContainer(),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
