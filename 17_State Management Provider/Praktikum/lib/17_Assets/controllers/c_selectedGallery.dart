import 'package:flutter/widgets.dart';

class SelectedImageProvider extends ChangeNotifier {
  String _selectedImagePath = '';

  String get selectedImagePath => _selectedImagePath;

  void setSelectedImagePath(String imagePath) {
    _selectedImagePath = imagePath;
    notifyListeners(); // Notify listeners when the data changes
  }
}
