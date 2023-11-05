import 'package:bloc/bloc.dart';
import 'package:crypto_coins_list/repositories/crypto_coins/crypto_coins.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';

part 'crypto_coins_details_event.dart';
part 'crypto_coins_details_state.dart';

class CryptoCoinsDetailsBloc
    extends Bloc<CryptoCoinsDetailsEvent, CryptoCoinsDetailsState> {
  CryptoCoinsDetailsBloc(this.coinsRepository)
      : super(const CryptoCoinsDetailsState()) {
    on<LoadCryptoCoinDetails>(_load);
  }
  final AbstractCoinsRepository coinsRepository;

  Future<void> _load(LoadCryptoCoinDetails event,
      Emitter<CryptoCoinsDetailsState> emit) async {
    try {
      if (state is! CryptoCoinDetailsLoaded) {
        emit(const CryptoCoinDetailsLoading());
      }
      final coinDetails =
          await coinsRepository.getCoinDetails(event.currencyCode);
      emit(CryptoCoinDetailsLoaded(coinDetails));
    } catch (e, st) {
      emit(CryptoCoinDetailsLoadingFailure(e));
      GetIt.I<Talker>().handle(e, st);
    }
  }
  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    GetIt.I<Talker>().handle(error, stackTrace);
  }
}
