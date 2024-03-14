import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class HomeController extends GetxController {
  final _imagePicker = ImagePicker();
  RxList listdata = [
    {
      'type': 'Cleanser',
      'name': 'Cetaphil Gentle Skin Cleanser',
      'time': '8:00 PM'
    },
    {
      'type': 'Toner',
      'name': 'Thayers Witch Hazel Toner',
      'time': '8:30 PM'
    },
    {
      'type': 'Moisturizer',
      'name': 'Kiehl\'s Ultra Facial Cream',
      'time': '9:00 PM'
    },
    {
      'type': 'Sunscreen',
      'name': 'Supergoop Unseen Sunscreen SPF 40',
      'time': '9:30 PM'
    },
    {
      'type': 'Lip Balm',
      'name': 'Glossier Birthday Balm Dotcom',
      'time': '10:00 PM'
    }
  ].obs;
  Future<String?> pickImage() async {
    final pickedFile = await _imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      return pickedFile.path;
    } else {
      if (kDebugMode) {
        print('No image selected.');
      }
      return null;
    }
  }
}
