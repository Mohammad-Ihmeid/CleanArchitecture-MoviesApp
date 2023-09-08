import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/movies/presentation/controller/movies_bloc.dart';
import 'package:movies_app/movies/presentation/controller/movies_event.dart';
import 'package:movies_app/movies/presentation/controller/movies_state.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (BuildContext context) {
      return MoviesBloc()..add(GetNowPlayingEvent());
    }, child: BlocBuilder<MoviesBloc, MoviesState>(builder: (context, state) {
      return const Scaffold();
    }));
  }
}