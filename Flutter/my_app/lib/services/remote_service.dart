import 'package:my_app/models/profession.dart';
import 'package:my_app/models/training.dart';
import 'package:http/http.dart' as http;

class RemoteSevice {
  static const baseUrl = 'labonnealternance.apprentissage.beta.gouv.fr';

  Future<Professions?> getProfessions() async {
    const professionEndPoint = '/api/V1/metiers/all';

    var client = http.Client();

    var uri = Uri.https(baseUrl, professionEndPoint);
    var response = await client.get(uri);

    if (response.statusCode == 200) {
      var json = response.body;

      return professionsFromJson(json);
    }
  }

  Future<Training?> getTrainings() async {
    const trainingEndPoint = '/api/V1/formationsParRegion';

    var trainingParams = {
      'romes': 'M1805,F1603,I1308',
      //'region': '27',
      'caller': 'contact@domaine',
      'opco': 'akto'
    };

    var client = http.Client();

    //var uri = Uri.parse(baseUrl + trainingEndPoint);
    var uri = Uri.https(baseUrl, trainingEndPoint, trainingParams);
    var response = await client.get(uri);

    if (response.statusCode == 200) {
      var body = response.body;

      return trainingFromJson(body);
    }
  }
}
