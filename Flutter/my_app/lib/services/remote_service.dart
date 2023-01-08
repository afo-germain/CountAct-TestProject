import 'package:my_app/models/profession.dart';
import 'package:http/http.dart' as http;

class RemoteSevice {
  static const baseUrl =
      'https://labonnealternance.apprentissage.beta.gouv.fr/api/V1/';

  Future<Professions?> getProfessions() async {
    const professionEndPoint = 'metiers/all';

    var client = http.Client();

    var uri = Uri.parse(baseUrl + professionEndPoint);
    var response = await client.get(uri);

    if (response.statusCode == 200) {
      var json = response.body;

      return professionsFromJson(json);
    }
  }
}
