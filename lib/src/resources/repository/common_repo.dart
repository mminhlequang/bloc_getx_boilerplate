import '../resources.dart';

class CommonRepository {
  CommonRepository._();

  static CommonRepository? _instance;

  factory CommonRepository([AppApi? api]) {
    if (_instance == null) _instance = CommonRepository._();
    _instance!._api = api ?? AppApiImp();
    return _instance!;
  }

  late final AppApi _api;

// Future<List<Country>> getPhoneAvailable() async {
//   NetworkResponse response = await _api.getPhoneAvailable();
//   return response.data ?? [];
// }
}
