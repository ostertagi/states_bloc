import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:states_bloc/blocs/text/text_bloc.dart';
import 'package:states_bloc/pages/drawer_menu.dart';

class AboutPage extends StatelessWidget {
  static const routeName = '/about';
  String text = lorem(paragraphs: 3, words: 50);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TextBloc, TextState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('About'),
            backgroundColor: Colors.teal,
          ),
          drawer: const DrawerMenu(),
          body: Container(
            margin: const EdgeInsets.all(10.0),
            child: RichText(
              text: TextSpan(
                text: text,
                style: TextStyle(
                    fontSize: state.fontSize,
                    color: Colors.lightBlue,
                    fontWeight:
                        state.bold ? FontWeight.bold : FontWeight.normal,
                    fontStyle:
                        state.italic ? FontStyle.italic : FontStyle.normal),
              ),
            ),
          ),
        );
      },
    );
  }
}

/*
  Widget build(BuildContext context) {
    return BlocBuilder<MyFirstBloc, MyFirstBlocState>(
      builder: (context, myFirstBlocState) =>
          BlocBuilder<MySecondBloc, MySecondBlocState>(
        builder: (context, secondBlocState) {
          //return widget based on the states of both blocs...
        },
      ),
    );
  }
*/