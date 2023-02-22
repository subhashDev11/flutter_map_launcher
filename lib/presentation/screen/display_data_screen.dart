import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_geocoder/geocoder.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:test_today/presentation/cubit/data_cubit/data_cubit.dart';

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

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DataCubit, DataState>(
      listener: (_, state) {
        if (state.destPosition != null && state.currentPosition != null) {
          MapLauncher.showDirections(
            mapType: MapType.google,
            destination: Coords(state.destPosition!.latitude, state.destPosition!.longitude),
            origin: Coords(state.currentPosition!.latitude, state.currentPosition!.longitude),
          );
        }
      },
      listenWhen: (prev, next) =>
          (next.currentPosition != null && next.destAddress != null && next.destPosition != null),
      builder: (_, state) {
        return Scaffold(
          appBar: AppBar(),
          body: const Center(
            child: Center(
              child: CupertinoActivityIndicator(
                radius: 25,
              ),
            ),
          ),
        );
      },
    );
  }
}
