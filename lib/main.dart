import 'dart:async';

import 'package:crypto_coins_list/crypto_coins_list_app.dart';
import 'package:crypto_coins_list/repositories/crypto_coins/crypto_coins.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';

void main() {
  final talker = TalkerFlutter.init();
  GetIt.I.registerSingleton(talker);
  GetIt.I<Talker>().debug("Talker started...");
  FlutterError.onError = (details) => GetIt.I<Talker>().handle(details.exception, details.stack);
  GetIt.I.registerLazySingleton<AbstractCoinsRepository>(
      () => CryptoCoinsRepository(dio: Dio()));

  runZonedGuarded(() => runApp(const CryptoCoinsListApp()), (error, stack) {
    GetIt.I<Talker>().handle(error, stack);
  });
}
