import 'package:http/http.dart' as http;

Future<void> getItemList() async {
  final _response = await http.get(Uri.parse(
      'http://foodmallapifortesting.pulseerp.co.in/api//ItemList?itemGroupId=?'));
  print(_response.body);
}
