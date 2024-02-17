import 'package:fluro/fluro.dart';

import 'router_handlers.dart';

class Flurorouter {
  static final router = FluroRouter();

  static void configureRoutes() {
    router.define('/:page', handler: homeHandler);

    router.notFoundHandler = homeHandler;
  }
}
