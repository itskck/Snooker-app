import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:snookerpad/core/global_providers.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await EasyLocalization.ensureInitialized();

  final tmpDir = await getApplicationDocumentsDirectory();
  final storage = await HydratedStorage.build(storageDirectory: tmpDir);

  HydratedBlocOverrides.runZoned(
    () => runApp(
      const GlobalProviders(),
    ),
    storage: storage,
  );
}
