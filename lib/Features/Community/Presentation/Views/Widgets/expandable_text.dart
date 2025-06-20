import 'package:flutter/material.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Core/utils/styles/app_fonts.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';

class ExpandableText extends StatefulWidget {
  final String text;
  final int trimLines;

  const ExpandableText(this.text, {super.key, this.trimLines = 2});

  @override
  ExpandableTextState createState() => ExpandableTextState();
}

class ExpandableTextState extends State<ExpandableText> {
  bool _readMore = true;

  @override
  Widget build(BuildContext context) {
    final textSpan = TextSpan(text: widget.text);

    return LayoutBuilder(
      builder: (context, constraints) {
        final textPainter = TextPainter(
          text: textSpan,
          maxLines: widget.trimLines,
          textDirection: TextDirection.ltr,
        );
        textPainter.layout(maxWidth: constraints.maxWidth);
        final didOverflow = textPainter.didExceedMaxLines;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.text,
              style: AppStyles.fontsRegular14(
                context,
              ).copyWith(color: AppColors.bodyTextColor),
              maxLines: _readMore ? widget.trimLines : null,
              overflow:
                  _readMore ? TextOverflow.ellipsis : TextOverflow.visible,
            ),
            SizedBox(height: AppSpacing.s2),
            if (didOverflow)
              InkWell(
                child: Text(
                  _readMore ? 'عرض المزيد' : 'عرض أقل',
                  style: AppStyles.fontsBold14(
                    context,
                  ).copyWith(color: AppColors.titleTextColor),
                ),
                onTap: () {
                  setState(() {
                    _readMore = !_readMore;
                  });
                },
              ),
          ],
        );
      },
    );
  }
}
