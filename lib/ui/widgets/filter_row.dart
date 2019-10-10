import 'package:flutter/material.dart';
import 'package:nodra_student/ui/styles/style_consts.dart';

enum FilterCategory { MaterialType, MaterialTiming }

const materialTypes = ['Lecture', 'Revision', 'All'];
const materialTiming = ['Before Mid-Term', 'After Mid-Term', 'All'];
String _currentMaterialType;
String _currentTimingType;

class FilterRow extends StatefulWidget {
  final Function onMaterialTypeChanged;
  final Function onMaterialTimingChanged;

  static String getTypeFilter() {
    return _currentMaterialType;
  }

  static String getTimingFilter() {
    return _currentTimingType;
  }

  FilterRow(
      {@required this.onMaterialTypeChanged,
      @required this.onMaterialTimingChanged});

  @override
  _FilterRowState createState() => _FilterRowState();
}

class _FilterRowState extends State<FilterRow> {
  void onMenuChanged(FilterCategory category, String value) {
    if (category == FilterCategory.MaterialType) {
      setState(() {
        _currentMaterialType = value;
      });
    } else {
      setState(() {
        _currentTimingType = value;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Expanded(
            child: Container(
              //alignment: Alignment.center,
              padding: const EdgeInsets.all(8),
              color: kColoredBackgroundTextColor,
              child: DropdownButton<String>(
                isExpanded: true,
                style: TextStyle(color: Colors.black),
                hint: Text('Type'),
                underline: SizedBox(),
                value: _currentMaterialType,
                onChanged: (String newValue) {
                  onMenuChanged(FilterCategory.MaterialType, newValue);
                  widget.onMaterialTypeChanged();
                },
                items: [
                  DropdownMenuItem(
                    child: Container(child: Text(materialTypes[0])),
                    value: materialTypes[0],
                  ),
                  DropdownMenuItem(
                    child: Text(materialTypes[1]),
                    value: 'materialTypes[1]',
                  ),
                  DropdownMenuItem(
                    child: Text(materialTypes[2]),
                    value: materialTypes[2],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: 14,
          ),
          // the right filter
          Expanded(
            child: Container(
              //alignment: Alignment.center,
              padding: const EdgeInsets.all(8),
              color: kColoredBackgroundTextColor,
              child: DropdownButton<String>(
                isExpanded: true,
                style: TextStyle(color: Colors.black),
                hint: Text('Timing'),
                value: _currentTimingType,
                underline: SizedBox(),
                onChanged: (String newValue) {
                  onMenuChanged(FilterCategory.MaterialTiming, newValue);
                  widget.onMaterialTimingChanged();
                },
                items: [
                  DropdownMenuItem(
                    child: Text(materialTiming[0]),
                    value: materialTiming[0],
                  ),
                  DropdownMenuItem(
                    child: Text(materialTiming[1]),
                    value: materialTiming[1],
                  ),
                  DropdownMenuItem(
                    child: Text(materialTiming[2]),
                    value: materialTiming[2],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
