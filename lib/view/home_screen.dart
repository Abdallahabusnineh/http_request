import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:http_request/model/posts_model.dart';
import 'package:http_request/view/post_builder.dart';
import 'package:http_request/view/show_comment_bottom_sheet.dart';

import '../controller/posts_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<PostsController>(
        init: PostsController(),
        builder: (controller) {
          return FutureBuilder(
            future: controller.getPosts(),
            builder: (BuildContext context,
                AsyncSnapshot<List> snapshot) {
              return
              CustomScrollView(
                slivers: [
                  SliverAppBar(
                    pinned: true,
                    backgroundColor: Colors.blue.shade700,
                    expandedHeight: 200,
                    flexibleSpace: FlexibleSpaceBar(
                        centerTitle: true,
                        collapseMode: CollapseMode.parallax,
                        title: const Text(
                          'Posts App',
                          style: TextStyle(color: Colors.white),
                        ),
                        background: Image.asset(
                          'assets/download.jpeg',
                          fit: BoxFit.cover,
                        )),
                  ),
                 SliverList(
                      delegate: SliverChildBuilderDelegate((context, i) {
                    return PostBuilder(index: controller.posts[i].id-1);
                     //todo
                        //why is this index -1 ?
                  }, childCount: controller.posts.length)),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
