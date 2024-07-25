import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:matricula/services/auth_services.dart';

final authProviders = Provider<AuthServices>((ref) => AuthServices());
