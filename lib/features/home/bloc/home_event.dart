import 'package:equatable/equatable.dart';
import '../models/v_card_model.dart';

abstract class HomeEvent extends Equatable {
  @override
  List<Object> get props => [];
}

// Fetch all VCards
class FetchVCards extends HomeEvent {}

// Add new VCard
class AddVCard extends HomeEvent {
  final VCardModel vCard;

  AddVCard(this.vCard);

  @override
  List<Object> get props => [vCard];
}

// Update a VCard
class UpdateVCard extends HomeEvent {
  final dynamic key;
  final VCardModel updatedVCard;

  UpdateVCard(this.key, this.updatedVCard);

  @override
  List<Object> get props => [key, updatedVCard];
}

// Delete a VCard
class DeleteVCard extends HomeEvent {
  final dynamic key;

  DeleteVCard(this.key);

  @override
  List<Object> get props => [key];
}

// Clear all VCards
class ClearVCards extends HomeEvent {}
