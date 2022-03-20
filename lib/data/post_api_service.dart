import 'package:chopper/chopper.dart';

// Source code generation in Dart works by creating a new file which contains a "companion class".
// In order for the source gen to know which file to generate and which files are "linked", you need to use the part keyword.
part 'post_api_service.chopper.dart';

@ChopperApi(baseUrl: '/posts')
abstract class PostApiService extends ChopperService {
  //Instantiating a ChopperClient
  static PostApiService create() {
    final client = ChopperClient(
      baseUrl: 'https://jsonplaceholder.typicode.com',
      services: [_$PostApiService()],
      converter: const JsonConverter(),
      interceptors: [
        const HeadersInterceptor(
          {'Cache-Control': 'no-cache'},
        ),
        HttpLoggingInterceptor(),
      ],
    );

    return _$PostApiService(client);
  }

  @Get()
  Future<Response> getPosts();

  @Get(path: '/{id}')
  Future<Response> getPost(@Path('id') int id);

  @Post()
  Future<Response> postPost(@Body() Map<String, dynamic> body);
}
