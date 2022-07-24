import 'dart:collection' show HashMap, Queue;

bool isNullOrEmpty(dynamic x) {
  assert(x == null ||
      x is String ||
      x is List ||
      x is Map ||
      x is HashMap ||
      x is Queue ||
      x is Set);

  if (x == null) {
    return true;
  }

  if (x is String) {
    return x.isEmpty;
  }

  if (x is List) {
    return x.isEmpty;
  }

  if (x is Map) {
    return x.isEmpty;
  }

  if (x is HashMap) {
    return x.isEmpty;
  }

  if (x is Queue) {
    return x.isEmpty;
  }

  if (x is Set) {
    return x.isEmpty;
  }

  return true;
}

bool isNotNullOrEmpty(dynamic x) {
  assert(x == null ||
      x is String ||
      x is List ||
      x is Map ||
      x is HashMap ||
      x is Queue ||
      x is Set);

  if (x == null) {
    return false;
  }

  if (x is String) {
    return x.isNotEmpty;
  }

  if (x is List) {
    return x.isNotEmpty;
  }

  if (x is Map) {
    return x.isNotEmpty;
  }

  if (x is HashMap) {
    return x.isNotEmpty;
  }

  if (x is Queue) {
    return x.isNotEmpty;
  }

  if (x is Set) {
    return x.isNotEmpty;
  }

  return false;
}

bool isNull(dynamic x) {
  return x == null;
}

bool isNotNull(dynamic x) {
  return x != null;
}

String enumToString<T>(T value) {
  if (isNull(value)) {
    return null;
  }

  final rawValue = value.toString().split('.').last.split('_');
  String result = '';
  for (var i = 0; i < rawValue.length; i++) {
    if (i == rawValue.length - 1) {
      result += rawValue[i];
    } else {
      result += '${rawValue[i]} ';
    }
  }
  return result;
}
