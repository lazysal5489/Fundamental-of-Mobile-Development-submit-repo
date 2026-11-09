import 'ex1_hobbies.dart' as ex1;
import 'ex2_buttons.dart' as ex2;
import 'ex3_products.dart' as ex3;
import 'ex4_weather.dart' as ex4;

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
