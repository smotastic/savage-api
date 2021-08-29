# savage-api
Api wrapper for the savage-worlds api written in dart.

Behind the scenes, a postgrest server is used to expose my savage world data in this api wrapper.

# Usage
First you need to initialize an instance of the `SavageApi`
```dart
void main() {
    final api = SavageApi.postgrest(token: token); 
}
```
By default my postgrest server, hosted by supabase will be used for the SavageApi.
You just need to supply the token, to be able to read the data.

Optionally you can also supply your own url and token, to use your own postgrest server.
Then your database needs to follow database schema shown later.

After you aquired your savageapi instance, you can start querying the data.
```dart
// queries 10 abilities starting at offset 0
api.ability().page(0, 10);
// queries the equipment with id 4
api.equipment().get(4);
```
The result of each query will be an Either, resulting either in the actual result, or an `ApiFailure`.
The Either get's provided by [dartz](https://pub.dev/packages/dartz).
```dart
final result = api.ability().get(1); // ability with id 1
final ability = result.getOrElse(
    () => throw Exception());
print(ability.id);
```

# Customization
The default endpoints will always supply the full object, with all attributes set.
If needed, the api can be extended, to e.g. only fetch a certain column of a certain table, to show in a datatable.

Also see `custom_api_test.dart`
```dart
// first create your model, what the api should return
@JsonSerializable()
class CustomAbilityResource {
    final String name;
    CustomAbilityResource(this.name);

    factory CustomAbilityResource.fromJson(Map<String, dynamic> json) {
        return _$CustomAbilityResourceFromJson(json);
    }
}
```
I use [json_serializable](https://pub.dev/packages/json_serializable) to quickly generate my `fromJson` Method. If you want to do it another way, the next step is not needed.
Else run the build_runner.
```
dart run build_runner build
```

Next, create an endpoint and a converter.
```dart
class CustomAbilityEndpoint extends BaseEndpoint<CustomAbilityResource>
    // optionally mixin the PaginatedEndpoint to get paginating functionality
    with PaginatedEndpoint<CustomAbilityResource>, 
    // or the detail endpoint to get the read by id functionality
    DetailEndpoint<CustomAbilityResource> {
        // which table to select from
        @override
        String get from => 'ability';

        // what columsn to select by default
        // defaults to *
        @override
        String get columns => 'name';
}
```
The endpoint is the interface which you'll use to read from the api.
```dart
class CustomAbilityConverter extends Converter<CustomAbilityResource> {
      @override
    CustomAbilityResource fromJson(Map<String, dynamic> json) {
        return CustomAbilityResource.fromJson(json);
    }
}
```
The converter will be used to transform the received json in your model, after requesting the data.
Now extend the SavageApi with the new endpoint.
```dart
extension CustomSavageApi on SavageApi {
  CustomAbilityEndpoint customAbility() {
    return CustomAbilityEndpoint(client); // client get's provided by SavageApi
  }
}
```
When creating your SavageApi, make sure to also pass your new Converter.
```dart
final Map<Type, Converter> additionalConverter = {
  CustomAbilityResource: CustomAbilityConverter(),
};
final api = SavageApi.postgrest(token: token, converterFactory: ConverterFactory(additionalConverter));
```
You should now be able to call your custom endpoint, which will only select the name column, and only populate the model with the received data.
```dart
api.customAbility().get(5);
```

# Database schema
## Ability
A table named `ability`.

| column   | type |  |
|------|--------|------------|
| id   | bigint | primarykey |
| name | text   |            |
| attribute | text |         |
| description | text |       |

TODO