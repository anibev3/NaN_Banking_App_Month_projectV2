import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nan_banking_app_mai_project/firebase_options.dart';
import 'package:nan_banking_app_mai_project/src/routes/app_pages.dart';
import 'package:nan_banking_app_mai_project/src/utils/services/notification_service.dart';
import 'package:nan_banking_app_mai_project/src/views/ui/session/controller/login_controller.dart';

void main() async {
  await GetStorage.init();
  await initServices();
  runApp(MyApp());
}

Future<bool> initServices() async {
  print('starting services...');

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((value) => Get.put(LoginController()));
  // await Get.putAsync(() => NotificationService().init());

  // await Get.put(NotificationService());
  print('All services started...');
  return true;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.INITIALEMENT,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      defaultTransition: Transition.fade, //J'ai Ajouté cette propriété
      getPages: AppPages.pages,
      locale: const Locale('fr', 'FR'),
    );
  }
}
