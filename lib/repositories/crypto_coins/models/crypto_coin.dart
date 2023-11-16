import 'package:equatable/equatable.dart';

class CryptoCoin extends Equatable {
  const CryptoCoin(
      {required this.name});

  final String name;
  

  @override
  List<Object?> get props => [name];
}
