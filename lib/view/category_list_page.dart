import 'package:flash_card_app/repository/card_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CategoryListPage extends ConsumerWidget {
  final String? categoryName;

  const CategoryListPage({super.key, required this.categoryName});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final wordCardList = ref.watch(allCardProvider(categoryName));

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              context.go('/category');
            },
            icon: const Icon(Icons.arrow_back),
          ),
        ],
      ),
      body: ListView.builder(
          itemCount: wordCardList.length,
          itemBuilder: (context, index) {
            final wordCard = wordCardList[index];
            return ListTile(
              title: Text(wordCard.korWord),
              subtitle: Text(wordCard.engWord),
            );
          }),
    );
  }
}
