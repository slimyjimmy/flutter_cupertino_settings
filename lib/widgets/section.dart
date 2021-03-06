part of flutter_cupertino_settings;

class CSSection extends StatelessWidget {
  final List<Widget> items;

  /// A widget displayed above the items. Typically a `CSHeader`.
  final Widget header;

  /// A widget displayed below the items. Typically a `CSDescription`.
  final Widget description;
  final EdgeInsets padding;

  /// The `BorderRadius` applied to the Container holding the items.
  ///
  /// Default: `BorderRadius.circular(10)`
  final BorderRadius borderRadius;

  CSSection({
    Key key,
    this.items,
    this.header,
    this.description,
    this.padding,
    this.borderRadius,
  })  : assert(
          items != null && items.isNotEmpty,
          'Items can not be null or empty.',
        ),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => Padding(
        padding: padding ??
            EdgeInsets.symmetric(
              horizontal: constraints.maxWidth * 0.1,
            ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            if (header != null)
              if (header is CSHeader)
                CSHeader(
                  (header as CSHeader).title,
                  bottomBorder: BorderSide.none,
                )
              else
                header,
            ClipRRect(
              borderRadius: borderRadius ?? BorderRadius.circular(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: items.map<Widget>((e) {
                  if (items.length == 1) {
                    return DefaultCSWidgetTheme.merge(
                      child: e,
                      style: CSWidgetStyle(
                        topBorder: BorderSide.none,
                        bottomBorder: BorderSide.none,
                      ),
                    );
                  } else if (e == items.first) {
                    return DefaultCSWidgetTheme.merge(
                      child: e,
                      style: CSWidgetStyle(
                        topBorder: BorderSide.none,
                      ),
                    );
                  } else if (e == items.last) {
                    return DefaultCSWidgetTheme.merge(
                      child: e,
                      style: CSWidgetStyle(
                        bottomBorder: BorderSide.none,
                      ),
                    );
                  } else {
                    return e;
                  }
                }).toList(),
              ),
            ),
            if (description != null)
              DefaultCSWidgetTheme.merge(
                child: description,
                style: CSWidgetStyle(
                  topBorder: BorderSide.none,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
