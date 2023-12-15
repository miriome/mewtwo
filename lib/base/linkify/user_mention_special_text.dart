import 'package:extended_text_field/extended_text_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class MentionText extends SpecialText {
  MentionText(TextStyle? textStyle, SpecialTextGestureTapCallback? onTap, {this.showAtBackground = false, this.start})
      : super(flag, '| ', textStyle, onTap: onTap);
  static const String flag = '@';
  final int? start;

  /// whether show background for @somebody
  final bool showAtBackground;

  @override
  InlineSpan finishText() {
    final TextStyle? textStyle = this.textStyle?.copyWith(color: Colors.blue, fontSize: 16.0);

    final String mentionText = toString();
    
    return showAtBackground
        ? BackgroundTextSpan(
            background: Paint()..color = Colors.blue.withOpacity(0.15),
            text: mentionText,
            actualText: mentionText,
            start: start!,

            ///caret can move into special text
            deleteAll: true,
            style: textStyle,
            recognizer: (TapGestureRecognizer()
              ..onTap = () {
                if (onTap != null) {
                  onTap!(mentionText);
                }
              }))
        : SpecialTextSpan(
            text: mentionText,
            actualText: mentionText,
            start: start!,
            style: textStyle,
            recognizer: (TapGestureRecognizer()
              ..onTap = () {
                if (onTap != null) {
                  onTap!(mentionText);
                }
              }));
  }
}

class MentionTextSpanBuilder extends SpecialTextSpanBuilder {
  MentionTextSpanBuilder({this.showAtBackground = false});

  /// whether show background for @somebody
  final bool showAtBackground;

  @override
  SpecialText? createSpecialText(String flag,
      {TextStyle? textStyle, SpecialTextGestureTapCallback? onTap, int? index}) {
    if (flag == '') {
      return null;
    }

    if (isStart(flag, MentionText.flag)) {
      return MentionText(
        textStyle,
        onTap,
        start: index! - (MentionText.flag.length - 1),
        showAtBackground: showAtBackground,
      );
    }


    return null;
  }
}
