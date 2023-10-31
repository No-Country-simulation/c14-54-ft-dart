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

    final urlcsv = ref.read(searchQueryProvider.notifier);
    ref.read(searchedProductsProvider.notifier)
    .searchProductByQuery(urlcsv.state);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    final nowPlayingMovies = ref.watch(searchedProductsProvider);

    return HomePage(
      listdat: nowPlayingMovies,
    );
  }

  @override
  bool get wantKeepAlive => true;
}
