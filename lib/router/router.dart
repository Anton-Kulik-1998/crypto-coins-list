import 'package:crypto_coins_list/features/crypto_coin/crypto_coin.dart';
import 'package:crypto_coins_list/repositories/crypto_coins/models/crypto_coin.dart';
import 'package:flutter/material.dart';
import '../features/crypto_list/crypto_list.dart';

final routes = {
  "/": (context) => const CryptoListScreen(),
  "/coin": (context) => CryptoCoinScreen(coin: ModalRoute.of(context)!.settings.arguments as CryptoCoin,),
};
