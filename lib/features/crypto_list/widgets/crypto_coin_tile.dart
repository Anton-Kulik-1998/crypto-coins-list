import 'package:crypto_coins_list/repositories/crypto_coins/models/crypto_coin.dart';
import 'package:flutter/material.dart';

class CryptoCoinTile extends StatelessWidget {
  const CryptoCoinTile({
    super.key,
    required this.coin,
  });

  final CryptoCoin coin;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final coinDetails = coin.details;
    return ListTile(
      leading: Image.network(coinDetails.fullImageUrl),
      title: Text(
        coin.name,
        style: theme.textTheme.bodyMedium,
      ),
      subtitle: Text(
        "${coinDetails.priceInUSD} \$",
        style: theme.textTheme.labelSmall,
      ),
      trailing: Icon(Icons.arrow_forward_ios),
      onTap: () {
        Navigator.of(context).pushNamed("/coin", arguments: coin);
      },
    );
  }
}
