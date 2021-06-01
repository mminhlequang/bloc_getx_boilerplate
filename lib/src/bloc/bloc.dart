export 'auth_bloc/auth_bloc.dart';
export 'base_bloc/base_bloc.dart';

import 'package:get/get.dart';
import 'auth_bloc/auth_bloc.dart';
import 'base_bloc/base_bloc.dart';
import '../presentation/presentation.dart';

void initialBlocs() {
  Get.put(
    AuthBloc(),
    permanent: true,
  );
  Get.put(
    NavigationBloc(),
    permanent: true,
  );
}
