import 'package:Pourosova/shared/constants/api_constants.dart';

const LOADING_APIS = [
  ApiConstants.login,
  ApiConstants.dashboard,
];

bool isInLoadingApis(String path) {
  if (path == null) {
    return false;
  }

  return LOADING_APIS.indexWhere((api) => path.contains(api)) > -1;
}
