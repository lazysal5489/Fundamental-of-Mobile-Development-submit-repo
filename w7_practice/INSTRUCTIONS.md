# W7 Practice – Stateful Widgets (homework)

The exercises are in the handout: **`W7 - PRACTICE- Statefull widgets.docx`** (in this folder).

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
| EX 1 – The selectable button | `lib/ex1_selectable_button.dart` |
| EX 2 – The best cards | `lib/ex2_favorite_cards.dart` (Part 1 correction: `lib/ex2_part1_correction.dart`, look at it after you tried) |
| EX 3 – The image gallery | `lib/ex3_image_gallery.dart` |
| EX 4 – Score bar (bonus) | `lib/ex4_score_bar.dart` |

To switch exercise: in `lib/main.dart`, change `const exercise = 1;` to 2, 3 or 4, then press **`R`** (capital R = hot restart).

## Images (EX 3)

The images are already in `assets/w4-s2/`. You still have to declare them in `pubspec.yaml` yourself.
Image not showing? Check the indentation of `assets:` in `pubspec.yaml`, then stop the app and run it again.

## Handout corrections

- **Submit on Moodle**, not MS Teams.
- The title says "W8 PRACTICE": it is the W7 practice.

## How to submit

1. Push this project to your GitHub repository (public, or I can't open it). Commit after each exercise, not everything in one commit at the end.
2. On Moodle, submit the **link to the repository**.
