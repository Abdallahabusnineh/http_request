import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http_request/controller/posts_controller.dart';
import 'package:http_request/model/posts_model.dart';
import 'package:http_request/view/show_comment_bottom_sheet.dart';

class PostBuilder extends StatelessWidget {
  const PostBuilder({Key? key, required this.index}) : super(key: key);
final int index ;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GetBuilder<PostsController>(
        init: PostsController(),
        builder: (controller) {
        return  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // User Info
              Row(
                children: [
                  CircleAvatar(
                    child: Text('${index + 1}'),
                    backgroundColor: Colors.grey.shade300,
                    radius: 25,
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                controller.posts[index].title,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            IconButton(onPressed:(){} , icon: Icon(Icons.close)),
                            IconButton(onPressed:(){} , icon: Icon(Icons.more_vert)),

                            ],
                        ),
                        Text(
                          '25m .',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              // Post Content
              Text(
                controller.posts[index].body,
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),

              // Post Actions
              Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.thumb_up_off_alt),
                          onPressed: () {},
                        ),
                        Expanded(
                            child: Text(
                              'Like',
                              maxLines: 1,
                            )),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.comment_outlined),
                          onPressed: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return ShowCommentBottomSheet(
                                  index: index+1,
                                );
                              },
                            );
                          },
                        ),
                        Expanded(
                            child: Text(
                              'Comment',
                              maxLines: 1,
                            )),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.ios_share_outlined),
                          onPressed: () {},
                        ),
                        Expanded(
                            child: Text(
                              'Share',
                              maxLines: 1,
                            )),
                      ],
                    ),
                  ),
                ],
              ),
              Divider(),
            ],
          );
        },
      ),
    );
  }
}
