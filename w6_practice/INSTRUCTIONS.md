# W6 Practice – Stateless Widgets (homework)

The exercises are in the handout: **`W6  - PRACTICE - Stateless widgets.docx`** (in this folder).

- **EX 1, EX 2, EX 3: to do.** EX 4 is a bonus.
- **No AI tools** (handout rule). You will be asked to explain your own code.

## How to run

1. Open **this folder** in VS Code (File > Open Folder).
2. Terminal: `flutter pub get`
3. Terminal: `flutter run -d chrome`
4. After each change, press `r` in the terminal (hot reload).

One project, one file per exercise:

| Exercise | File |
| --- | --- |
| EX 1 – The hobbies | `lib/ex1_hobbies.dart` |
| EX 2 – The buttons | `lib/ex2_buttons.dart` |
| EX 3 – The products | `lib/ex3_products.dart` |
| EX 4 – The weather (bonus) | `lib/ex4_weather.dart` |

To switch exercise: in `lib/main.dart`, change `const exercise = 1;` to 2, 3 or 4, then press **`R`** (capital R = hot restart).

## Images (EX 3, EX 4)

The images are already in `assets/ex3/` and `assets/ex4/`. You still have to declare them in `pubspec.yaml` yourself (see the links in the handout).
Image not showing? Check the indentation of `assets:` in `pubspec.yaml`, then stop the app and run it again.

## Handout corrections

- **Submit on Moodle**, not MS Teams.
- EX 3, Part 1: build one **product** card (the handout says "hobby" by mistake). EX 3 has 3 parts: 1 the card, 2 the `Product` enum, 3 the `ProductCard` widget.

## How to submit

1. Push this project to your GitHub repository (public, or I can't open it). Commit after each exercise, not everything in one commit at the end.
2. On Moodle, submit the **link to the repository**.
