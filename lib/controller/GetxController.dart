import 'package:get/state_manager.dart';
import 'package:movieapp/models/Movie.dart';
import 'package:tmdb_api/tmdb_api.dart';

class MovieController extends GetxController {
  //var loading = true.obs;
  List list = [].obs;
  //String q = '';

  // final apiKey = '2f4dc6d56ff72989d31348ef2578680b';
  // final apiToken =
  //  'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIyZjRkYzZkNTZmZjcyOTg5ZDMxMzQ4ZWYyNTc4NjgwYiIsInN1YiI6IjYyODNiODMyZWM0NTUyMTAzMmE5YjdmMCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.RXzEniM-hq8DR2EFa5FEKVeTHwkNQnZzhoRK-LE1KBw';

  @override
  /* void onInit() {
    // TODO: implement onInit
    super.onInit();
    getMovies();
  }*/

  getMovies(String query) async {
    const apiKey = '2f4dc6d56ff72989d31348ef2578680b';
    const apiToken =
        'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIyZjRkYzZkNTZmZjcyOTg5ZDMxMzQ4ZWYyNTc4NjgwYiIsInN1YiI6IjYyODNiODMyZWM0NTUyMTAzMmE5YjdmMCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.RXzEniM-hq8DR2EFa5FEKVeTHwkNQnZzhoRK-LE1KBw';

    TMDB tmdbrequest = TMDB(ApiKeys(apiKey, apiToken),
        logConfig: const ConfigLogger(showLogs: true, showErrorLogs: true));

    Map searchmap = await tmdbrequest.v3.search.queryMovies(query);

    return list = searchmap['results'];
  }

  // get query => q;
  /*  getMovies() async {
    try {
      TMDB tmdbrequest = TMDB(ApiKeys(apiKey, apiToken),
          logConfig: const ConfigLogger(showLogs: true, showErrorLogs: true));
      Map result = await tmdbrequest.v3.trending.getTrending();
      print(Movie.fromJson(result as Map<String, dynamic>).title.toString());
      //list = List<Movie.fromJson(result)>; //Movie.fromJson(result);
      // movieList.assignAll(result);
    } finally {
      loading(false);
    }
  }*/

}
