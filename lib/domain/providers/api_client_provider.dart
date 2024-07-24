import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:matricula/core/api_client.dart';

final apiClientProvider = Provider<ApiClient>((ref) => ApiClient());
