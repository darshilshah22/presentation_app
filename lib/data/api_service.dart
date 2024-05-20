import 'dart:convert';
import 'package:http/http.dart' as http;

import '../constants/constants.dart';

Future<List<dynamic>?> fetchLessonPlanData(int lessonId) async {
  try {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'lesson_id': lessonId,
      }),
    );

    if (response.statusCode == 200) {
      List<dynamic> jsonList = json.decode(response.body);
      return jsonList;
    } else {
      // Handle server errors
      print('Failed to load data: ${response.statusCode}');
      return null;
    }
  } catch (e) {
    // Handle other types of errors (e.g., network errors)
    print('Error: $e');
    return null;
  }
}
