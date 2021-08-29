Setup your API and start requesting data.
```dart
final api = SavageApi.postgrest(token: token); 
// queries 10 abilities starting at offset 0
api.ability().page(0, 10);
// queries the equipment with id 4
api.equipment().get(4);
```