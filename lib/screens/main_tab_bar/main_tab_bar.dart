import 'package:flutter/material.dart';
import 'package:photo_app/constants/assets.dart';
import 'package:photo_app/constants/icons.dart';
import 'package:photo_app/screens/account/account.dart';
import 'package:photo_app/screens/home/home.dart';

enum MainPageType { home, search, add, chat, account }

extension on MainPageType {
  Widget get icon {
    switch (this) {
      case MainPageType.home:
        return const Icon(AppIcons.home);
      case MainPageType.search:
        return const Icon(AppIcons.search);
      case MainPageType.chat:
        return const Icon(AppIcons.comment);
      case MainPageType.account:
        return const ImageIcon(AssetImage(Assets.person));
      default:
        return const Icon(AppIcons.home);
    }
  }
}

class MainTabBar extends StatefulWidget {
  const MainTabBar({Key? key}) : super(key: key);

  @override
  _MainTabBarState createState() => _MainTabBarState();
}

class _MainTabBarState extends State<MainTabBar>
    with SingleTickerProviderStateMixin {
  MainPageType _currentPage = MainPageType.home;
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(vsync: this, length: 5);
    super.initState();
  }

  void _onChangePageType(MainPageType pageType) {
    setState(() {
      _currentPage = pageType;
      _tabController.animateTo(_currentPage.index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: _tabController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          const HomePage(),
          Container(),
          Container(),
          Container(),
          const AccountPage(),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 8,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            for (int i = 0; i < 5; i++)
              if (i == 2)
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(top: 12.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(32.0),
                      gradient: const LinearGradient(
                        colors: [
                          Color(0xffff4d00),
                          Color(0xffff00d6),
                        ],
                      ),
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: TextButton(
                      onPressed: () {},
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              else
                Expanded(
                  child: _BottomNavigationButton(
                    isSelected: _currentPage.index == i,
                    onTap: () {
                      _onChangePageType(MainPageType.values[i]);
                    },
                    icon: MainPageType.values[i].icon,
                  ),
                ),
          ],
        ),
      ),
    );
  }
}

class _BottomNavigationButton extends StatelessWidget {
  const _BottomNavigationButton({
    Key? key,
    required this.onTap,
    required this.isSelected,
    required this.icon,
  }) : super(key: key);

  final bool isSelected;
  final VoidCallback onTap;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return InkResponse(
      onTap: onTap,
      radius: 8.0 * 6,
      child: SafeArea(
        top: false,
        bottom: true,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: IconTheme(
            data: IconThemeData(
              color: isSelected ? Theme.of(context).accentColor : null,
            ),
            child: icon,
          ),
        ),
      ),
    );
  }
}
