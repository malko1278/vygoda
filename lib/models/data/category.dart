
import 'dart:ui';
import 'package:flutter/material.dart';

class Category {
  final String title;
  final Color couleur;
  final String imageUrl;

  Category({
    required this.title,
    required this.couleur,
    required this.imageUrl,
  });
}

final categoryList = [
  Category(
    title: 'Каталог',
    couleur: const Color(0xFF1eb8ce),
    imageUrl: 'assets/images/group_catalog.png',
  ),
  Category(
    title: 'Каталог',
    couleur: Colors.white,
    imageUrl: 'assets/images/group_catalog.png',
  ),
  Category(
    title: 'Каталог',
    couleur: Colors.white,
    imageUrl: 'assets/images/group_catalog.png',
  ),
  Category(
    title: 'Каталог',
    couleur: Colors.white,
    imageUrl: 'assets/images/group_catalog.png',
  ),
  Category(
    title: 'Каталог',
    couleur: Colors.white,
    imageUrl: 'assets/images/group_catalog.png',
  ),
  Category(
    title: 'Каталог',
    couleur: Colors.white,
    imageUrl: 'assets/images/group_catalog.png',
  ),
];
