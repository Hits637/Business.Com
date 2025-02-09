import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

class NewsService {
  final String apiToken = "a3357eef23034d63aee4308b4751ede6";
  final String apiUrl = "https://newsapi.org/v2/everything";

  Future<List<dynamic>> fetchVarietyNews() async {
    final response = await http.get(
      Uri.parse(
          'https://newsdata.io/api/1/news?apikey=pub_6674373929de07d1ffb286b9caff3d5644281&q=Business,startups&country=in&language=en'),
    );
    // ignore: unnecessary_string_interpolations
    log("${response.body}");
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      log("${response.statusCode}");

      // Print the entire response body for debugging
      print('Response body: ${response.body}');

      if (data['results'] != null && data['results'].isNotEmpty) {
        return data['results'].map((article) {
          return {
            'title': article['title'],
            'description': article['description'],
            'image_url': article['image_url'],
            'link': article['link']
          };
        }).toList(); // Extract relevant fields
      } else {
        throw Exception('No news found for your query.');
      }
    } else {
      print('Error Response: ${response.body}');
      throw Exception('Failed to load variety news');
    }
  }
}
