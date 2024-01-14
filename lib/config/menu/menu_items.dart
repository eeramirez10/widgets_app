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
      link: '/animated')
];
