import 'package:flutter/material.dart';
import 'package:vigila/screens/home/subguidelines.dart';

class Guidelines extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GlowingOverscrollColorChanger(
        color: Colors.purple[600],
        child: ListView(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.add_alert),
              title: Text('First Aid'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FirstAid(),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.list),
              title: Text('RICE'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RICE(),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.favorite),
              title: Text('CPR'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CPR(),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.list_alt),
              title: Text('BLS'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CPR(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

/// Overrides the [GlowingOverscrollIndicator] color used by descendant widgets.
class GlowingOverscrollColorChanger extends StatelessWidget {
  final Widget child;
  final Color color;

  const GlowingOverscrollColorChanger({Key key, this.child, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: SpecifiableOverscrollColorScrollBehavior(color),
      child: child,
    );
  }
}

class SpecifiableOverscrollColorScrollBehavior extends ScrollBehavior {
  final Color _overscrollColor;

  const SpecifiableOverscrollColorScrollBehavior(this._overscrollColor);

  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    switch (getPlatform(context)) {
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        return child;
      case TargetPlatform.windows:
      case TargetPlatform.linux:
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
      default:
        return GlowingOverscrollIndicator(
          child: child,
          axisDirection: axisDirection,
          color: _overscrollColor,
        );
    }
  }
}