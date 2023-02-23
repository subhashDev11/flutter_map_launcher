import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_today/app/app.dart';
import 'package:test_today/core/core.dart';
import 'presentation/cubit/data_cubit/data_cubit.dart';

void main() {
  locator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (_) => DataCubit(), child: const AppWidget());
  }
}
