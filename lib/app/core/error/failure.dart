import 'package:equatable/equatable.dart';

abstract base class Failure extends Equatable {
  @override
  List<Object?> get props => [];
}

final class ServerFailure extends Failure {}
