import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'bloc/bloc.dart';
import '../presentation.dart';
import 'widgets/widget_loading.dart';
import 'widgets/widget_welcome.dart';

export 'bloc/bloc.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({Key? key}) : super(key: key);

  @override
  _NavigationScreenState createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen>
    with WidgetResponsiveBuilder<NavigationState> {
  @override
  void initState() {
    super.initState();
    Get.find<NavigationBloc>().add(NavigationLoaded());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _buildBody());
  }

  Widget _buildBody() {
    return BlocConsumer<NavigationBloc, NavigationState>(
        bloc: Get.find<NavigationBloc>(),
        listener: (_, state) {
          log('listener: $state');
        },
        builder: (_, state) {
          return buildUi(context: context, state: state);
        });
  }

  @override
  Widget buildMobile(BuildContext context, NavigationState state) {
    if (state is NavigationLoadInProgress) return WidgetLoading();
    if (state is NavigationLoadSuccess) return WidgetWelcome();
    return Center(
      child: Text('Not state'),
    );
  }
}
