part of 'crypto_coins_details_bloc.dart';

class CryptoCoinsDetailsState extends Equatable {
  const CryptoCoinsDetailsState();
  
  @override
  List<Object?> get props => [];
}

class CryptoCoinDetailsLoading extends CryptoCoinsDetailsState {
  const CryptoCoinDetailsLoading();
}

class CryptoCoinDetailsLoaded extends CryptoCoinsDetailsState {
  const CryptoCoinDetailsLoaded(this.coin);

  final CryptoCoin coin;

  @override
  List<Object?> get props => [coin];
}

class CryptoCoinDetailsLoadingFailure extends CryptoCoinsDetailsState {
  const CryptoCoinDetailsLoadingFailure(this.exception);

  final Object exception;

  @override
  List<Object?> get props => super.props..add(exception);
}