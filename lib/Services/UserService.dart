import 'package:graduation_project/Models/user.dart';
import 'package:http/http.dart' as http;

class CustomerService {
final int Userid;

  CustomerService(this.Userid);
  Future<Customer> userInfo() async {
    final response = await http.get(Uri.parse(
        'https://tailorapp-6e6fc-default-rtdb.firebaseio.com/Users/${Userid}'));
    if (response.statusCode == 200) {
      // print(response.body);
      return CustomerFromJson(response.body);
    } else {
      throw Exception('FAILED TO LOAD POST');
    }
  }
}