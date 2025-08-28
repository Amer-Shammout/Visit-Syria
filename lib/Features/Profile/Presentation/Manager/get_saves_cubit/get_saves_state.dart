import 'package:equatable/equatable.dart';

abstract class GetSavesState extends Equatable {
  const GetSavesState();

  @override
  List<Object?> get props => [];
}

class GetSavesInitial extends GetSavesState {}

class GetSavesLoading extends GetSavesState {}

class GetSavesEmpty extends GetSavesState {}

class GetSavesFailure extends GetSavesState {
  final String errMessage;
  const GetSavesFailure({required this.errMessage});

  @override
  List<Object?> get props => [errMessage];
}

class GetSavesSuccess<T> extends GetSavesState {
  final List<T> items;
  const GetSavesSuccess(this.items);

  @override
  List<Object?> get props => [items];
}
