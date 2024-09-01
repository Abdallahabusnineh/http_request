import 'dart:convert';

import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart';

import '../model/comments_model.dart';
import '../model/posts_model.dart';
import '../shared/core/network/apis_url.dart';
import '../shared/core/network/error_message_model.dart';

class CommentsController extends GetxController{
  List <CommentsModel>comments=[];


  Future<List<CommentsModel>> getCommentsByPostId(int postId)async{

    var response=await get(
      Uri.parse(ApiUrl.getCommentsByPostId(postId)),
    );
    if(response.statusCode==200){
      try{
        List jsonResponse = jsonDecode(response.body);
        comments=jsonResponse.map((e) => CommentsModel.fromJson(e)).toList();
         }
      catch(e){
        ErrorMessageModel(message: 'some error when fetching comment from server ${e}');
      }
    }
    update();
    return comments;
  }
}