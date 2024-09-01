class ApiUrl {
  //https://jsonplaceholder.typicode.com/comments
  static const String baseUrl = 'https://jsonplaceholder.typicode.com';

  static const String getPosts = '$baseUrl/posts';
  static const String getComments = '$baseUrl/comments';


  static getCommentsByPostId(int postId) => '$baseUrl/posts/$postId/comments';

}