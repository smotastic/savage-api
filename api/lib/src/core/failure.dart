import 'package:equatable/equatable.dart';

abstract class ApiFailure extends Equatable {
  final int code;

  const ApiFailure(this.code);

  @override
  List<Object?> get props => [code];
}
