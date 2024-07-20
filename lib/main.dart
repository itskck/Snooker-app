import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:snookerpad/core/global_providers.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();

  await EasyLocalization.ensureInitialized();

  final tmpDir = await getApplicationDocumentsDirectory();
  HydratedBloc.storage = await HydratedStorage.build(storageDirectory: tmpDir);

  runApp(
    const GlobalProviders(),
  );
}
