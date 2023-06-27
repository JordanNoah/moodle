import 'package:dio/dio.dart';
import 'package:moodle/models/conversation_model.dart';


class GetConversationMessage{
  final _dio = Dio();

  Future<ConversationModel> getFullAnswer(String convid) async{
    final response =  await _dio.get(
      'http://192.168.100.204/moodle/webservice/rest/server.php',
      queryParameters: {
        "moodlewsrestformat":"json",
        "wsfunction":"local_additional_web_service_conversation_messages",
        "wstoken":"95936039b83b08bcc9e1059e07a552bc",
        "currentuserid":"4",
        "convid":convid
      });
      return ConversationModel.fromJsonMap(response.data);
  }
}