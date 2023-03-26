import 'package:dart_frog/dart_frog.dart';

import '../helpers/helpers.dart';
import '../services/services.dart';

final mongoDbService = MongoService();

Handler middleware(Handler handler) {
  return handler.use(
    provider<Future<MongoService>>((_) async {
      await mongoDbService.initializeMongo();
      return mongoDbService;
    }),
  ).use(
    (handler) => handler.use(authorize()),
  );
}
