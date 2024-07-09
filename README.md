<h4> I am developing a new plugin flutter_easy_dropdown that uses the latest version dropdown_search. I have added new features in this new plugin like a pagintion in dropdown list using netwok APIs.
</h4>

<h1 align="center">
  Flutter Easy DropdownSearch
  <br>
</h1>

<h4 align="center">
  <a href="https://flutter.io" target="_blank">Flutter</a> simple and robust Easy DropdownSearch with item search feature, making it possible to use an offline item list or filtering URL for easy customization with PAGINATION VIEW.
</h4>

<p align="center">
  <img src="https://github.com/rohitsoni9/easy_dropdown/blob/master/screenshots/example.gif?raw=true" alt="Dropdown search" />
</p>

## Key Features

* Dropdown with pagination
* Sync and/or Async items (online, offline, DB, ...)
* Searchable dropdown
* Three dropdown mode: Menu/ BottomSheet/ ModalBottomSheet / Dialog
* Single & multi selection
* Material dropdown
* Easy customizable UI
* Handle Light and Dark theme
* Easy implementation into statelessWidget
* Support multi level items

<table>
    <tr>
        <td>
            <img height="254" src="https://github.com/rohitsoni9/easy_dropdown/blob/master/screenshots/ex4.png?raw=true" alt="Dropdown search" />
        </td>
        <td>
            <img height="254" src="https://github.com/rohitsoni9/easy_dropdown/blob/master/screenshots/ex1.png?raw=true" alt="Dropdown search" />
        </td>
    </tr>
    <tr>
        <td>
            <img height="254" src="https://github.com/rohitsoni9/easy_dropdown/blob/master/screenshots/ex2.png?raw=true" alt="Dropdown search" />
        </td>
        <td>
            <img height="254" src="https://github.com/rohitsoni9/easy_dropdown/blob/master/screenshots/ex3.png?raw=true" alt="Dropdown search" />
        </td>
    </tr>
</table>

## packages.yaml
```yaml
flutter_easy_dropdown: <lastest version>
```

## Import
```dart
import 'package:flutter_easy_dropdown/flutter_easy_dropdown.dart';
```


## Simple implementation

```dart
DropdownSearch<String>(
    popupProps: PopupProps.menu(
        showSelectedItems: true,
        disabledItemFn: (String s) => s.startsWith('I'),
    ),
    items: ["Brazil", "Italia (Disabled)", "US", 'Canada'],
    dropdownDecoratorProps: DropDownDecoratorProps(
        dropdownSearchDecoration: InputDecoration(
            labelText: "Menu mode",
            hintText: "country in menu mode",
        ),
    ),
    onChanged: print,
    selectedItem: "Brazil",
)

DropdownSearch<String>.multiSelection(
    items: ["Brazil", "Italia (Disabled)", "London", 'Canada'],
    popupProps: PopupPropsMultiSelection.menu(
        showSelectedItems: true,
        disabledItemFn: (String s) => s.startsWith('I'),
    ),
    onChanged: print,
    selectedItems: ["Brazil"],
)
```

## customize showed field (itemAsString)

```dart
DropdownSearch<UserModel>(
    asyncItems: (String filter) => getData(filter),
    itemAsString: (UserModel u) => u.userAsStringByName(),
    onChanged: (UserModel? data) => print(data),
    dropdownDecoratorProps: DropDownDecoratorProps(
        dropdownSearchDecoration: InputDecoration(labelText: "User by name"),
    ),
)

DropdownSearch<UserModel>(
    asyncItems: (String filter) => getData(filter),
    itemAsString: (UserModel u) => u.userAsStringById(),
    onChanged: (UserModel? data) => print(data),
    dropdownDecoratorProps: DropDownDecoratorProps(
        dropdownSearchDecoration: InputDecoration(labelText: "User by id"),
    ),
)
```

## customize Filter Function
```dart
DropdownSearch<UserModel>(
    filterFn: (user, filter) =>
    user.userFilterByCreationDate(filter),
    asyncItems: (String filter) => getData(filter),
    itemAsString: (UserModel u) => u.userAsStringByName(),
    onChanged: (UserModel? data) => print(data),
    dropdownDecoratorProps: DropDownDecoratorProps(
        dropdownSearchDecoration: InputDecoration(labelText: "Name"),
    ),
)
```

## customize Search Mode
```dart
DropdownSearch<UserModel>(
    popupProps: PopupProps.bottomSheet(),
    dropdownSearchDecoration: InputDecoration(labelText: "Name"),
    asyncItems: (String filter) => getData(filter),
    itemAsString: (UserModel u) => u.userAsString(),
    onChanged: (UserModel? data) => print(data),
)
```

## Validation
```dart
DropdownSearch(
    items: ["Brazil", "France", "Tunisia", "Canada"],
    dropdownSearchDecoration: InputDecoration(labelText: "Name"),
    onChanged: print,
    selectedItem: "Tunisia",
    validator: (String? item) {
    if (item == null)
      return "Required field";
    else if (item == "Brazil")
      return "Invalid item";
    else
      return null;
    },
)
```


## Endpoint implementation (using [Dio package](https://pub.dev/packages/dio))
```dart
DropdownSearch<UserModel>(
    dropdownSearchDecoration: InputDecoration(labelText: "Name"),
    asyncItems: (String filter) async {
        var response = await Dio().get(
            "http://5d85ccfb1e61af001471bf60.mockapi.io/user",
            queryParameters: {"filter": filter},
        );
        var models = UserModel.fromJsonList(response.data);
        return models;
    },
    onChanged: (UserModel? data) {
      print(data);
    },
)

```

## Support

If this plugin was useful to you, helped you to deliver your app, saved you a lot of time, or you just want to support the project.