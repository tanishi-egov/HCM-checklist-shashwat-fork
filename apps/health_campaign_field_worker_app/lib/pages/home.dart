import 'package:digit_components/digit_components.dart';
import 'package:digit_components/widgets/digit_sync_dialog.dart';
import 'package:drift_db_viewer/drift_db_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/sync/sync.dart';
import '../data/data_repository.dart';
import '../data/local_store/sql_store/sql_store.dart';
import '../data/network_manager.dart';
import '../data/repositories/local/household.dart';
import '../data/repositories/local/houshold_member.dart';
import '../data/repositories/local/individual.dart';
import '../data/repositories/local/project_beneficiary.dart';
import '../data/repositories/remote/household.dart';
import '../data/repositories/remote/household_member.dart';
import '../data/repositories/remote/individual.dart';
import '../data/repositories/remote/project_beneficiary.dart';
import '../models/entities/household.dart';
import '../models/entities/household_member.dart';
import '../models/entities/individual.dart';
import '../models/entities/project_beneficiary.dart';
import '../router/app_router.dart';
import '../utils/i18_key_constants.dart' as i18;
import '../widgets/header/back_navigation_help_header.dart';
import '../widgets/home/home_item_card.dart';
import '../widgets/localized.dart';
import '../widgets/progress_indicator/progress_indicator.dart';

class HomePage extends LocalizedStatefulWidget {
  const HomePage({
    super.key,
    super.appLocalizations,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends LocalizedState<HomePage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: ScrollableContent(
        slivers: [
          SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (context, index) => _getItems(context).elementAt(index),
              childCount: _getItems(context).length,
            ),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 145,
              childAspectRatio: 104 / 128,
            ),
          ),
        ],
        header: Column(
          children: [
            const BackNavigationHelpHeaderWidget(
              showBackNavigation: false,
            ),
            ProgressIndicatorContainer(
              label: localizations.translate(
                i18.home.progressIndicatorTitle,
              ),
              prefixLabel: localizations.translate(
                i18.home.progressIndicatorPrefixLabel,
              ),
              suffixLabel: '200',
              value: .08,
            ),
          ],
        ),
        footer: const PoweredByDigit(),
        children: [
          const SizedBox(height: kPadding * 2),
          BlocConsumer<SyncBloc, SyncState>(
            listener: (context, state) {
              state.maybeWhen(
                orElse: () => null,
                syncInProgress: () => DigitSyncDialogContent.show(
                  context,
                  type: DigitSyncDialogType.inProgress,
                  // TODO: Localization pending
                  label: 'Sync in Progress', barrierDismissible: false,
                ),
              );
            },
            builder: (context, state) {
              return state.maybeWhen(
                orElse: () => const Offstage(),
                pendingSync: (count) => DigitInfoCard(
                  icon: Icons.info,
                  backgroundColor: theme.colorScheme.tertiaryContainer,
                  iconColor: theme.colorScheme.surfaceTint,
                  description: localizations
                      .translate(i18.home.dataSyncInfoContent)
                      .replaceAll('{}', count.toString()),
                  title: localizations.translate(i18.home.dataSyncInfoLabel),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  List<HomeItemCard> _getItems(BuildContext context) {
    return [
      HomeItemCard(
        icon: Icons.all_inbox,
        label: i18.home.beneficiaryLabel,
        onPressed: () => context.router.push(SearchBeneficiaryRoute()),
      ),
      HomeItemCard(
        icon: Icons.menu_book,
        label: i18.home.viewReportsLabel,
        onPressed: null,
      ),
      HomeItemCard(
        icon: Icons.announcement,
        label: i18.home.fileComplaint,
        onPressed: null,
      ),
      HomeItemCard(
        icon: Icons.sync_alt,
        label: i18.home.syncDataLabel,
        onPressed: () async {
          context.read<SyncBloc>().add(
                SyncSyncUpEvent(
                  localRepositories: [
                    context.read<IndividualLocalRepository>(),
                    context.read<HouseholdLocalRepository>(),
                    context.read<HouseholdMemberLocalRepository>(),
                    context.read<ProjectBeneficiaryLocalRepository>(),
                  ],
                  remoteRepositories: [
                    context.read<IndividualRemoteRepository>(),
                    context.read<HouseholdRemoteRepository>(),
                    context.read<HouseholdMemberRemoteRepository>(),
                    context.read<ProjectBeneficiaryRemoteRepository>(),
                  ],
                ),
              );

          return;
          final dialogContext = context;
          final networkManager = context.read<NetworkManager>();
          final individualLocal = context
              .read<LocalRepository<IndividualModel, IndividualSearchModel>>();
          final individualRemote = context
              .read<RemoteRepository<IndividualModel, IndividualSearchModel>>();

          final householdLocal = context
              .read<LocalRepository<HouseholdModel, HouseholdSearchModel>>();
          final householdRemote = context
              .read<RemoteRepository<HouseholdModel, HouseholdSearchModel>>();

          final householdMemberLocal = context.read<
              LocalRepository<HouseholdMemberModel,
                  HouseholdMemberSearchModel>>();
          final householdMemberRemote = context.read<
              RemoteRepository<HouseholdMemberModel,
                  HouseholdMemberSearchModel>>();

          final projectBeneficiaryLocal = context.read<
              LocalRepository<ProjectBeneficiaryModel,
                  ProjectBeneficiarySearchModel>>();
          final projectBeneficiaryRemote = context.read<
              RemoteRepository<ProjectBeneficiaryModel,
                  ProjectBeneficiarySearchModel>>();

          networkManager.syncUp(
            localRepositories: [
              individualLocal,
              householdLocal,
              householdMemberLocal,
              projectBeneficiaryLocal,
            ],
            remoteRepositories: [
              individualRemote,
              householdRemote,
              householdMemberRemote,
              projectBeneficiaryRemote,
            ],
          );

          // await Future.delayed(Duration(milliseconds: 250));
          Navigator.of(context, rootNavigator: true).pop();

          // Navigator.pop(dialogContext);
        },
      ),
      HomeItemCard(
        icon: Icons.call,
        label: i18.home.callbackLabel,
        onPressed: null,
      ),
      HomeItemCard(
        icon: Icons.table_chart,
        label: 'DB',
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => DriftDbViewer(
                context.read<LocalSqlDataStore>(),
              ),
            ),
          );
        },
      ),
    ];
  }
}
