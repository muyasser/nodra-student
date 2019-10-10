import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nodra_student/ui/screens/home_screen.dart';
import 'package:nodra_student/ui/styles/style_consts.dart';

final _featuresList = [
  FeaturePage('book_lover', 'Preview Digital Copies From Your Mobile'),
  FeaturePage('waiting_notifications',
      'Get Notifications When New Copies Are Available'),
  FeaturePage('arranging_files', 'Follow Your favorite Doctors'),
  FeaturePage('checklist', 'Check Purchased Or Studied Copies'),
  FeaturePage('new_message', 'Recieve News About Available Courses'),
  FeaturePage(
    'graduation',
    'Get Started',
    reachedGetStarted: true,
  ),
];

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _featuresList.length, vsync: this);
  }

  void showNextPage() {
    setState(() {
      currentPage = _tabController.index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Stack(
          children: <Widget>[
            TabBarView(
              controller: _tabController,
              children: _featuresList,
            ),
            currentPage != _tabController.length - 1
                ? Positioned(
                    bottom: 10,
                    right: 10,
                    child: IconButton(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      color: kPrimaryColor,
                      icon: Icon(
                        Icons.arrow_forward_ios,
                      ),
                      onPressed: () {
                        _tabController.animateTo(_tabController.index + 1);
                        showNextPage();
                      },
                    ),
                  )
                : Container()
          ],
        ),
      ),
    );
  }
}

class FeaturePage extends StatelessWidget {
  final String assetName;
  final String textContent;
  final bool reachedGetStarted;

  FeaturePage(this.assetName, this.textContent, {this.reachedGetStarted});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        //mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 7,
            child: FittedBox(
              alignment: Alignment.center,
              child: SvgPicture.asset(
                'assets/vectors/$assetName.svg',

                //fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: reachedGetStarted == null
                ? Text(
                    textContent,
                    textAlign: TextAlign.center,
                    textScaleFactor: 1.1,
                    style: kSubjectNameTextStyle,
                  )
                : GestureDetector(
                    child: Text(
                      textContent,
                      textAlign: TextAlign.center,
                      textScaleFactor: 1.1,
                      style: kSubjectNameTextStyle,
                    ),
                    onTap: () {
                      //go to signInPage
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return HomeScreen();
                      }));
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
