# Flutter Easy DropdownSearch

[![Flutter](https://img.shields.io/badge/Flutter-%2302569B.svg?style=for-the-badge&logo=Flutter&logoColor=white)](https://flutter.dev)
[![pub package](https://img.shields.io/pub/v/flutter_easy_dropdown.svg)](https://pub.dev/packages/flutter_easy_dropdown)
[![likes](https://img.shields.io/pub/likes/flutter_easy_dropdown)](https://pub.dev/packages/flutter_easy_dropdown/score)
[![popularity](https://img.shields.io/pub/popularity/flutter_easy_dropdown)](https://pub.dev/packages/flutter_easy_dropdown/score)
[![pub points](https://img.shields.io/pub/points/flutter_easy_dropdown)](https://pub.dev/packages/flutter_easy_dropdown/score)

A powerful and flexible Flutter dropdown search widget with pagination support, built on top of dropdown_search. This package provides an enhanced dropdown experience with features like network API integration, pagination, and customizable UI.

<p align="center">
  <img src="https://github.com/rohitsoni9/easy_dropdown/blob/master/screenshots/example.gif?raw=true" alt="Dropdown search demo" width="300" />
</p>

## ✨ Features

- 🔄 **Pagination Support**: Load data in chunks for better performance
- 🌐 **Network Integration**: Fetch data from APIs with ease
- 🔍 **Searchable**: Built-in search functionality
- 🎨 **Multiple Display Modes**:
  - Menu
  - BottomSheet
  - ModalBottomSheet
  - Dialog
- ✅ **Selection Types**:
  - Single selection
  - Multi-selection
- 🎯 **Customizable UI**: Match your app's theme
- 🌓 **Theme Support**: Works with both light and dark themes
- 📱 **StatelessWidget Support**: Easy implementation
- 🏗️ **Multi-level Items**: Support for hierarchical data

## 📸 Screenshots

<div align="center">
  <table>
    <tr>
      <td><img src="https://github.com/rohitsoni9/easy_dropdown/blob/master/screenshots/ex4.png?raw=true" alt="Example 1" width="200"/></td>
      <td><img src="https://github.com/rohitsoni9/easy_dropdown/blob/master/screenshots/ex1.png?raw=true" alt="Example 2" width="200"/></td>
    </tr>
    <tr>
      <td><img src="https://github.com/rohitsoni9/easy_dropdown/blob/master/screenshots/ex2.png?raw=true" alt="Example 3" width="200"/></td>
      <td><img src="https://github.com/rohitsoni9/easy_dropdown/blob/master/screenshots/ex3.png?raw=true" alt="Example 4" width="200"/></td>
    </tr>
  </table>
</div>

## 📦 Installation

Add the following to your `pubspec.yaml`:

```yaml
dependencies:
  flutter_easy_dropdown: ^latest_version
```

## 🚀 Quick Start

### Basic Usage

```dart
import 'package:flutter_easy_dropdown/flutter_easy_dropdown.dart';

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
```

### Multi-Selection Example

```dart
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

## 🔧 Advanced Usage

### Custom Item Display

```dart
DropdownSearch<UserModel>(
  asyncItems: (String filter) => getData(filter),
  itemAsString: (UserModel u) => u.userAsStringByName(),
  onChanged: (UserModel? data) => print(data),
  dropdownDecoratorProps: DropDownDecoratorProps(
    dropdownSearchDecoration: InputDecoration(labelText: "User by name"),
  ),
)
```

### Custom Filter Function

```dart
DropdownSearch<UserModel>(
  filterFn: (user, filter) => user.userFilterByCreationDate(filter),
  asyncItems: (String filter) => getData(filter),
  itemAsString: (UserModel u) => u.userAsStringByName(),
  onChanged: (UserModel? data) => print(data),
  dropdownDecoratorProps: DropDownDecoratorProps(
    dropdownSearchDecoration: InputDecoration(labelText: "Name"),
  ),
)
```

### API Integration Example

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

### Form Validation

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

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## ⭐ Support

If you find this package useful, please consider giving it a star on GitHub. Your support helps us maintain and improve the package!