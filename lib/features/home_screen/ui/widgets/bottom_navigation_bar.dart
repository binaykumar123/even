import 'package:even/constants/images_path.dart';
import 'package:even/features/home_screen/bottom_navigation_store.dart';
import 'package:even/features/home_screen/ui/widgets/bottom_navigation_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class HomeBottomNavigationBar extends StatefulWidget {
  const HomeBottomNavigationBar({
    Key key,
    @required this.changeTabToIndex,
  }) : super(key: key);
  final Function(int) changeTabToIndex;

  @override
  State<HomeBottomNavigationBar> createState() => _BottomNavigationBarState();
}

class _BottomNavigationBarState extends State<HomeBottomNavigationBar> {
  Function(int) get _changeTabToIndex => widget.changeTabToIndex;
  BottomNavigationStore _bottomNavigationStore;

  @override
  void initState() {
    _bottomNavigationStore ??= BottomNavigationStore();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        final _currentIndex =  _bottomNavigationStore?.currentTabIndex;
        return BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            _bottomNavigationStore?.changeTabIndex(index);
            _changeTabToIndex(index);
          },
          items: [
            BottomNavigationBarItem(
              icon: BottomNavigationIcon(
                iconPath: ImagesPath.HOME_ICON,
                isActive: _currentIndex == 0,
              ),
              label: 'HOME',
            ),
            BottomNavigationBarItem(
              icon: BottomNavigationIcon(
                iconPath: ImagesPath.HISTORY_ICON,
                isActive: _currentIndex == 1,
              ),
              label: 'HISTORY',
            ),
            BottomNavigationBarItem(
              icon: BottomNavigationIcon(
                iconPath: ImagesPath.EVEN_ICON,
                isActive: _currentIndex == 2,
              ),
              label: 'EVEN',
            ),
            BottomNavigationBarItem(
              icon: BottomNavigationIcon(
                iconPath: ImagesPath.PROFILE_ICON,
                isActive: _currentIndex == 3,
              ),
              label: 'PROFILE',
            ),
          ],
        );
      },
    );
  }
}
