//Flutter 3.13.9
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zakazflow/app.dart';
import 'package:zakazflow/core/di/injection_container.dart';
import 'package:zakazflow/core/services/app_status/app_bloc.dart';
import 'package:zakazflow/main_runner.dart';
import 'package:zakazflow/core/services/language_provder/language_cubit.dart';

part './app_provider_wrapper.dart';

Future<void> main() {
  return MainRunner.run(
      appBuilder: () => AppProvidersWrapper(child: ZakazFlowApp()));
}
