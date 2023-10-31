part of 'crypto_coins_details_bloc.dart';

abstract class CryptoCoinsDetailsEvent extends Equatable {
  const CryptoCoinsDetailsEvent();

  @override
  List<Object> get props => [];
}

class LoadCryptoCoinDetails extends CryptoCoinsDetailsEvent {
  const LoadCryptoCoinDetails({
    required this.currencyCode,
  });

  final String currencyCode;

  @override
  List<Object> get props => super.props..add(currencyCode);
}