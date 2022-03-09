import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart' as bloc;
import 'package:get/get.dart' as GetX;
import 'package:get/get.dart';
import 'package:overlay_support/overlay_support.dart';

import 'src/base/bloc.dart'; 
import 'src/translations/app_translations.dart';
import 'src/constants/constants.dart';
import 'src/routes/app_pages.dart';
import 'src/utils/utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  await AppPrefs.initListener();
  _initialBlocs();
  bloc.BlocOverrides.runZoned(() {
    runApp(OverlaySupport(child: const App()));
  }, blocObserver: AppBlocObserver());
}

void _initialBlocs() {
  Get.put(
    AuthBloc(),
    permanent: true,
  ); 
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return GetX.GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.INITIAL,
      theme: AppThemes.appTheme,
      defaultTransition: GetX.Transition.fadeIn,
      getPages: AppPages.pages,
      locale: Locale('vi', 'VN'),
      translationsKeys: AppTranslation.translations,
    );
  }
}
