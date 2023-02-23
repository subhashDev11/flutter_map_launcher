import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:test_today/presentation/cubit/data_cubit/data_cubit.dart';

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
        _launchMap(state);
      },
      listenWhen: (prev, next) =>
          (next.currentPosition != null && next.destAddress != null && next.destPosition != null),
      builder: (_, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Map Launcher'),
          ),
          body: Center(
            child: InkWell(
              onTap: state.launchStatus == LaunchStatus.launched
                  ? () {
                      if (state.launchStatus == LaunchStatus.launched) {
                        _launchMap(state);
                      }
                    }
                  : null,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                      _launchStatusTitle(state.launchStatus),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
