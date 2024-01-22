import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String subTitle;
  final String link;
  final IconData icon;

  const MenuItem(
      {required this.title,
      required this.icon,
      required this.subTitle,
      required this.link});
}

const appMenuItems = <MenuItem>[
  MenuItem(
      title: 'Counter',
      icon: Icons.add,
      subTitle: 'Counter con Riverpod',
      link: '/counter'),
  MenuItem(
      title: 'Botones',
      icon: Icons.smart_button_outlined,
      subTitle: 'Varios botones en Flutter',
      link: '/buttons'),
  MenuItem(
      title: 'Tarjetas',
      icon: Icons.credit_card,
      subTitle: 'Un contenedor de tarjetas estilizado',
      link: '/cards'),
  MenuItem(
      title: 'ProggressIndicators',
      icon: Icons.refresh_rounded,
      subTitle: 'Un contenedor de Progress',
      link: '/progress'),
  MenuItem(
      title: 'Snackbars',
      icon: Icons.info_outline,
      subTitle: 'Snackbars y dialogos',
      link: '/snackbars'),
  MenuItem(
      title: 'Animated Container',
      icon: Icons.check_box_outline_blank_rounded,
      subTitle: 'Stateful widget animado',
      link: '/animated'),
  MenuItem(
      title: 'UI Controls + Tiles',
      icon: Icons.car_rental_outlined,
      subTitle: 'Una serie de controles de Flutter',
      link: '/ui-controls'),
  MenuItem(
      title: 'App Tutorial',
      icon: Icons.accessibility_new_rounded,
      subTitle: 'Pequeño tutorial introductorio',
      link: '/tutorial'),
  MenuItem(
      title: 'Infinite Scroll y Pull',
      icon: Icons.list_alt_rounded,
      subTitle: 'Listas infinitas y pull to refresh',
      link: '/infinite'),
  MenuItem(
      title: 'Cambiar Tema',
      icon: Icons.color_lens_outlined,
      subTitle: 'Theme Changer',
      link: '/theme-changer')
];
