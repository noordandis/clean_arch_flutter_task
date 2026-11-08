import 'package:clean_arch_flutter_task/core/di/injection.dart';
import 'package:clean_arch_flutter_task/features/product/presentation/cubit/product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/product/presentation/screens/home_screen.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => getIt<ProductCubit>()..fetchProducts(),
        child: const HomeScreen(),
      ),
    );
  }
}