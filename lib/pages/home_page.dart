import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:states_bloc/blocs/text/text_bloc.dart';
import 'package:states_bloc/common/message_notifier.dart';
import 'package:states_bloc/pages/drawer_menu.dart';

const kAppTitle = 'States by Redux';
const kStateType = '...';

class HomePage extends StatelessWidget {
  static const routeName = '/';
  String text = lorem(paragraphs: 3, words: 50);

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TextBloc, TextState>(
      builder: (context, state) {
        return MessageNotifier(
          child: Scaffold(
            appBar: AppBar(
              title: const Text(kAppTitle),
              backgroundColor: Colors.teal,
            ),
            drawer: const DrawerMenu(),
            body: Container(
              margin: const EdgeInsets.all(10),
              child: RichText(
                text: TextSpan(
                  text: text,
                  style: TextStyle(
                      fontSize: state.fontSize,
                      color: Colors.black,
                      fontWeight:
                          state.bold ? FontWeight.bold : FontWeight.normal,
                      fontStyle:
                          state.italic ? FontStyle.italic : FontStyle.normal),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
