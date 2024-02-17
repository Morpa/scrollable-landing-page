import 'package:fluro/fluro.dart';

import '../ui/pages/home_page.dart';

final homeHandler = Handler(handlerFunc: (_, params) {
  return const HomePage();
});
