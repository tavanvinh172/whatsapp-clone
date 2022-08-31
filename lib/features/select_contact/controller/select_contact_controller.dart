import 'package:flutter/cupertino.dart';
import 'package:flutter_contacts/contact.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_whatsapp_clone/features/select_contact/repository/select_contact_repository.dart';

final getContactsProvider = FutureProvider<List<Contact>>((ref) {
  final selectContactRepository = ref.watch(selectContactRepositoryProvider);
  return selectContactRepository.getContacts();
});

final selectContactControllerProvider =
    Provider<SelectContactController>((ref) {
  final selectContactRepository = ref.watch(selectContactRepositoryProvider);

  return SelectContactController(
      ref: ref, selectContactRepository: selectContactRepository);
});

class SelectContactController {
  final ProviderRef ref;
  final SelectContactRepository selectContactRepository;

  SelectContactController(
      {required this.ref, required this.selectContactRepository});

  void selectContact(Contact selectContact, BuildContext context) {
    selectContactRepository.selectContact(selectContact, context);
  }
}
