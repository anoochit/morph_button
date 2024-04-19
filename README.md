# MorphButton

An animated shape transform button.

## Install

Add morph_button to your pubspec.yaml

Using Dart package

```bash
dart pub add morph_button
```

Using GIT URL

```yaml
dependencies:
  morph_button:
    git:
      url: https://github.com/anoochit/morph_button.git
```

## Usage

```dart
MorphButton(
  width: 200.0,
  height: 200.0,
  pressedColor: Theme.of(context).colorScheme.primary,
  initialColor: Theme.of(context).colorScheme.primary.withOpacity(0.6),
  initialRadius: 24.0,
  title: const Text(
    'Click Me',
    style: TextStyle(
      fontSize: 20.0,
      color: Colors.white,
    ),
  ),
  onTap: () {},
);

```
