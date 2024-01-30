import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ClickInputCard extends StatefulWidget {
  const ClickInputCard({
    super.key,
    required this.description,
  });

  final String description;

  @override
  State<ClickInputCard> createState() => _ClickInputCard();
}

class _ClickInputCard extends State<ClickInputCard> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final tileStyle = theme.textTheme.labelLarge!.copyWith(
      color: theme.colorScheme.onBackground,
    );
    final subTileStyle = theme.textTheme.bodyMedium!
        .copyWith(color: theme.colorScheme.onPrimary);

    return Card(
      color: theme.colorScheme.secondary,
      child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: 200,
            height: 50,
            child: Row(children: [
              Text(widget.description, style: subTileStyle),
              SizedBox(width: 10),
              SizedBox(
                // width: 30,
                // height: 30,
                child: TextField(
                  decoration: InputDecoration(hintStyle: tileStyle),
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                ),
              ),
            ]),
          )),
    );
  }
}
