import 'package:equatable/equatable.dart';
import '../models/v_card_model.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object?> get props => [];
}

// Initial state
class VCardInitial extends HomeState {}

// Loading state
class VCardLoading extends HomeState {}

// Loaded state with VCards
class VCardLoaded extends HomeState {
  final List<VCardModel> vCards;

  const VCardLoaded(this.vCards);

  @override
  List<Object?> get props => [vCards];
}

// Error state
class VCardError extends HomeState {
  final String message;

  const VCardError(this.message);

  @override
  List<Object?> get props => [message];
}

// Operation Success state
class VCardOperationSuccess extends HomeState {}
