
import 'package:http/http.dart' as http;

var url = Uri.parse('https://www.induced.me/api/moneyin');
var response = await http.post(url, body: {'userid': 1233, 'ammount': 20});
print('Response status: ${response.statusCode}');
print('Response body: ${response.body}');
