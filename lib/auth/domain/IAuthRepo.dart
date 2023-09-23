
abstract class IAuthRepo {
  Future<bool> createUser(String email, String password);

}
