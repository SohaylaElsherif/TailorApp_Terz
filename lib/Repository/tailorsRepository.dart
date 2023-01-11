import 'package:graduation_project/Models/Tailor.dart';
import 'package:graduation_project/Models/filteredTailors.dart';
import 'package:graduation_project/Services/tailorsService.dart';

class TailorsRepository {
  TailorService _tailorService = TailorService();

  Future<Tailors> fetchTailors() async {
    final tailor = await _tailorService.fetchTailors();
    return tailor;
  }

    Future<List<FilteredTailors>> fetchFilteredData(String name) async {
    final tailor = await _tailorService.fetchTailor(name);
    return tailor;
  }

    Future<Tailors> fetchProducts() async {
    final products = await _tailorService.fetchTailors();
    return products;
  }

      Future<Order> fetchOrders(String id) async {
    final orders = await _tailorService.fetchOrders(id);
    return orders;
  }
}
