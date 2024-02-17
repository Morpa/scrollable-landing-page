import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/page_provider.dart';
import '../shared/custom_menu.dart';
import '../views/about_view.dart';
import '../views/contact_view.dart';
import '../views/home_view.dart';
import '../views/location_view.dart';
import '../views/pricing_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: buildBoxDecoration(),
        child: Stack(
          children: [
            _HomeBody(),
            const Positioned(
              top: 20,
              right: 20,
              child: CustomMenu(),
            )
          ],
        ),
      ),
    );
  }

  BoxDecoration buildBoxDecoration() => const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.pink,
            Colors.amber,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.5, 0.5],
        ),
      );
}

class _HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final pageProvider = Provider.of<PageProvider>(context, listen: false);

    return PageView(
      controller: pageProvider.scrollController,
      scrollDirection: Axis.vertical,
      children: const [
        HomeView(),
        AboutView(),
        PricingView(),
        ContactView(),
        LocationView(),
      ],
    );
  }
}
