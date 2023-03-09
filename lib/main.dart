import 'package:ecommerce_api/constants/size_config.dart';
import 'package:ecommerce_api/constants/theme.dart';
import 'package:ecommerce_api/cubits/desc.page.cubit/desc.page.cubit.dart';
import 'package:ecommerce_api/cubits/getdata/getdata.cubit.dart';
import 'package:ecommerce_api/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<DataCubit>(
          create: (context) => DataCubit(),
        ),
        BlocProvider<DescriptionCubit>(
          create: (context) => DescriptionCubit(),
        )
      ],
      child: MaterialApp(
        theme: AppTheme().getThemeData(),
        onGenerateRoute: AppRouter().getRoutes,
        initialRoute: "/home",
      ),
    );
  }
}
