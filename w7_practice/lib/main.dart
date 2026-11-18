import 'ex1_selectable_button.dart' as ex1;
import 'ex2_favorite_cards.dart' as ex2;
import 'ex3_image_gallery.dart' as ex3;
import 'ex4_score_bar.dart' as ex4;

// Which exercise to show: change the number, then press R (hot restart).
const exercise = 4;

void main() {
  switch (exercise) {
    case 1:
      ex1.main();
    case 2:
      ex2.main();
    case 3:
      ex3.main();
    case 4:
      ex4.main();
  }
}
