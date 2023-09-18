import 'package:get/get.dart';
import 'package:gym_assignment/app/modules/home/home_binding.dart';

import '../modules/search/search_page.dart';

class SearchRoutes {
  SearchRoutes._();

  static const search = '/search';

  static final routes = [
    GetPage(
      name: search,
      page: () => const SearchPage(),
      binding: HomeBinding(),
    ),
  ];
}
