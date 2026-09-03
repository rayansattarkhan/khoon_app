import 'package:flutter/material.dart';
import 'package:khoon_app/core/theme/theme_constants/my_colors.dart';
import 'package:khoon_app/core/theme/theme_constants/my_text_colors.dart';

class MySingleHorizontalBarChart extends StatefulWidget {
  final double width;
  final double height;
  final int totalValues;
  final int displayValue;
  final Color barBackground;
  final Color barForeground;
  final String barPrefixText;
  final bool showPercent;
  final Color percentColor;

  const MySingleHorizontalBarChart({
    super.key,
    this.width = 300,
    this.height = 10,
    this.totalValues = 100,
    this.displayValue = 100,
    this.barPrefixText = "",
    this.showPercent = false,
    this.barBackground = MyColors.lightPink,
    this.barForeground = MyColors.brightRed,
    this.percentColor = MyTextColors.redAccent,
  });

  @override
  State<MySingleHorizontalBarChart> createState() =>
      _MySingleHorizontalBarChartState();
}

class _MySingleHorizontalBarChartState
    extends State<MySingleHorizontalBarChart> {
  late double percent = (widget.displayValue / widget.totalValues) * 100;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: .only(bottom: 4),
      child: Row(
        children: [
          SizedBox(
            width: widget.width / 14,
            child: Text(
              widget.barPrefixText,
              style: Theme.of(context).textTheme.bodyMedium!
                  .copyWith(color: MyTextColors.darkGrey),
            ),
          ),
          Stack(
            children: [
              Positioned(
                child: Container(
                  width: widget.width * 0.70,
                  height: widget.height * 0.75,
                  decoration: BoxDecoration(
                    color: MyColors.lightPink,
                    borderRadius: .circular(6),
                  ),
                ),
              ),
              Positioned(
                child: Container(
                  width: ((widget.width * 0.70) * percent) / 100,
                  height: widget.height * 0.75,
                  decoration: BoxDecoration(
                    color: MyColors.brightRed,
                    borderRadius: .circular(6),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            width: widget.showPercent ? widget.width / 8 : 0,
            child: Padding(
              padding: .only(left: 4),
              child: Align(
                alignment: .centerStart,
                child: Text(
                  widget.showPercent ? "$percent%" : "",
                  style: Theme.of(context).textTheme.bodyMedium!
                      .copyWith(color: MyTextColors.redAccent),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
