import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// import 'package:gestion_inventario/features/home/presentation/providers/product_repository_provider.dart';
import 'package:gestion_inventario/features/home/presentation/providers/pruduct_providers.dart';
import 'package:gestion_inventario/features/home/presentation/widgets/product_list.dart';

class HomeView extends ConsumerStatefulWidget {
  final String urlcsv;
  const HomeView({super.key, required this.urlcsv});

  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends ConsumerState<HomeView>
    with AutomaticKeepAliveClientMixin {
  get urlcsv => null;

  @override
  void initState() {
    super.initState();

    // ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
    // ref.read(popularMoviesProvider.notifier).loadNextPage();
    // ref.read(topRatedMoviesProvider.notifier).loadNextPage();
    // ref.read(upcomingMoviesProvider.notifier).loadNextPage();
    ref.read(searchedMoviesProvider);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    // final Size size = MediaQuery.of(context).size;

    // final initialLoading = ref.watch(initialLoadingProvider);
    // if (initialLoading) return const FullScreenLoader();

    // final slideShowMovies = ref.watch(searchedMoviesProvider);
    final nowPlayingMovies = ref.watch(searchedMoviesProvider);
    // final topRatedMovies = ref.watch(topRatedMoviesProvider);
    // final upcomingMovies = ref.watch(upcomingMoviesProvider);

    return CustomScrollView(slivers: [
      // const SliverAppBar(
      //   floating: true,
      //   flexibleSpace: FlexibleSpaceBar(
      //     title: CustomAppbar(),
      //   ),
      // ),
      SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
        return Column(
          children: [
            // const CustomAppbar(),

            // MoviesSlideshow(movies: slideShowMovies),

            MovieHorizontalListview(
                movies: nowPlayingMovies,
                title: urlcsv,
                subTitle: 'Lunes 20',
                loadNextPage: () => ref.read(searchedMoviesProvider.notifier)),

            // MovieHorizontalListview(
            //     movies: upcomingMovies,
            //     title: 'Próximamente',
            //     subTitle: 'En este mes',
            //     loadNextPage: () =>
            //         ref.read(upcomingMoviesProvider.notifier).loadNextPage()),

            // //* Ya no estará aquí, ahora es parte del menú inferior
            // // MovieHorizontalListview(
            // //   movies: popularMovies,
            // //   title: 'Populares',
            // //   // subTitle: '',
            // //   loadNextPage: () =>ref.read(popularMoviesProvider.notifier).loadNextPage()
            // // ),

            // MovieHorizontalListview(
            //     movies: topRatedMovies,
            //     title: 'Mejor calificadas',
            //     subTitle: 'Desde siempre',
            //     loadNextPage: () =>
            //         ref.read(topRatedMoviesProvider.notifier).loadNextPage()),

            const SizedBox(height: 10),
          ],
        );
      }, childCount: 1)),
    ]);
  }

  @override
  bool get wantKeepAlive => true;
}
