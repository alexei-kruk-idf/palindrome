import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:presentation/home_screen/bloc/base/base_bloc.dart';

abstract class BlocState<S extends StatefulWidget, B extends BaseBloc>
    extends State<S> {
  @protected
  final B homeBloc = GetIt.I.get<B>();
}
