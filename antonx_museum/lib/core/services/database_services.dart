import 'package:antonx_museum/core/models/exhibition.dart';
import 'package:antonx_museum/core/models/museum.dart';

class DatabaseService {
  List<Museum> getMuseums() {
    final List<Museum> museums = [
      Museum(title: 'Peshawar Museum', address: 'Jail Road Peshawar'),
      Museum(title: 'Abbottabad Museum', address: 'Jail Road Abbottabad'),
      Museum(title: 'Haripure Museum', address: 'Jail Road Haripure'),
      Museum(title: 'Mansehra Museum', address: 'Jail Road Mansehra'),
    ];
    return museums;
  }

  List<Exhibition> getExhibitions() {
    final List<Exhibition> exhibitions = [
      Exhibition(
        title: 'Food: Peshawar Food Festive',
        address: 'Namak Mandi',
        date: '14 Aug, 2021',
      ),
      Exhibition(
        title: 'Food: Abbottabad Food Festive',
        address: 'Namak Mandi',
        date: '14 Aug, 2021',
      ),
      Exhibition(
        title: 'Food: Bannu Food Festive',
        address: 'Namak Mandi',
        date: '14 Aug, 2021',
      ),
      Exhibition(
        title: 'Food: Lahore Food Festive',
        address: 'Batta chowk',
        date: '14 Aug, 2021',
      ),
    ];
    return exhibitions;
  }
}
