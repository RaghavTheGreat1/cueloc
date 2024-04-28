import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../services/admob_services.dart';

final admobServicesProvider = Provider<AdmobServices>((ref) {
  return AdmobServices();
});
