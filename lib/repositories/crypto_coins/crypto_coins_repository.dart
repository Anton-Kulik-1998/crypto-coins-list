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
  Future<CryptoCoinDetail> getCoinDetails(String currencyCode) async {
    final response = await dio.get(
        "https://min-api.cryptocompare.com/data/pricemultifull?fsyms=$currencyCode&tsyms=USD");
    final data = response.data as Map<String, dynamic>;
    final dataRow = data["ROW"] as Map<String, dynamic>;
    final coinData = dataRow[currencyCode] as Map<String, dynamic>;
    final usdData = coinData["USD"] as Map<String, dynamic>;
    final priceInUSD = usdData["PRICE"];
    final imageUrl = usdData["IMAGEURL"];
    final toSymbol = usdData["TOSYMBOL"];
    final lastUpdate = usdData["LASTUPDATE"];
    final hight24Hour = usdData["HIGH24HOUR"];
    final low24Hours = usdData["LOW24HOUR"];

    return CryptoCoinDetail(
        priceInUSD: priceInUSD,
        imageUrl: "https://www.cryptocompare.com/$imageUrl",
        toSymbol: toSymbol,
        lastUpdate: DateTime.fromMicrosecondsSinceEpoch(lastUpdate),
        hight24Hour: hight24Hour,
        low24Hours: low24Hours);
  }
}
