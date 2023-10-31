import 'package:crypto_coins_list/repositories/crypto_coins/crypto_coins.dart';
import 'package:dio/dio.dart';

class CryptoCoinsRepository implements AbstractCoinsRepository {
  CryptoCoinsRepository({required this.dio});

  final Dio dio;
  @override
  Future<List<CryptoCoin>> getCoinsList() async {
    final response = await dio.get(
        "https://min-api.cryptocompare.com/data/pricemultifull?fsyms=BTC,ETH,BNB,SOL,AID,CAG,DOV&tsyms=USD,EUR");

    final data = response.data as Map<String, dynamic>;
    final dataRaw = data["RAW"] as Map<String, dynamic>;
    final cryptoCoinsList = dataRaw.entries.map((e) {
      final usdData =
          (e.value as Map<String, dynamic>)["USD"] as Map<String, dynamic>;
      final price = usdData["PRICE"];
      final imageURL = usdData["IMAGEURL"];

      return CryptoCoin(
        name: e.key,
        priceInUSD: price,
        imageURL: "https://www.cryptocompare.com/$imageURL",
      );
    }).toList();
    return cryptoCoinsList;
  }
  
  @override
  Future<CryptoCoin> getCoinDetails(String currencyCode) async {
    // TODO: implement getCoinDetails
    throw UnimplementedError();
  }
}
