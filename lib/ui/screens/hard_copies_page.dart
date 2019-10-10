import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nodra_student/providers/materials_data_provider.dart';
import 'package:nodra_student/providers/page_provider.dart';
import 'package:nodra_student/ui/styles/style_consts.dart';
import 'package:nodra_student/ui/widgets/filter_row.dart';
import 'package:provider/provider.dart';

// this represents the hard copies screen

class HardCopiesPage extends StatefulWidget {
  @override
  _HardCopiesPageState createState() => _HardCopiesPageState();
}

class _HardCopiesPageState extends State<HardCopiesPage> {
  bool showBeforeMid = true;
  bool showAfterMid = true;

  String currentType = FilterRow.getTypeFilter();
  String currentTiming = FilterRow.getTimingFilter();

  @override
  Widget build(BuildContext context) {
    final materialsDataProvider = Provider.of<MaterialsDataProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FilterRow(
              onMaterialTypeChanged: () {
                print('type changed');
                currentType = FilterRow.getTypeFilter();
              },
              onMaterialTimingChanged: () {
                print('timing changed');
                currentTiming = FilterRow.getTimingFilter();
                setState(() {
                  if (currentTiming == 'Before Mid-Term') {
                    showBeforeMid = true;
                    showAfterMid = false;
                  } else if (currentTiming == 'After Mid-Term') {
                    showBeforeMid = false;
                    showAfterMid = true;
                  } else {
                    showBeforeMid = true;
                    showAfterMid = true;
                  }
                });
              },
            ),
          ),
          Expanded(
            child: Container(
              color: kColoredBackgroundTextColor,
              child: ListView.builder(
                itemCount: materialsDataProvider.materialsTitles.length,
                itemBuilder: (context, index) {
                  final String title =
                      materialsDataProvider.requestMaterialTitle(
                          materialsDataProvider.materialsTitles[index]);
                  return ExpansionTile(
                    leading: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: kSecondaryColor,
                      ),
                      child: Center(
                        child: Text(
                          '5',
                          style: TextStyle(color: kColoredBackgroundTextColor),
                        ),
                      ),
                    ),
                    title: Center(
                      child: Text(
                        title,
                      ),
                    ),
                    children: <Widget>[
                      showBeforeMid
                          ? Text(
                              'Before Mid-Term',
                              style: TextStyle(color: kPrimaryColor),
                            )
                          : SizedBox(),
                      showBeforeMid
                          ? Container(
                              padding: const EdgeInsets.all(20),
                              color: kBackgroundFrameColor,
                              height: 100,
                              child: ListView.builder(
                                itemCount: 4,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context2, index2) {
                                  return Container(
                                    padding: EdgeInsets.all(4),
                                    child: SvgPicture.asset(
                                      'assets/vectors/file.svg',
                                      fit: BoxFit.contain,
                                      height: 30,
                                      color: kDisabledTextColor,
                                    ),
                                  );
                                },
                              ),
                            )
                          : SizedBox(),
                      showAfterMid
                          ? Text('After Mid-Term',
                              style: TextStyle(color: kPrimaryColor))
                          : SizedBox(),
                      showAfterMid
                          ? Container(
                              padding: const EdgeInsets.all(20),
                              color: kBackgroundFrameColor,
                              height: 100,
                              child: ListView.builder(
                                itemCount: 4,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context2, index2) {
                                  return Container(
                                    padding: EdgeInsets.all(4),
                                    child: SvgPicture.asset(
                                      'assets/vectors/file.svg',
                                      fit: BoxFit.contain,
                                      height: 30,
                                      color: kDisabledTextColor,
                                    ),
                                  );
                                },
                              ),
                            )
                          : SizedBox(),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
