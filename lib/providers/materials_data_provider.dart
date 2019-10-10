import 'package:flutter/foundation.dart';

enum _MaterialsTitles {
  Economics,
  BusinessEnglish,
  PureMath,
  Law,
  ManagementFundamentals
}

const Map<_MaterialsTitles, String> _materialsTitles = {
  _MaterialsTitles.Economics: 'Economics',
  _MaterialsTitles.BusinessEnglish: 'Business English',
  _MaterialsTitles.PureMath: 'Pure Math',
  _MaterialsTitles.Law: 'Law',
  _MaterialsTitles.ManagementFundamentals: 'Management Fundamentals',
};

final Map<_MaterialsTitles, List<int>> _materialsData = {
  _MaterialsTitles.Economics: [1, 2, 3, 4],
  _MaterialsTitles.BusinessEnglish: [1, 2, 3, 4],
  _MaterialsTitles.PureMath: [1, 2, 3, 4],
  _MaterialsTitles.Law: [1, 2, 3, 4],
  _MaterialsTitles.ManagementFundamentals: [1, 2, 3, 4],
};

class MaterialsDataProvider extends ChangeNotifier {
  List<_MaterialsTitles> get materialsTitles => _MaterialsTitles.values;

  String requestMaterialTitle(_MaterialsTitles material) {
    return _materialsTitles[material];
  }
}
