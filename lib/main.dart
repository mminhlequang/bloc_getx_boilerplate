import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart' as Bloc;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart' as GetX;

import 'src/presentation/presentation.dart';
import 'src/bloc/bloc.dart';
import 'src/translations/app_translations.dart';
import 'src/constants/constants.dart';
import 'src/routes/app_pages.dart';
import 'src/utils/utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await SystemChrome.setEnabledSystemUIOverlays([]);
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  await AppPref.initListener();
  initialBlocs();
  Bloc.Bloc.observer = ThemeBloc();

  runApp(App());
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<NavigationBloc>(
            create: (BuildContext context) => GetX.Get.find<NavigationBloc>(),
          ),
        ],
        child: GetX.GetMaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: Routes.INITIAL,
          theme: AppThemes.appTheme,
          defaultTransition: GetX.Transition.fadeIn,
          getPages: AppPages.pages,
          locale: Locale('vi', 'VN'),
          translationsKeys: AppTranslation.translations,
        ));
  }
}

class ThemeBloc extends Bloc.BlocObserver {
  @override
  Future<void> onEvent(Bloc.Bloc bloc, Object? event) async {
    super.onEvent(bloc, event);
    print('Event: $event');
  }

  @override
  void onTransition(Bloc.Bloc bloc, Bloc.Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }

  @override
  void onError(Bloc.BlocBase bloc, Object error, StackTrace stackTrace) {
    print(error);
    super.onError(bloc, error, stackTrace);
  }
}
