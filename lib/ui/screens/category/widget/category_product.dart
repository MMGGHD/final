import 'package:flutter/material.dart';
import 'package:flutter_blog/data/model/category.dart';
import 'package:flutter_blog/data/store/category_store.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CategoryProducts extends ConsumerWidget {
  // final List<String> categorys = [
  //   "국 반찬 메인요리",
  //   "샐러드 간편식",
  //   "면 - 양념 - 오일",
  //   "의약품",
  //   "수산, 해산, 건어물",
  //   "생수, 음료, 우유",
  //   "건강식품",
  //   "주류, 와인",
  // ];
  CategoryProducts({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    CategoryModel? model = ref.watch(CategoryListProvider);

    List<Category> categorys = [];

    if (model != null) {
      categorys = model.categorys;
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        itemCount: categorys.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {},
            child: Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Image.network(
                      "http://192.168.35.12:8080${categorys[index].categoryPic}",
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "${categorys[index].categoryType}",
                              style: TextStyle(fontWeight: FontWeight.w200),
                            ))),
                  ),
                ],
              ),
            ),
          );
        },
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
      ),
    );
  }
}
