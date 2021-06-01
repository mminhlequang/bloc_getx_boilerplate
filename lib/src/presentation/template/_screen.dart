// import 'dart:developer';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:get/get.dart';
// import 'bloc/bloc.dart';
// import '../presentation.dart';
//
// export 'bloc/bloc.dart';
//
// class Screen extends StatefulWidget {
//   const Screen({Key? key}) : super(key: key);
//
//   @override
//   _ScreenState createState() => _ScreenState();
// }
//
// class _ScreenState extends State<Screen>
//     with WidgetResponsiveBuilder<State> {
//   @override
//   void initState() {
//     super.initState();
//     Get.find<Bloc>().add(Loaded());
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(body: _buildBody());
//   }
//
//   Widget _buildBody() {
//     return BlocConsumer<Bloc, State>(listener: (_, state) {
//       log('listener: $state');
//     }, builder: (_, state) {
//       return buildUi(context: context, state: state);
//     });
//   }
//
//   @override
//   Widget buildMobile(BuildContext context, State state) {
//     if (state is LoadInProgress) return SizedBox();
//     if (state is LoadSuccess) return SizedBox();
//     return Center(
//       child: Text('Not state'),
//     );
//   }
// }
