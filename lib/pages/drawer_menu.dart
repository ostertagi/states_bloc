import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:states_bloc/blocs/navigate/navigate_bloc.dart';
import 'package:states_bloc/blocs/text/text_bloc.dart';
import 'package:states_bloc/pages/about_page.dart';
import 'package:states_bloc/pages/home_page.dart';
import 'package:states_bloc/pages/settings_page.dart';

const kTitle = 'Bloc';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TextBloc, TextState>(
      builder: (context, state) {
        return Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: const BoxDecoration(
                  color: Colors.teal,
                ),
                child: Center(
                  child: Text(
                    kTitle,
                    style: TextStyle(
                      fontSize:
                          Theme.of(context).textTheme.titleLarge!.fontSize,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              getListTile('Home', onTap: () {
                //Navigator.pushReplacementNamed(context, '/');
                BlocProvider.of<NavigateBloc>(context)
                    .add(const GoToPageEvent(route: HomePage.routeName));
              }),
              getLine(),
              getListTile('About', onTap: () {
                //Navigator.pushReplacementNamed(context, '/about');
                BlocProvider.of<NavigateBloc>(context)
                    .add(const GoToPageEvent(route: AboutPage.routeName));
              }),
              getLine(),
              getListTile('Settings', onTap: () {
                //Navigator.pushReplacementNamed(context, '/settings');
                BlocProvider.of<NavigateBloc>(context)
                    .add(const GoToPageEvent(route: SettingsPage.routeName));
                //viewModel.navigateCallback(SettingsPage.routeName);
              }),
              //viewModel.loading ? const CircularProgressIndicator(): const Center(),
            ],
          ),
        );
      },
    );
  }

  Widget getLine() {
    return SizedBox(
      height: 0.5,
      child: Container(
        color: Colors.grey,
      ),
    );
  }

  Widget getListTile(title, {Function()? onTap}) {
    return ListTile(
      title: Text(title),
      onTap: onTap,
    );
  }
}
