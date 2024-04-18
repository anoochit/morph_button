# MorphButton

An animated shape transform button.

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
