# casist2


1. Where to handle failures? (usecase/repo)
   Probably usecase because it is basically service role.

2. Should data sources be just general interface to the data source? Or Include business methods?
   How to use SQLite repository to get/writes different objects? Create one abstract with get/post/put/delete methods and then children will be more business oriented?

Storage
SecureStorage
UserStorage
https://github.com/ResoDev/oauth2_client/blob/master/lib/src/token_storage.dart

CasistApiClient (has http.client)
CasistApiClient passed to RemoteDataSource

RefreshToken
https://github.com/ResoDev/oauth2_client/blob/master/lib/access_token_response.dart

https://github.com/piggyvault/piggyvault/blob/main/src/Mobile/piggy_flutter/lib/utils/rest_client.dart
https://github.com/piggyvault/piggyvault/blob/main/src/Mobile/piggy_flutter/lib/repositories/piggy_api_client.dart

3. When multiple reads/writes need to be called, where to called them? (block/raise multiple events)
   We should probably raise multiple events. Each piece of logic should be single purposed and doesn't do multiple things at once.
   BlockListener dispatches another event?

4. Bloc should only call use case and map success/failures to state.

5. Where to switch between model and entity?
   In repository

6. Should models be more composed based or entities?
   Probably entities and also stored in the storage.

7 Create a themes and use them
https://github.com/hungps/flutter_pokedex/tree/master/lib/configs

8. core vs app directory?	



Everything has to be production ready before, I will move to the home package.
TODO:
1. Logic between model and entity
   https://github.com/svprdga/Flutter-Data-Layer-Repository-Pattern-V2/blob/master/lib/data/mapper.dart
   https://github.com/ResoCoder/finished-flutter-firebase-ddd-course/blob/master/lib/infrastructure/notes/note_repository.dart
2. Translations https://github.com/appditto/natrium_wallet_flutter/tree/master/lib/l10n
3. Refactoring / Search for inconsistencies
4. Tests
5. Group use case to files such as conf_use_cases, auth_use_cases, home_use_cases
6. Use themes and remove duplicated styles in the presentation layer
