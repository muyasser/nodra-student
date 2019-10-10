import 'package:flutter/material.dart';
import 'package:nodra_student/providers/page_provider.dart';
import 'package:nodra_student/ui/styles/style_consts.dart';
import 'package:provider/provider.dart';

// this screen will show after registeration completes
// it will contain the main ui elements like scaffold
// and shared ui elements
// we will change the content of the cureently shown page
// based on user choice, while keepig the shared
// ui elements shown

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool showFilterIcon = true;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PageProvider>(context);

    return Scaffold(
      backgroundColor: kBackgroundFrameColor,
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Text(provider.currentAppBartitle),
        actions: <Widget>[
          showFilterIcon
              ? IconButton(
                  icon: Icon(Icons.filter_list),
                  onPressed: () {},
                )
              : SizedBox(),
          IconButton(
            icon: Icon(Icons.help),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      body: provider.currentPage,
    );
  }
}

class AppDrawer extends StatefulWidget {
  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PageProvider>(context);
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        //shrinkWrap: true,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(color: kPrimaryColor),
            child: Container(
              padding: const EdgeInsets.all(8),
              child: Column(
                //mainAxisSize: MainAxisSize.min,
                //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerLeft,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 30,
                      child: Icon(
                        Icons.person,
                        color: kPrimaryColor,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Facebook Name',
                    style: TextStyle(fontSize: 14, color: Colors.white),
                    // style: kTitleTextStyle.copyWith(
                    //   color: Colors.white,
                    // ),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    'email@company.com',
                    style: TextStyle(fontSize: 12, color: Colors.white),
                    // style: kCaptionTextStyle.copyWith(
                    //   color: Colors.white,
                    // ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              //shrinkWrap: true,
              itemCount: provider.pagesTitles.length,
              itemBuilder: (context, index) {
                final String title =
                    provider.requestPageTitle(provider.pagesTitles[index]);
                return ListTile(
                  title: Text(title),
                  leading: Icon(
                    provider.requestPageIcon(provider.pagesTitles[index]),
                  ),
                  onTap: () {
                    provider.requestPage(provider.pagesTitles[index]);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
