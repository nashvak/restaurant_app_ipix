import 'package:flutter/material.dart';

class ReadMoreText extends StatefulWidget {
  final String text;
  final int maxLines;
  final String readMoreText;

  const ReadMoreText({
    super.key,
    required this.text,
    this.maxLines = 3,
    this.readMoreText = "Read More",
  });

  @override
  // ignore: library_private_types_in_public_api
  _ReadMoreTextState createState() => _ReadMoreTextState();
}

class _ReadMoreTextState extends State<ReadMoreText> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          _isExpanded ? widget.text : _trimText(widget.text, widget.maxLines),
          maxLines: _isExpanded ? null : widget.maxLines,
        ),
        Container(
          alignment: Alignment.topRight,
          child: _isExpanded
              ? Container()
              : TextButton(
                  onPressed: () => setState(() => _isExpanded = true),
                  child: Text(
                    widget.readMoreText,
                    style:
                        const TextStyle(decoration: TextDecoration.underline),
                  ),
                ),
        ),
      ],
    );
  }

  String _trimText(String text, int maxLines) {
    final lines = text.split('\n');
    if (lines.length <= maxLines) return text;
    return "${lines.sublist(0, maxLines).join('\n')}...";
  }
}
