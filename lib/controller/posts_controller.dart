import 'dart:convert';

import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart';
import 'package:http_request/shared/core/network/apis_url.dart';

import '../model/posts_model.dart';
import '../shared/core/network/error_message_model.dart';

class PostsController extends GetxController{
  List posts=[];
  Future<List> getPosts()async{

    var response=await get(
      Uri.parse(ApiUrl.getPosts),
    );

    if(response.statusCode==200){
    try{
      List jsonResponse = jsonDecode(response.body);
      posts=jsonResponse.map((e) => PostsModel.fromJson(e)).toList();
    }
    catch(e){
      ErrorMessageModel(message: 'some error when fetching posts from server ${e}');

    }
    }
    update();
  return posts;
  }


}