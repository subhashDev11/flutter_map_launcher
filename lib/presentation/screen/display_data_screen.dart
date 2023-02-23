import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:test_today/core/app_extensions.dart';
import 'package:test_today/presentation/cubit/data_cubit/data_cubit.dart';
import 'package:test_today/presentation/widgets/common/common_widgets.dart';

import '../../core/app_enums.dart';

class DisplayScreen extends StatefulWidget {
  const DisplayScreen({Key? key}) : super(key: key);

  @override
  State<DisplayScreen> createState() => _DisplayScreenState();
}

class _DisplayScreenState extends State<DisplayScreen> {
  late DataCubit dataCubit;

  @override
  void initState() {
    // TODO: implement initState
    dataCubit = context.read<DataCubit>();
    dataCubit.init();
    super.initState();
  }

  void _launchMap(state) {
    if (state.destPosition != null && state.currentPosition != null) {
      MapLauncher.showDirections(
        mapType: MapType.google,
        destination: Coords(state.destPosition!.latitude, state.destPosition!.longitude),
        origin: Coords(state.currentPosition!.latitude, state.currentPosition!.longitude),
      ).onError((error, stackTrace) {
        dataCubit.changeLaunchStatus(
          LaunchStatus.error,
        );
      }).then((value) => dataCubit.changeLaunchStatus(
            LaunchStatus.launched,
          ));
    }
  }

  String _launchStatusTitle(LaunchStatus state) {
    switch (state) {
      case LaunchStatus.launching:
        return 'Launching map';
      case LaunchStatus.launched:
        return 'Re-launch Map';
      case LaunchStatus.loading:
        return 'Loading address information';
      case LaunchStatus.error:
        return 'Map not found, please install google map';
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DataCubit, DataState>(
      listener: (_, state) {
        // _launchMap(state);
      },
      listenWhen: (prev, next) =>
          (next.currentPosition != null && next.destAddress != null && next.destPosition != null),
      builder: (_, state) {
        return ScreenContainer(
          title: 'Location',
          appBarElevation: 10,
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (state.launchStatus == LaunchStatus.loading)
                const CupertinoActivityIndicator()
              else
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(25),
                      child: Text(
                        'Live location - ${state.currentAddress ?? ''}',
                        textAlign: TextAlign.center,
                        style: context.getTheme().textTheme.titleMedium?.copyWith(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        _launchMap(state);
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 15,
                        ),
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(10),
                          color: context.getTheme().primaryColor,
                        ),
                        child: Text(
                          'Get Direction',
                          style: context.getTheme().textTheme.titleMedium?.copyWith(
                                color: Colors.white,
                              ),
                        ),
                      ),
                    ),
                  ],
                )
            ],
          )),
        );
      },
    );
  }
}
