import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http_request/controller/comments_controller.dart';

class ShowCommentBottomSheet extends StatelessWidget {
  const ShowCommentBottomSheet({super.key, required this.index,});
final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      padding: EdgeInsets.symmetric(
          horizontal: 20,vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
      ),
      child: GetBuilder(
        init: CommentsController(),
        builder: (controller) {
          return  FutureBuilder(future: controller.getCommentsByPostId(index), builder:
          (context, snapshot) {
            return
             ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return  ListTile(
                  leading:   CircleAvatar(
                    child: Text('${index + 1}',style: TextStyle(color: Colors.white,fontSize: 10),),
                    backgroundColor: Colors.blue.shade700,
                    radius: 25,),
                  title:       Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: ListTile(
                      title:   Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            controller.comments[index].name,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            controller.comments[index].email,
                            style: TextStyle(
                              fontSize: 11,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      subtitle: Text(controller.comments[index].body,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 10
                        ),
                      ),
                    ),
                  ),
                );
              },
              itemCount: controller.comments.length,
              shrinkWrap: true,
            );
          },

          );
        },
      ),
    );
  }
}
