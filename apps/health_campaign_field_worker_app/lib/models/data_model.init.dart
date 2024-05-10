// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

import 'data_model.dart' as p0;
import 'entities/additional_fields_type.dart' as p1;
import 'entities/address.dart' as p2;
import 'entities/address_type.dart' as p3;
import 'entities/attributes.dart' as p4;
import 'entities/beneficiary_type.dart' as p5;
import 'entities/blood_group.dart' as p6;
import 'entities/boundary.dart' as p7;
import 'entities/deliver_strategy_type.dart' as p8;
import 'entities/document.dart' as p9;
import 'entities/downsync.dart' as p10;
import 'entities/facility.dart' as p11;
import 'entities/gender.dart' as p12;
import 'entities/hcm_attendance_log_model.dart' as p13;
import 'entities/hcm_attendance_model.dart' as p14;
import 'entities/hcm_hf_referral.dart' as p15;
import 'entities/hcm_inventory_facility.dart' as p16;
import 'entities/hcm_stock.dart' as p17;
import 'entities/hcm_stock_recon.dart' as p18;
import 'entities/household.dart' as p19;
import 'entities/household_member.dart' as p20;
import 'entities/identifier.dart' as p21;
import 'entities/individual.dart' as p22;
import 'entities/locality.dart' as p23;
import 'entities/name.dart' as p24;
import 'entities/product.dart' as p25;
import 'entities/product_variant.dart' as p26;
import 'entities/project.dart' as p27;
import 'entities/project_beneficiary.dart' as p28;
import 'entities/project_facility.dart' as p29;
import 'entities/project_product_variant.dart' as p30;
import 'entities/project_resource.dart' as p31;
import 'entities/project_staff.dart' as p32;
import 'entities/project_type.dart' as p33;
import 'entities/referral.dart' as p34;
import 'entities/roles.dart' as p35;
import 'entities/roles_type.dart' as p36;
import 'entities/scanner_type.dart' as p37;
import 'entities/service.dart' as p38;
import 'entities/service_attributes.dart' as p39;
import 'entities/service_definition.dart' as p40;
import 'entities/side_effect.dart' as p41;
import 'entities/status.dart' as p42;
import 'entities/target.dart' as p43;
import 'entities/task.dart' as p44;
import 'entities/task_resource.dart' as p45;
import 'entities/user.dart' as p46;
import 'oplog/oplog_entry.dart' as p47;
import 'pgr_complaints/pgr_address.dart' as p48;
import 'pgr_complaints/pgr_complaints.dart' as p49;
import 'pgr_complaints/pgr_complaints_response.dart' as p50;
import 'package:attendance_management/models/attendance_audit.dart' as p51;
import 'package:attendance_management/models/staff.dart' as p51;
import 'package:attendance_management/models/attendee.dart' as p51;
import 'package:attendance_management/models/attendance_log.dart' as p51;
import 'package:attendance_management/models/attendance_register.dart' as p51;
import 'package:inventory_management/models/entities/product_variant.dart' as p52;
import 'package:inventory_management/models/entities/stock_reconciliation.dart' as p52;
import 'package:inventory_management/models/entities/stock.dart' as p52;
import 'package:inventory_management/models/entities/inventory_facility.dart' as p52;
import 'package:inventory_management/models/entities/transaction_reason.dart' as p52;
import 'package:inventory_management/models/entities/transaction_type.dart' as p52;
import 'package:inventory_management/models/entities/project_product_variant.dart' as p52;
import 'package:referral_reconciliation/models/entities/referral_recon_enums.dart' as p53;
import 'package:referral_reconciliation/models/entities/referral_recon_service.dart' as p53;
import 'package:referral_reconciliation/models/entities/referral_recon_service_definition.dart' as p53;
import 'package:referral_reconciliation/models/entities/referral_recon_service_attributes.dart' as p53;
import 'package:referral_reconciliation/models/entities/referral_recon_attributes.dart' as p53;
import 'package:referral_reconciliation/models/entities/h_f_referral.dart' as p53;
import 'package:referral_reconciliation/models/entities/referral_project_facility.dart' as p53;

void initializeMappers() {
  p0.EntityModelMapper.ensureInitialized();
  p0.EntitySearchModelMapper.ensureInitialized();
  p0.AdditionalFieldsMapper.ensureInitialized();
  p0.AdditionalFieldMapper.ensureInitialized();
  p0.ClientAuditDetailsMapper.ensureInitialized();
  p0.AuditDetailsMapper.ensureInitialized();
  p1.AdditionalFieldsTypeMapper.ensureInitialized();
  p2.AddressSearchModelMapper.ensureInitialized();
  p2.AddressModelMapper.ensureInitialized();
  p2.AddressAdditionalFieldsMapper.ensureInitialized();
  p3.AddressTypeMapper.ensureInitialized();
  p4.AttributesSearchModelMapper.ensureInitialized();
  p4.AttributesModelMapper.ensureInitialized();
  p4.AttributesAdditionalFieldsMapper.ensureInitialized();
  p5.BeneficiaryTypeMapper.ensureInitialized();
  p6.BloodGroupMapper.ensureInitialized();
  p7.BoundarySearchModelMapper.ensureInitialized();
  p7.BoundaryModelMapper.ensureInitialized();
  p8.DeliverStrategyTypeMapper.ensureInitialized();
  p9.DocumentSearchModelMapper.ensureInitialized();
  p9.DocumentModelMapper.ensureInitialized();
  p9.DocumentAdditionalFieldsMapper.ensureInitialized();
  p10.DownsyncSearchModelMapper.ensureInitialized();
  p10.DownsyncModelMapper.ensureInitialized();
  p10.DownsyncAdditionalFieldsMapper.ensureInitialized();
  p11.FacilitySearchModelMapper.ensureInitialized();
  p11.FacilityModelMapper.ensureInitialized();
  p11.FacilityAdditionalFieldsMapper.ensureInitialized();
  p12.GenderMapper.ensureInitialized();
  p13.HCMAttendanceLogSearchModelMapper.ensureInitialized();
  p13.HCMAttendanceLogModelMapper.ensureInitialized();
  p14.HCMAttendanceSearchModelMapper.ensureInitialized();
  p14.HCMAttendanceRegisterModelMapper.ensureInitialized();
  p14.HCMAttendanceAdditionalModelMapper.ensureInitialized();
  p15.HcmHFReferralSearchModelMapper.ensureInitialized();
  p15.HcmHFReferralModelMapper.ensureInitialized();
  p15.HFReferralAdditionalFieldsMapper.ensureInitialized();
  p16.HcmInventoryFacilitySearchModelMapper.ensureInitialized();
  p16.HcmInventoryFacilityModelMapper.ensureInitialized();
  p16.HcmInventoryFacilityAdditionalFieldsMapper.ensureInitialized();
  p17.HcmStockSearchModelMapper.ensureInitialized();
  p17.HcmStockModelMapper.ensureInitialized();
  p17.StockAdditionalFieldsMapper.ensureInitialized();
  p18.HcmStockReconciliationSearchModelMapper.ensureInitialized();
  p18.HcmStockReconciliationModelMapper.ensureInitialized();
  p18.StockReconciliationAdditionalFieldsMapper.ensureInitialized();
  p19.HouseholdSearchModelMapper.ensureInitialized();
  p19.HouseholdModelMapper.ensureInitialized();
  p19.HouseholdAdditionalFieldsMapper.ensureInitialized();
  p20.HouseholdMemberSearchModelMapper.ensureInitialized();
  p20.HouseholdMemberModelMapper.ensureInitialized();
  p20.HouseholdMemberAdditionalFieldsMapper.ensureInitialized();
  p21.IdentifierSearchModelMapper.ensureInitialized();
  p21.IdentifierModelMapper.ensureInitialized();
  p21.IdentifierAdditionalFieldsMapper.ensureInitialized();
  p22.IndividualSearchModelMapper.ensureInitialized();
  p22.IndividualModelMapper.ensureInitialized();
  p22.IndividualAdditionalFieldsMapper.ensureInitialized();
  p23.LocalitySearchModelMapper.ensureInitialized();
  p23.LocalityModelMapper.ensureInitialized();
  p23.LocalityAdditionalFieldsMapper.ensureInitialized();
  p24.NameSearchModelMapper.ensureInitialized();
  p24.NameModelMapper.ensureInitialized();
  p24.NameAdditionalFieldsMapper.ensureInitialized();
  p25.ProductSearchModelMapper.ensureInitialized();
  p25.ProductModelMapper.ensureInitialized();
  p25.ProductAdditionalFieldsMapper.ensureInitialized();
  p26.ProductVariantSearchModelMapper.ensureInitialized();
  p26.ProductVariantModelMapper.ensureInitialized();
  p26.ProductVariantAdditionalFieldsMapper.ensureInitialized();
  p27.ProjectSearchModelMapper.ensureInitialized();
  p27.ProjectModelMapper.ensureInitialized();
  p27.ProjectAdditionalFieldsMapper.ensureInitialized();
  p27.ProjectAdditionalDetailsMapper.ensureInitialized();
  p28.ProjectBeneficiarySearchModelMapper.ensureInitialized();
  p28.ProjectBeneficiaryModelMapper.ensureInitialized();
  p28.ProjectBeneficiaryAdditionalFieldsMapper.ensureInitialized();
  p29.ProjectFacilitySearchModelMapper.ensureInitialized();
  p29.ProjectFacilityModelMapper.ensureInitialized();
  p29.ProjectFacilityAdditionalFieldsMapper.ensureInitialized();
  p30.ProjectProductVariantSearchModelMapper.ensureInitialized();
  p30.ProjectProductVariantModelMapper.ensureInitialized();
  p30.ProjectProductVariantAdditionalFieldsMapper.ensureInitialized();
  p31.ProjectResourceSearchModelMapper.ensureInitialized();
  p31.ProjectResourceModelMapper.ensureInitialized();
  p31.ProjectResourceAdditionalFieldsMapper.ensureInitialized();
  p32.ProjectStaffSearchModelMapper.ensureInitialized();
  p32.ProjectStaffModelMapper.ensureInitialized();
  p32.ProjectStaffAdditionalFieldsMapper.ensureInitialized();
  p33.ProjectTypeModelMapper.ensureInitialized();
  p33.ProjectTypeAdditionalFieldsMapper.ensureInitialized();
  p33.ProjectCycleMapper.ensureInitialized();
  p33.ProjectCycleDeliveryMapper.ensureInitialized();
  p33.DeliveryDoseCriteriaMapper.ensureInitialized();
  p33.DeliveryProductVariantMapper.ensureInitialized();
  p34.ReferralSearchModelMapper.ensureInitialized();
  p34.ReferralModelMapper.ensureInitialized();
  p34.ReferralAdditionalFieldsMapper.ensureInitialized();
  p35.RolesMapper.ensureInitialized();
  p36.RolesTypeMapper.ensureInitialized();
  p37.ScannerTypeMapper.ensureInitialized();
  p38.ServiceSearchModelMapper.ensureInitialized();
  p38.ServiceModelMapper.ensureInitialized();
  p38.ServiceAdditionalFieldsMapper.ensureInitialized();
  p39.ServiceAttributesSearchModelMapper.ensureInitialized();
  p39.ServiceAttributesModelMapper.ensureInitialized();
  p39.ServiceAttributesAdditionalFieldsMapper.ensureInitialized();
  p40.ServiceDefinitionSearchModelMapper.ensureInitialized();
  p40.ServiceDefinitionModelMapper.ensureInitialized();
  p40.ServiceDefinitionAdditionalFieldsMapper.ensureInitialized();
  p41.SideEffectSearchModelMapper.ensureInitialized();
  p41.SideEffectModelMapper.ensureInitialized();
  p41.SideEffectAdditionalFieldsMapper.ensureInitialized();
  p42.StatusMapper.ensureInitialized();
  p43.TargetSearchModelMapper.ensureInitialized();
  p43.TargetModelMapper.ensureInitialized();
  p43.TargetAdditionalFieldsMapper.ensureInitialized();
  p44.TaskSearchModelMapper.ensureInitialized();
  p44.TaskModelMapper.ensureInitialized();
  p44.TaskAdditionalFieldsMapper.ensureInitialized();
  p45.TaskResourceSearchModelMapper.ensureInitialized();
  p45.TaskResourceModelMapper.ensureInitialized();
  p45.TaskResourceAdditionalFieldsMapper.ensureInitialized();
  p46.UserSearchModelMapper.ensureInitialized();
  p46.UserModelMapper.ensureInitialized();
  p46.UserAdditionalFieldsMapper.ensureInitialized();
  p47.OpLogEntryMapper.ensureInitialized();
  p47.AdditionalIdMapper.ensureInitialized();
  p47.DataOperationMapper.ensureInitialized();
  p47.ApiOperationMapper.ensureInitialized();
  p48.PgrAddressModelMapper.ensureInitialized();
  p48.GeoLocationMapper.ensureInitialized();
  p49.PgrComplaintModelMapper.ensureInitialized();
  p49.PgrComplainantModelMapper.ensureInitialized();
  p49.PgrRolesModelMapper.ensureInitialized();
  p49.PgrServiceSearchModelMapper.ensureInitialized();
  p49.PgrServiceModelMapper.ensureInitialized();
  p49.PgrWorkflowModelMapper.ensureInitialized();
  p49.PgrFiltersMapper.ensureInitialized();
  p49.PgrSearchKeysMapper.ensureInitialized();
  p49.PgrAdditionalDetailsMapper.ensureInitialized();
  p49.PgrServiceApplicationStatusMapper.ensureInitialized();
  p50.PgrServiceCreateResponseModelMapper.ensureInitialized();
  p50.PgrComplaintResponseModelMapper.ensureInitialized();
  p50.PgrComplainantResponseModelMapper.ensureInitialized();
  p50.PgrServiceResponseModelMapper.ensureInitialized();
p51.AttendanceAuditDetailsMapper.ensureInitialized();
p51.StaffModelMapper.ensureInitialized();
p51.AttendeeModelMapper.ensureInitialized();
p51.AttendanceLogModelMapper.ensureInitialized();
p51.AttendanceRegisterModelMapper.ensureInitialized();
p52.ProductVariantModelMapper.ensureInitialized();
p52.StockReconciliationModelMapper.ensureInitialized();
p52.StockModelMapper.ensureInitialized();
p52.InventoryFacilityModelMapper.ensureInitialized();
p52.TransactionReasonMapper.ensureInitialized();
p52.TransactionTypeMapper.ensureInitialized();
p52.ProjectProductVariantModelMapper.ensureInitialized();
p53.ReferralReconEnumsMapper.ensureInitialized();
p53.ReferralReconServiceModelMapper.ensureInitialized();
p53.ReferralReconServiceDefinitionModelMapper.ensureInitialized();
p53.ReferralReconServiceAttributesModelMapper.ensureInitialized();
p53.ReferralReconAttributesModelMapper.ensureInitialized();
p53.HFReferralModelMapper.ensureInitialized();
p53.ReferralProjectFacilityModelMapper.ensureInitialized();
}
