import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../providers/page_provider.dart';
import 'custom_menu_item.dart';

class CustomMenu extends StatefulWidget {
  const CustomMenu({super.key});

  @override
  State<CustomMenu> createState() => _CustomMenuState();
}

class _CustomMenuState extends State<CustomMenu>
    with SingleTickerProviderStateMixin {
  bool isOpen = false;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
  }

  @override
  Widget build(BuildContext context) {
    final pageProvider = Provider.of<PageProvider>(context, listen: false);

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          if (isOpen) {
            controller.reverse();
          } else {
            controller.forward();
          }

          setState(() {
            isOpen = !isOpen;
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          width: 150,
          height: isOpen ? 308 : 50,
          color: Colors.black,
          child: Column(
            children: [
              _MenuTitle(
                isOpen: isOpen,
                controller: controller,
              ),
              if (isOpen) ...[
                CustomMenuItem(
                  delay: 0,
                  text: 'Home',
                  onPressed: () => pageProvider.goTo(0),
                ),
                CustomMenuItem(
                  delay: 30,
                  text: 'About',
                  onPressed: () => pageProvider.goTo(1),
                ),
                CustomMenuItem(
                  delay: 60,
                  text: 'Pricing',
                  onPressed: () => pageProvider.goTo(2),
                ),
                CustomMenuItem(
                  delay: 90,
                  text: 'Contact',
                  onPressed: () => pageProvider.goTo(3),
                ),
                CustomMenuItem(
                  delay: 120,
                  text: 'Location',
                  onPressed: () => pageProvider.goTo(4),
                ),
                const SizedBox(
                  height: 8,
                ),
              ]
            ],
          ),
        ),
      ),
    );
  }
}

class _MenuTitle extends StatelessWidget {
  const _MenuTitle({
    required this.isOpen,
    required this.controller,
  });

  final bool isOpen;
  final AnimationController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 50,
      child: Row(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeInOut,
            width: isOpen ? 45 : 0,
          ),
          Text(
            'Menu',
            style: GoogleFonts.jetBrainsMono(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
          const Spacer(),
          AnimatedIcon(
            icon: AnimatedIcons.menu_close,
            progress: controller,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
