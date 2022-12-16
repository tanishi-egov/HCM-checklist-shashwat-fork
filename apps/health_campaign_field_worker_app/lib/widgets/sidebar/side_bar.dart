import 'package:digit_components/digit_components.dart';
import 'package:digit_components/models/digit_row_card/digit_row_card_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../blocs/app_config/app_config.dart';
import '../../models/app_config/app_config_model.dart';

class SideBar extends StatelessWidget {
  const SideBar({super.key});
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ScrollableContent(
      footer: const PoweredByDigit(),
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height / 3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Carlos',
                style: theme.textTheme.displayMedium,
              ),
              Text(
                '+258 6387387',
                style: theme.textTheme.labelSmall,
              ),
            ],
          ),
        ),
        DigitIconTile(
          title: 'Home',
          icon: Icons.home,
          onPressed: () {},
        ),
        DigitIconTile(
          title: 'Language',
          icon: Icons.language,
          content: Padding(
            padding: const EdgeInsets.only(top: 16),
            child: BlocBuilder<ApplicationConfigBloc, ApplicationConfigState>(
              builder: (context, state) {
                List<Languages>? languageList =
                    state.appConfigDetail?.configuration?.appConfig.languages;

                return state.appConfigDetail?.configuration?.appConfig
                            .languages !=
                        null
                    ? DigitRowCard(
                        onPressed: (data) {},
                        list: languageList
                            ?.map((e) => DigitRowCardModel.fromJson(e.toJson()))
                            .toList() as List<DigitRowCardModel>,
                        width: (MediaQuery.of(context).size.width *
                                0.5 /
                                languageList!.length) -
                            (4 * languageList.length),
                      )
                    : const Text('');
              },
            ),
          ),
          onPressed: () {},
        ),
        DigitIconTile(
          title: 'Logout',
          icon: Icons.logout,
          onPressed: () {},
        ),
      ],
    );
  }
}
