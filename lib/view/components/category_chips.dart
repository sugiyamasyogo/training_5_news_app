import 'package:flutter/material.dart';
import 'package:training_5_news_app/data/category_info.dart';

class CategoryChips extends StatefulWidget {
  final ValueChanged onCategorySelected;

  const CategoryChips({Key? key,required this.onCategorySelected}) : super(key: key);

  @override
  State<CategoryChips> createState() => _CategoryChipsState();
}

class _CategoryChipsState extends State<CategoryChips> {
  var value = 0;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 5.0,
      children:
      List<Widget>.generate(categories.length, (int index) {
        return ChoiceChip(
          label: Text(categories[index].nameJp),
          selected: value == index,
          onSelected: (bool isSelected) {
            setState(() {
              value = isSelected
                  ? index
                  : 0;
              widget.onCategorySelected(categories[index]);
            }
            );
          },
        );
      }
      ).toList(),
    );
  }
}
