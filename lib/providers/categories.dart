import 'package:flutter/foundation.dart';

import '../models/category.dart' as cat;
import '../dummy_data.dart';

class Categories with ChangeNotifier {
  final List<cat.Category> _items = [...dummyCategories];

  List<cat.Category> get items => [..._items];
}
