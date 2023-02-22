import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_today/app/app.dart';
import 'package:test_today/presentation/cubit/data_cubit/data_cubit.dart';

class AppProvider extends StatelessWidget {
  const AppProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<DataCubit>(
          create: (context) => DataCubit()..getData(),
        ),
      ],
      child: const AppWidget(),
    );
  }
}
