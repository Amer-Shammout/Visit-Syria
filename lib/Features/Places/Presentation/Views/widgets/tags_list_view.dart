import 'package:flutter/widgets.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Core/widgets/custom_choice_chip.dart';

class TagsListView extends StatefulWidget {
  const TagsListView({super.key, required this.data});

  final List<String> data;

  @override
  State<TagsListView> createState() => _TagsListViewState();
}

class _TagsListViewState extends State<TagsListView> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.046 + 16,
      color: AppColors.whiteColor,
      child: ListView.separated(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder:
            (context, index) => Padding(
              padding: EdgeInsetsDirectional.only(
                start: index == 0 ? 16 : 0,
                end: index == widget.data.length - 1 ? 16 : 0,
              ),
              child: SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.046,
                child: CustomChoiceChip(
                  isSelected: _currentIndex == index,
                  onOptionToggle: (value) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                  option: widget.data[index],
                ),
              ),
            ),
        separatorBuilder: (context, index) => SizedBox(width: 8),
        itemCount: widget.data.length,
      ),
    );
  }
}
