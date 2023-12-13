import 'package:invidious/settings/models/errors/cannot_add_server_error.dart';

class MissingSoftwareKeyError extends CannotAddServerError {
  MissingSoftwareKeyError(String error) : super(error: error);
}
