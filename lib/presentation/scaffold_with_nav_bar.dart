import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class ScaffoldWithNavBar extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const ScaffoldWithNavBar({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: navigationShell.currentIndex,
        destinations: [
          NavigationDestination(
            icon: FaIcon(FontAwesomeIcons.cloudSun),
            label: "Weather",
          ),
          NavigationDestination(
            icon: FaIcon(FontAwesomeIcons.magnifyingGlass),
            label: "Search",
          ),
          NavigationDestination(
            icon: FaIcon(FontAwesomeIcons.gear),
            label: "Settings",
          )
        ],
        onDestinationSelected: (value) {
          navigationShell.goBranch(value);
        },
      ),
    );
  }
}
