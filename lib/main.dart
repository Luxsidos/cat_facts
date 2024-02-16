import 'dart:async';
import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_cat/assets/colors/colors.dart';
import 'package:task_cat/core/singletons/service_locator.dart';
import 'package:task_cat/features/common/controllers/internet_bloc/internet_bloc.dart';
import 'package:task_cat/features/common/controllers/show_pop_up/show_pop_up_bloc.dart';
import 'package:task_cat/features/home/presentation/controller/bloc/home_bloc.dart';
import 'package:task_cat/features/home/presentation/view/home_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  runApp(const AppProvider());
}

class AppProvider extends StatefulWidget {
  const AppProvider({Key? key}) : super(key: key);

  @override
  State<AppProvider> createState() => _AppProviderState();
}

class _AppProviderState extends State<AppProvider> {
  late InternetBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = InternetBloc();
  }

  @override
  Widget build(BuildContext context) => BlocProvider.value(
        value: bloc,
        child: const MyApp(),
      );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late StreamSubscription streamSubscription;
  InternetBloc bloc = InternetBloc();

  @override
  void initState() {
    bloc = InternetBloc();
    streamSubscription = Connectivity().onConnectivityChanged.listen((status) {
      bloc.add(GlobalCheck(
          isConnected: status == ConnectivityResult.mobile || status == ConnectivityResult.wifi || status == ConnectivityResult.ethernet));
      log('app log: status ${status == ConnectivityResult.mobile || status == ConnectivityResult.wifi}');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HomeBloc()),
        BlocProvider(create: (context) => ShowPopUpBloc())
      ],
      child: MaterialApp(
        title: 'task',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          scaffoldBackgroundColor: white,
          primarySwatch: Colors.blue,
          dividerColor: Colors.transparent,
          colorScheme: ColorScheme.fromSeed(seedColor: blue),
          appBarTheme: AppBarTheme(
            toolbarHeight: 64,
            iconTheme: const IconThemeData(color: dark),
            titleTextStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: dark),
            backgroundColor: size.width >= 601 ? Colors.transparent : white,
            elevation: 0,
          ),
        ),
        home: const HomeView(),
      ),
    );
  }
}
