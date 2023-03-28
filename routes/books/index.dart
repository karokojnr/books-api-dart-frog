import 'package:dart_frog/dart_frog.dart';
import '../../models/models.dart';

Response onRequest(RequestContext context) {
  final isAuthenticated = context.read<bool>();
  if (isAuthenticated) {
    try {
      final request = context.request;

      if (request.method == HttpMethod.get) {
        final allBooks = books;
        return Response.json(
          body: {
            'status': 200,
            'message': 'Fetched all book records successfully',
            'data': allBooks,
          },
        );
      } else {
        return Response.json(
          statusCode: 404,
          body: {
            'status': 404,
            'message': 'Invalid request',
          },
        );
      }
    } catch (e) {
      return Response.json(
        statusCode: 500,
        body: {
          'status': 500,
          'message': 'Server error. Something went wrong',
          'error': e.toString(),
        },
      );
    }
  } else {
    return Response.json(
      statusCode: 401,
      body: {
        'status': 401,
        'message': 'You are not authorized to perform this request',
      },
    );
  }
}
