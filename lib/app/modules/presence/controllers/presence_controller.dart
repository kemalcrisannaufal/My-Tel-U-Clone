import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class PresenceController extends GetxController {
  var selectedImagePath = ''.obs;

  final ImagePicker picker = ImagePicker();

  void getImage(ImageSource imageSource) async {
    final XFile? image = await picker.pickImage(source: imageSource);
    if (image == null) {
      Get.snackbar("Error", "Tidak ada file yang dipilih");
    } else {
      selectedImagePath.value = image.path;
    }
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
