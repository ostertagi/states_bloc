import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:states_bloc/blocs/slide/slide_bloc.dart';
import 'package:states_bloc/pages/drawer_menu.dart';

import '../blocs/text/text_bloc.dart';

class SettingsPage extends StatelessWidget {
  static const routeName = '/settings';

  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TextBloc, TextState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.teal,
            title: const Text('Settings'),
          ),
          drawer: const DrawerMenu(),
          //input and output
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 20),
                child: Text(
                  'Font Size: ${state.fontSize.toInt()}',
                  style: TextStyle(
                      fontSize:
                          Theme.of(context).textTheme.displayLarge!.fontSize),
                ),
              ),
              BlocBuilder<SlideBloc, SlideState>(
                  builder: (context, sliderState) {
                return Slider(
                    min: 0.5,
                    value: sliderState.slider,
                    onChanged: (newVal) {
                      BlocProvider.of<SlideBloc>(context)
                          .add(ChangeSlideEvent(newVal));
                    });
              }),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  children: <Widget>[
                    Checkbox(
                      value: state.bold,
                      onChanged: (newVal) {
                        BlocProvider.of<TextBloc>(context)
                            .add(BoldTextEvent(newVal!));
                      },
                    ),
                    Text(
                      'Bold',
                      style: getStyle(
                        state.fontSize,
                        state.bold,
                        false,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  children: <Widget>[
                    Checkbox(
                        value: state.italic,
                        onChanged: (newVal) {
                          BlocProvider.of<TextBloc>(context)
                              .add(ItalicTextEvent(newVal!));
                        }),
                    Text(
                      'Italic',
                      style: getStyle(
                        state.fontSize,
                        false,
                        state.italic,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  TextStyle getStyle(
      [double size = 18, bool isBold = false, bool isItalic = false]) {
    return TextStyle(
      fontSize: size,
      fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
      fontStyle: isItalic ? FontStyle.italic : FontStyle.normal,
    );
  }
}

/*
 return StoreConnector<AppState, SettingsViewModel>(
        //converter: (store) => store.state,
        converter: (store) {
      return new SettingsViewModel(
        slider: store.state.sliderState.slider,
        fontSize: store.state.textState.fontSize,
        bold: store.state.textState.bold,
        italic: store.state.textState.italic,
        sliderCallback: ((newValue) =>
            store.dispatch(new SliderAction(newValue))),
        boldCallback: ((newValue) => store.dispatch(new BoldAction(newValue))),
        italicCallback: ((newValue) =>
            store.dispatch(new ItalicAction(newValue))),
      );
    }, builder: (context, viewModel) {
      return ;
    });*/