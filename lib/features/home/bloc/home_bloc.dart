import 'package:flutter_bloc/flutter_bloc.dart';
import '../repository/home_repository.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository vCardRepository;

  HomeBloc(this.vCardRepository) : super(VCardInitial()) {
    _registerEventHandlers();
  }

  // Register event handlers in the constructor
  void _registerEventHandlers() {
    on<FetchVCards>(_onFetchVCards);
    on<AddVCard>(_onAddVCard);
    on<UpdateVCard>(_onUpdateVCard);
    on<DeleteVCard>(_onDeleteVCard);
    on<ClearVCards>(_onClearVCards);
  }

  // Handle FetchVCards event
  Future<void> _onFetchVCards(FetchVCards event, Emitter<HomeState> emit) async {
    emit(VCardLoading());
    try {
      final vCards = vCardRepository.getAllVCards();
      emit(VCardLoaded(vCards));
    } catch (e) {
      emit(const VCardError("Failed to fetch VCards"));
    }
  }

  // Handle AddVCard event
  Future<void> _onAddVCard(AddVCard event, Emitter<HomeState> emit) async {
    emit(VCardLoading());
    try {
      await vCardRepository.addVCard(event.vCard);
      emit(VCardOperationSuccess());
    } catch (e) {
      emit(const VCardError("Failed to add VCard"));
    }
  }

  // Handle UpdateVCard event
  Future<void> _onUpdateVCard(UpdateVCard event, Emitter<HomeState> emit) async {
    emit(VCardLoading());
    try {
      await vCardRepository.updateVCard(event.key, event.updatedVCard);
      emit(VCardOperationSuccess());
    } catch (e) {
      emit(const VCardError("Failed to update VCard"));
    }
  }

  // Handle DeleteVCard event
  Future<void> _onDeleteVCard(DeleteVCard event, Emitter<HomeState> emit) async {
    emit(VCardLoading());
    try {
      await vCardRepository.deleteVCard(event.key);
      emit(VCardOperationSuccess());
    } catch (e) {
      emit(const VCardError("Failed to delete VCard"));
    }
  }

  // Handle ClearVCards event
  Future<void> _onClearVCards(ClearVCards event, Emitter<HomeState> emit) async {
    emit(VCardLoading());
    try {
      await vCardRepository.clearVCards();
      emit(VCardOperationSuccess());
    } catch (e) {
      emit(const VCardError("Failed to clear VCards"));
    }
  }

  @override
  void onChange(Change<HomeState> change) {
    super.onChange(change);
    print(change);
  }

  @override
  void onEvent(HomeEvent event) {
    super.onEvent(event);
    print(event);
  }
}
