import 'package:hive/hive.dart';
import '../models/v_card_model.dart';

class HomeRepository {
  final Box<VCardModel> vCardBox;

  HomeRepository(this.vCardBox);

  // Get all VCards
  List<VCardModel> getAllVCards() {
    try {
      return vCardBox.values.toList();
    } catch (e) {
      rethrow;
    }
  }

  // Add a new VCard
  Future<void> addVCard(VCardModel vCard) async {
    try {
      await vCardBox.add(vCard);
    } catch (e) {
      rethrow;
    }
  }

  // Update an existing VCard
  Future<void> updateVCard(dynamic key, VCardModel updatedVCard) async {
    try {
      await vCardBox.put(key, updatedVCard);
    } catch (e) {
      rethrow;
    }
  }

  // Delete a VCard
  Future<void> deleteVCard(dynamic key) async {
    try {
      await vCardBox.delete(key);
    } catch (e) {
      rethrow;
    }
  }

  // Delete all VCards
  Future<void> clearVCards() async {
    try {
      await vCardBox.clear();
    } catch (e) {
      rethrow;
    }
  }
}
