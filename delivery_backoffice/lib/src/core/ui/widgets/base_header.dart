// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../styles/text_styles.dart';

class BaseHeader extends StatelessWidget {
  final String title;
  final ValueChanged<String>? searchChanged;
  final String buttonLabel;
  final VoidCallback? buttonPressed;
  final bool showButton;
  final Widget? filterWidget;

  const BaseHeader({
    Key? key,
    required this.title,
    this.searchChanged,
    required this.buttonLabel,
    this.buttonPressed,
    this.filterWidget,
    this.showButton = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Wrap(
          children: [
            Visibility(
              visible: filterWidget == null,
              replacement: filterWidget ?? const SizedBox.shrink(),
              child: SizedBox(
                width: constraints.maxWidth * .15,
                child: TextFormField(
                  onChanged: searchChanged,
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                    prefixIcon: Icon(
                      Icons.search,
                      size: constraints.maxWidth * 0.02,
                    ),
                    label: Text(
                      'Buscar',
                      style: context.textStyles.textRegular.copyWith(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              width: constraints.maxWidth * .65,
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: context.textStyles.textTitle.copyWith(
                  decoration: TextDecoration.underline,
                  decorationThickness: 2,
                ),
              ),
            ),
            Visibility(
              visible: showButton,
              replacement: const SizedBox.shrink(),
              child: SizedBox(
                width: constraints.maxWidth * .15,
                height: 48,
                child: OutlinedButton.icon(
                  onPressed: buttonPressed,
                  icon: Icon(
                    Icons.add,
                    size: constraints.maxWidth * 0.02,
                  ),
                  label: Text(buttonLabel),
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
