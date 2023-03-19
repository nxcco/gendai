import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoBottomBar extends StatelessWidget
    implements PreferredSizeWidget {
  final Widget? leading;
  final Widget? trailing;
  final Widget? middle;
  final Color? backgroundColor;
  final Border? border;
  final double height;

  const CupertinoBottomBar({
    Key? key,
    this.leading,
    this.trailing,
    this.middle,
    this.backgroundColor,
    this.border,
    this.height = kBottomNavigationBarHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final backgroundColor = this.backgroundColor ?? CupertinoColors.white;
    final border = this.border ??
        const Border(
          top: BorderSide(
            color: CupertinoColors.systemGrey4,
            width: 0.0,
          ),
        );

    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        border: border,
      ),
      height: height,
      margin:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewPadding.bottom),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              if (leading != null)
                Padding(
                  padding: const EdgeInsetsDirectional.only(start: 8.0),
                  child: DefaultTextStyle(
                    style:
                        CupertinoTheme.of(context).textTheme.navActionTextStyle,
                    child: leading!,
                  ),
                ),
              if (middle != null)
                DefaultTextStyle(
                  style: CupertinoTheme.of(context).textTheme.navTitleTextStyle,
                  child: middle!,
                ),
              if (trailing != null)
                Padding(
                  padding: const EdgeInsetsDirectional.only(end: 8.0),
                  child: DefaultTextStyle(
                    style:
                        CupertinoTheme.of(context).textTheme.navActionTextStyle,
                    child: trailing!,
                  ),
                ),
            ],
          ),
          const Spacer(),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
