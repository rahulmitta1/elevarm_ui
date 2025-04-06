import 'package:elevarm_icons/elevarm_icons.dart';
import 'package:elevarm_ui/elevarm_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class ElevarmReadMoreContainer extends StatefulWidget {
  final ElevarmLinkButtonThemeData buttonThemeData;
  final String content;
  final bool isExpanded;
  final double? maxHeight;
  final double minHeight;
  final double? width;

  const ElevarmReadMoreContainer({
    required this.content,
    required this.minHeight,
    super.key,
    this.buttonThemeData =
        const ElevarmLinkButtonThemeData(onPrimaryColor: ElevarmColors.primary),
    this.isExpanded = false,
    this.maxHeight,
    this.width,
  });

  @override
  State<ElevarmReadMoreContainer> createState() =>
      _ElevarmReadMoreContainerState();
}

class _ElevarmReadMoreContainerState extends State<ElevarmReadMoreContainer> {
  late bool _isExpanded;

  @override
  void initState() {
    _isExpanded = widget.isExpanded;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: widget.maxHeight ?? double.infinity,
        minHeight: widget.minHeight,
      ),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOutCubic,
        height: _isExpanded ? widget.maxHeight : widget.minHeight,
        width: widget.width,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: Markdown(
                padding: EdgeInsets.zero,
                data: widget.content,
                physics: _isExpanded
                    ? const AlwaysScrollableScrollPhysics()
                    : const NeverScrollableScrollPhysics(),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: AnimatedCrossFade(
                firstChild: _buildExpandTextButton(),
                secondChild: _buildShrinkTextButton(),
                crossFadeState: _isExpanded
                    ? CrossFadeState.showSecond
                    : CrossFadeState.showFirst,
                duration: const Duration(milliseconds: 300),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExpandTextButton() {
    return Center(
      child: ElevarmLinkPrimaryButton.icon(
        buttonThemeData: widget.buttonThemeData,
        text: 'Lihat Selengkapnya',
        leadingIconAssetName: null,
        trailingIconAssetName: ElevarmIconsOutline.chevron_down,
        onPressed: () {
          _isExpanded = true;
          setState(() {});
        },
      ),
    );
  }

  Widget _buildShrinkTextButton() {
    return Center(
      child: ElevarmLinkPrimaryButton.icon(
        buttonThemeData: widget.buttonThemeData,
        text: 'Sembunyikan',
        leadingIconAssetName: null,
        trailingIconAssetName: ElevarmIconsOutline.chevron_up,
        onPressed: () {
          _isExpanded = false;
          setState(() {});
        },
      ),
    );
  }
}
