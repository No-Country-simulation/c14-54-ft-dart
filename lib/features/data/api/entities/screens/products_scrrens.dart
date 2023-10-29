import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gestion_inventario/features/data/api/entities/screens/listproduct.dart';
import 'package:gestion_inventario/features/home/presentation/providers/pruduct_providers.dart';

class HomeView extends ConsumerStatefulWidget {
  static const route = 'H';
  const HomeView({super.key});

  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends ConsumerState<HomeView>
    with AutomaticKeepAliveClientMixin {
  get urlcsv => null;

  @override
  void initState() {
    super.initState();

    String urlcsv = "http://bit.ly/3Sc2v46";
    ref.read(searchedMoviesProvider.notifier).searchMoviesByQuery(urlcsv);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    final nowPlayingMovies = ref.watch(searchedMoviesProvider);

    return HomePage(
      listdat: nowPlayingMovies,
    );
  }

  @override
  bool get wantKeepAlive => true;
}
