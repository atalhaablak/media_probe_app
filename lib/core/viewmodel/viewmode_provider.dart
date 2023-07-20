import 'package:flutter/material.dart';
import 'package:media_probe_app/core/init/injection.dart';
import 'package:media_probe_app/core/viewmodel/base_viewmodel.dart';
import 'package:provider/provider.dart';

class ViewModelProvider<T extends BaseViewModel> extends StatelessWidget {
  final Widget Function(T viewModel) builder;
  const ViewModelProvider({Key? key, required this.builder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>.value(
      value: serviceLocator<T>(),
      child: Builder(
        builder: (BuildContext buildContext) {
          return builder(buildContext.read<T>());
        },
      ),
    );
  }
}

class ViewModelProviderWithoutLocator<T extends BaseViewModel> extends StatelessWidget {
  final Widget Function(T viewModel) builder;
  final Create<T> create;
  const ViewModelProviderWithoutLocator({Key? key, required this.builder, required this.create}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
      create: create,
      child: Builder(
        builder: (BuildContext buildContext) {
          return builder(buildContext.read<T>());
        },
      ),
    );
  }
}
