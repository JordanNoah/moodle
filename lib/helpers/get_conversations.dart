import 'package:dio/dio.dart';
import 'package:moodle/models/conversations_model.dart';

class GetConversations {
  final _dio = Dio();

  Future <ConversationsModel> getFullAnswer() async{

    Map<String, String> data = {
      "moodlewsrestformat":"json",
      "wsfunction":"local_additional_web_service_conversations_list_by_user_id",
      "wstoken":"95936039b83b08bcc9e1059e07a552bc",
      "userid":"4"
    }; 

    final response = await _dio.post(
      'http://192.168.100.204/moodle/webservice/rest/server.php',
      data: data,
      options: Options(
        contentType: Headers.formUrlEncodedContentType
      )
    );

    return ConversationsModel.fromJsonMap(response.data);
  }
}