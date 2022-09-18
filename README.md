# casist2

A new Flutter application.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.





1. Where to handle failures? (usecase/repo)
   Probably usecas because it is basically service role.

2. Should data sources be just general interface to the source? Or Include business methods?
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

5. Where to switch between model and entity!?
   In repository

6. Should models be more composed based or entities?
   Probably entities and also stored to the storage.

7 Create a themes and use them
https://github.com/hungps/flutter_pokedex/tree/master/lib/configs

8. core vs app directory?	

