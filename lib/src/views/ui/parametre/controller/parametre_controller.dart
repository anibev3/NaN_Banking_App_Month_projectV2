import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
import 'package:nan_banking_app_mai_project/src/routes/app_pages.dart';

class ParamsController extends GetxController {
  static ParamsController get instance => Get.find();

  // GetStorage box = GetStorage();
  // String userNawariNOM = '';
  // String userNawariPRENOM = '';
  // String userNawariPIN = '';
  // String userID = '';
  // bool isFrees = false;

  @override
  void onInit() {
    // userID = box.read('userNawariID');
    // userNawariNOM = box.read('userNawariNOM');
    // userNawariPRENOM = box.read('userNawariPRENOM');
    // userNawariPIN = box.read('userNawariPIN');

    super.onInit();
  }

  void goToUpdatePinPage() {
    Get.toNamed(Routes.UPDATEPASSWORD);
  }

  void goToTest1Page() {
    Get.toNamed(Routes.TESTPAGE1);
  }

  void goToTest2Page() {
    Get.toNamed(Routes.TESTPAGE2);
  }

  void goToTest3Page() {
    Get.toNamed(Routes.TESTPAGE3);
  }
}
