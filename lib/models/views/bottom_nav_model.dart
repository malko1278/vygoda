
class NavBarModel {
  final String icon;
  final String activeIcon;
  final String title;

  NavBarModel({
    required this.icon,
    required this.activeIcon,
    required this.title,
  });
}

final listNavBarMod =  [
  NavBarModel(
    icon: 'assets/images/research.png',
    activeIcon: 'assets/images/research.png',
    title: 'Catalog',
  ),
  NavBarModel(
    icon: 'assets/images/like_max.png',
    activeIcon: 'assets/images/like_max.png',
    title: "Like",
  ),
  NavBarModel(
    icon: 'assets/images/basket.png',
    activeIcon: 'assets/images/basket.png',
    title: 'Basket',
  ),
  NavBarModel(
    icon: 'assets/images/clock.png',
    activeIcon: 'assets/images/clock.png',
    title: 'History',
  ),
  NavBarModel(
    icon: 'assets/images/fitness.png',
    activeIcon: 'assets/images/fitness.png',
    title: 'Profile',
  ),
];