import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../bloc/code_import/code_import_bloc.dart';
import '../bloc/code_import/code_import_state.dart';
import '../model/card_affiliation.dart';

class SpymasterScreen extends StatelessWidget {
  static const Color neutralColor = Color.fromARGB(255, 245, 230, 200);
  static final Color redColor = Colors.red[400];
  static final Color blueColor = Colors.blue[400];
  static const Color assassinColor = Colors.black;

  static const Color iconColor = Color.fromARGB(100, 0, 0, 0);
  static const Color iconColorLight = Colors.white;

  static const double gridSpacing = 0;
  static const double tileCornerRadius = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<CodeImportBloc, CodeImportState>(
          bloc: BlocProvider.of<CodeImportBloc>(context),
          builder: (var context, state) {
            if (state is CodeImportStateValid) {
              return _buildBoard(context, state);
            } else if (state is CodeImportStateInvalid) {
              return _buildInvalid(context);
            } else {
              throw FallThroughError();
            }
          }),
    );
  }

  Widget _buildInvalid(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('No game data found'),
        OutlinedButton(
            child: Text('Back'), onPressed: () => Navigator.of(context).pop()),
      ],
    ));
  }

  Widget _buildBoard(BuildContext context, CodeImportStateValid state) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(5),
        child: AspectRatio(
          aspectRatio: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: state.list
                      .take(5)
                      .map((aff) => _tileBuilder(context, aff))
                      .toList(),
                ),
              ),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: state.list
                      .skip(5)
                      .take(5)
                      .map((aff) => _tileBuilder(context, aff))
                      .toList(),
                ),
              ),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: state.list
                      .skip(10)
                      .take(5)
                      .map((aff) => _tileBuilder(context, aff))
                      .toList(),
                ),
              ),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: state.list
                      .skip(15)
                      .take(5)
                      .map((aff) => _tileBuilder(context, aff))
                      .toList(),
                ),
              ),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: state.list
                      .skip(20)
                      .take(5)
                      .map((aff) => _tileBuilder(context, aff))
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _tileBuilder(BuildContext context, CardAffiliation aff) {
    switch (aff) {
      case CardAffiliation.neutral:
        return Expanded(
          child: Padding(
            padding: EdgeInsets.all(gridSpacing),
            child: Card(
              color: neutralColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(tileCornerRadius)),
            ),
          ),
        );
      case CardAffiliation.red:
        return Expanded(
          child: Padding(
            padding: EdgeInsets.all(gridSpacing),
            child: Card(
              color: redColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(tileCornerRadius)),
            ),
          ),
        );
      case CardAffiliation.blue:
        return Expanded(
          child: Padding(
            padding: EdgeInsets.all(gridSpacing),
            child: Card(
              color: blueColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(tileCornerRadius)),
            ),
          ),
        );
      case CardAffiliation.assassin:
        return Expanded(
          child: Padding(
            padding: EdgeInsets.all(gridSpacing),
            child: Card(
              color: assassinColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(tileCornerRadius)),
            ),
          ),
        );
      default:
        throw FallThroughError();
    }
  }
}
