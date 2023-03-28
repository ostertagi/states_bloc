import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:states_bloc/blocs/app_bloc.dart';
import 'package:states_bloc/core/app_router.dart';
import 'package:states_bloc/core/keys.dart';
import 'package:states_bloc/pages/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: AppBloc.providers,
      //providers: AppBloc.getInstance().getProviders(context),  //[
      //   appBloc.getProviders(context)
      // BlocProvider<NavigateBloc>(
      //   create: (BuildContext context) =>
      //       NavigateBloc(navigatorKey: Keys.navKey),
      // ),
      // BlocProvider<RequestBloc>(
      //   create: (BuildContext context) => RequestBloc(),
      // ),
      // BlocProvider<SlideBloc>(
      //   create: (BuildContext context) => SlideBloc(),
      // ),
      // BlocProvider<TextBloc>(
      //   create: (BuildContext context) => TextBloc(
      //     slideBloc: context.read<SlideBloc>(),
      //   ),
      // ),
      //],
      child: MaterialApp(
        navigatorKey: Keys.navKey,
        initialRoute: HomePage.routeName,
        onGenerateRoute: AppRouter.generateRoute,
      ),
    );
  }
}
