import 'package:fluro/fluro.dart';

import '../ui/pages/home_page.dart';

final homeHandler = Handler(handlerFunc: (_, params) {
  final page = params['page']?.first;

  if (page != '/') {
    return const HomePage();
  }
  return null;
});
