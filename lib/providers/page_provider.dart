import 'package:nodra_student/ui/screens/future/account_settings_page.dart';
import 'package:nodra_student/ui/screens/future/announcements_page.dart';
import 'package:nodra_student/ui/screens/future/doctors_page.dart';
import 'package:nodra_student/ui/screens/future/logout_page.dart';
import 'package:nodra_student/ui/screens/future/main_page.dart';
import 'package:nodra_student/ui/screens/future/my_subjects_page.dart';
import 'package:nodra_student/ui/screens/future/soft_copies_page.dart';
import 'package:nodra_student/ui/screens/hard_copies_page.dart';
import 'package:flutter/material.dart';

enum _PagesTitles {
  Main,
  Announcements,
  HardCopies,
  SoftCopies,
  Doctors,
  MySubjects,
  AccountSettings,
  Logout
}

const Map<_PagesTitles, String> _pagesTitles = {
  _PagesTitles.Main: 'Home',
  _PagesTitles.Announcements: 'Announcements',
  _PagesTitles.SoftCopies: 'Soft Copies',
  _PagesTitles.HardCopies: 'Hard Copies',
  _PagesTitles.Doctors: 'Doctors',
  _PagesTitles.MySubjects: 'My Subjects',
  _PagesTitles.AccountSettings: 'Account Settings',
  _PagesTitles.Logout: 'Logout',
};

const Map<_PagesTitles, IconData> _pagesIcons = {
  _PagesTitles.Main: Icons.home,
  _PagesTitles.Announcements: Icons.announcement,
  _PagesTitles.SoftCopies: Icons.book,
  _PagesTitles.HardCopies: Icons.picture_as_pdf,
  _PagesTitles.Doctors: Icons.person,
  _PagesTitles.MySubjects: Icons.folder,
  _PagesTitles.AccountSettings: Icons.settings,
  _PagesTitles.Logout: Icons.exit_to_app
};

final _pagesMap = {
  _PagesTitles.Main: MainPage(),
  _PagesTitles.Announcements: AnnouncementsPage(),
  _PagesTitles.SoftCopies: SoftCopiesPage(),
  _PagesTitles.HardCopies: HardCopiesPage(),
  _PagesTitles.Doctors: DoctorsPage(),
  _PagesTitles.MySubjects: MySubjectsPage(),
  _PagesTitles.AccountSettings: AccountSettingsPage(),
  _PagesTitles.Logout: LogoutPage(),
};

class PageProvider extends ChangeNotifier {
  Widget _currentPage = _pagesMap[_PagesTitles.Main];

  String _currentAppBarTitle = 'Home';

  Widget get currentPage => _currentPage;
  String get currentAppBartitle => _currentAppBarTitle;
  Map<_PagesTitles, IconData> get pagesIcons => _pagesIcons;

  List<_PagesTitles> get pagesTitles => _PagesTitles.values;

  String requestPageTitle(_PagesTitles title) {
    return _pagesTitles[title];
  }

  IconData requestPageIcon(_PagesTitles page) {
    return _pagesIcons[page];
  }

  void requestPage(_PagesTitles pageTitle) {
    _currentPage = _pagesMap[pageTitle];
    _currentAppBarTitle = _pagesTitles[pageTitle];
    notifyListeners();
  }

  bool isCurrentPage(_PagesTitles page) {
    return _currentPage == _pagesMap[page];
  }
}
