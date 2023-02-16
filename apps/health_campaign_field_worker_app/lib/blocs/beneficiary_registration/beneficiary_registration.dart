// GENERATED using mason_cli
import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/data_repository.dart';
import '../../models/data_model.dart';
import '../../utils/environment_config.dart';
import '../../utils/utils.dart';

part 'beneficiary_registration.freezed.dart';

typedef BeneficiaryRegistrationEmitter = Emitter<BeneficiaryRegistrationState>;

class BeneficiaryRegistrationBloc
    extends Bloc<BeneficiaryRegistrationEvent, BeneficiaryRegistrationState> {
  final DataRepository<IndividualModel, IndividualSearchModel>
      individualRepository;

  final DataRepository<HouseholdModel, HouseholdSearchModel>
      householdRepository;

  final DataRepository<HouseholdMemberModel, HouseholdMemberSearchModel>
      householdMemberRepository;

  final DataRepository<ProjectBeneficiaryModel, ProjectBeneficiarySearchModel>
      projectBeneficiaryRepository;

  final DataRepository<TaskModel, TaskSearchModel> taskRepository;

  BeneficiaryRegistrationBloc(
    super.initialState, {
    required this.individualRepository,
    required this.householdRepository,
    required this.householdMemberRepository,
    required this.projectBeneficiaryRepository,
    required this.taskRepository,
  }) {
    on(_handleSaveAddress);
    on(_handleSaveHouseholdDetails);
    on(_handleSaveIndividualDetails);
    on(_handleSubmit);
  }

  FutureOr<void> _handleSaveAddress(
    BeneficiaryRegistrationSaveAddressEvent event,
    BeneficiaryRegistrationEmitter emit,
  ) async {
    emit(state.copyWith(addressModel: event.model));
  }

  FutureOr<void> _handleSaveHouseholdDetails(
    BeneficiaryRegistrationSaveHouseholdDetailsEvent event,
    BeneficiaryRegistrationEmitter emit,
  ) async {
    emit(state.copyWith(
      householdModel: event.household,
      registrationDate: event.registrationDate,
    ));
  }

  FutureOr<void> _handleSaveIndividualDetails(
    BeneficiaryRegistrationSaveIndividualDetailsEvent event,
    BeneficiaryRegistrationEmitter emit,
  ) async {
    emit(state.copyWith(individualModel: event.model));
  }

  FutureOr<void> _handleSubmit(
    BeneficiaryRegistrationSubmitEvent event,
    BeneficiaryRegistrationEmitter emit,
  ) async {
    final individual = state.individualModel;
    final household = state.householdModel;
    final address = state.addressModel;
    final dateOfRegistration = state.registrationDate;

    if (individual == null) throw Exception('Individual cannot be null');
    if (household == null) throw Exception('Household cannot be null');
    if (address == null) throw Exception('Address cannot be null');
    if (dateOfRegistration == null) {
      throw Exception('Registration date cannot be null');
    }

    emit(state.copyWith(loading: true));
    try {
      await individualRepository
          .create(individual.copyWith(address: [address]));
      await householdRepository.create(household.copyWith(address: address));

      await projectBeneficiaryRepository.create(
        ProjectBeneficiaryModel(
          rowVersion: 1,
          tenantId: envConfig.variables.tenantId,
          clientReferenceId: IdGen.i.identifier,
          dateOfRegistration: dateOfRegistration.millisecondsSinceEpoch,
          // TODO(naveen): Please add project ID here
          projectId: '13',
          beneficiaryClientReferenceId: individual.clientReferenceId,
        ),
      );
      await householdMemberRepository.create(
        HouseholdMemberModel(
          householdClientReferenceId: household.clientReferenceId,
          individualClientReferenceId: individual.clientReferenceId,
          isHeadOfHousehold: state.isHeadOfHousehold,
          tenantId: envConfig.variables.tenantId,
          rowVersion: 1,
          clientReferenceId: IdGen.i.identifier,
        ),
      );
      await taskRepository.create(TaskModel(
        clientReferenceId: IdGen.i.identifier,
        tenantId: envConfig.variables.tenantId,
        rowVersion: 1,
        projectId: '',
        status: Status.notDelivered.name,
        createdDate: DateTime.now().millisecondsSinceEpoch,
        projectBeneficiaryId: individual.clientReferenceId,
        resources: [
          TaskResourceModel(
            clientReferenceId: IdGen.i.identifier,
            rowVersion: 1,
            isDelivered: false,
            deliveryComment: null,
            tenantId: envConfig.variables.tenantId,
          ),
        ],
      ));
    } catch (error) {
      rethrow;
    } finally {
      emit(state.copyWith(loading: false));
    }
  }
}

@freezed
class BeneficiaryRegistrationEvent with _$BeneficiaryRegistrationEvent {
  const factory BeneficiaryRegistrationEvent.saveAddress(
    AddressModel model,
  ) = BeneficiaryRegistrationSaveAddressEvent;

  const factory BeneficiaryRegistrationEvent.saveHouseholdDetails({
    required HouseholdModel household,
    required DateTime registrationDate,
  }) = BeneficiaryRegistrationSaveHouseholdDetailsEvent;

  const factory BeneficiaryRegistrationEvent.saveIndividualDetails(
    IndividualModel model,
  ) = BeneficiaryRegistrationSaveIndividualDetailsEvent;

  const factory BeneficiaryRegistrationEvent.submit() =
      BeneficiaryRegistrationSubmitEvent;
}

@freezed
class BeneficiaryRegistrationState with _$BeneficiaryRegistrationState {
  const factory BeneficiaryRegistrationState({
    AddressModel? addressModel,
    IndividualModel? individualModel,
    HouseholdModel? householdModel,
    DateTime? registrationDate,
    @Default(false) bool isHeadOfHousehold,
    @Default(false) bool loading,
  }) = _BeneficiaryRegistrationState;
}
