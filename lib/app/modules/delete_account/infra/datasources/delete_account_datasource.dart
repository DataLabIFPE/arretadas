import '../../domain/usecases/delete_account_usecase.dart';

abstract class DeleteAccountDatasource {
  Future<String> deleteAccount(DeleteAccountParams params);
}
