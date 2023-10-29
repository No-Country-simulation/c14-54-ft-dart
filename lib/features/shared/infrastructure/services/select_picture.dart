import 'package:image_picker/image_picker.dart';

class SelectPicture {
  final ImagePicker _picker = ImagePicker();
  Future<XFile?> getImageGallery() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    return image;
  }
}
