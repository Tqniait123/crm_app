import 'package:crm_app/core/static/app_styles.dart';
import 'package:crm_app/core/static/constants.dart';
import 'package:crm_app/core/static/icons.dart';
import 'package:crm_app/core/translations/locale_keys.g.dart';
import 'package:crm_app/core/utils/widgets/bottom_nav_item/custom_bottom_nav_bar_item.dart';
import 'package:crm_app/core/widgets/custom_scaffold.dart';
import 'package:crm_app/features/home/presentation/views/home_screen.dart';
import 'package:crm_app/features/leads/presentation/pages/leads_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({super.key});

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  int _currentIndex = 0;
  final PageController _pageController = PageController(); // Add this line

  final List<Widget> _pages = [const HomeScreen(), LeadsScreen(), Container(), Container()];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      key: Constants.drawerKey,
      backgroundColor: Colors.white,
      // floatingActionButton: FloatingActionButton(
      // elevation: 0.0,
      //   onPressed: () {
      //     // context.push(Routes.addRequest);
      //     context.push(Routes.selectPackageType);
      //   },
      //   child: AppIcons.circlePlusIc.icon(),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // drawer: const CustomAppDrawer(),
      body: PageView(
        controller: _pageController,
        children: _pages,
        onPageChanged: (index) {
          // if (index == 2) {
          //   // Constants.drawerKey.currentState!.openDrawer();
          // } else {
          setState(() {
            _currentIndex = index;
          });
          // }
        },
      ),
      bottomNavigationBar: SizedBox(
        // height: 90,
        child: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          unselectedIconTheme: const IconThemeData(size: 50),
          selectedIconTheme: const IconThemeData(size: 50),
          elevation: 0,
          currentIndex: _currentIndex,
          onTap: (index) {
            // if (index == 2) {
            //   // Constants.drawerKey.currentState!.openDrawer();
            // } else {
            _pageController.animateToPage(index, duration: const Duration(milliseconds: 300), curve: Curves.ease);
            // }
          },
          items: [
            BottomNavigationBarItem(
              tooltip: LocaleKeys.home.tr(),
              icon: CustomBottomNavigationBarItem(
                title: LocaleKeys.home.tr(),
                iconPath: AppIcons.home,
                iconFilledPath: AppIcons.homeFilled,
                isSelected: _currentIndex == 0,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              tooltip: LocaleKeys.leads.tr(),
              icon: CustomBottomNavigationBarItem(
                title: LocaleKeys.leads.tr(), // Translate 'Requests'
                iconPath: AppIcons.leads,
                iconFilledPath: AppIcons.leadsFilled,
                isSelected: _currentIndex == 1,
              ),
              label: '',
            ),
            // const BottomNavigationBarItem(
            //   tooltip: '',
            //   icon: SizedBox.shrink(),
            //   label: '',
            // ),
            BottomNavigationBarItem(
              tooltip: LocaleKeys.meeting.tr(),
              icon: CustomBottomNavigationBarItem(
                title: LocaleKeys.meeting.tr(), // Translate 'Chats'
                iconPath: AppIcons.meeting,
                iconFilledPath: AppIcons.meetingFilled,
                isSelected: _currentIndex == 2,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              tooltip: LocaleKeys.profile.tr(),
              icon: CustomBottomNavigationBarItem(
                title: LocaleKeys.profile.tr(), // Translate 'Requests'
                iconPath: AppIcons.profile,
                iconFilledPath: AppIcons.profileFilled,
                isSelected: _currentIndex == 3,
              ),
              label: '',
            ),
          ],
        ),
      ),
    );
  }
}

class CustomComingSoon extends StatelessWidget {
  const CustomComingSoon({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.construction, size: 100, color: Colors.grey),
          const SizedBox(height: 20),
          Text('قريباً', style: AppStyles.bold24Grey),
        ],
      ),
    );
  }
}
