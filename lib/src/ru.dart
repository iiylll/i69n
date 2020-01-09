import 'package:i69n/i69n.dart';

///
/// Quantity category resolver for czech.
///
/// See:
///
/// https://www.unicode.org/cldr/charts/latest/supplemental/language_plural_rules.html#cs
///
///
QuantityCategory quantityResolver(int count, QuantityType type) {
  if (type == QuantityType.ordinal) return _resolveOrdinal(count);
  return _resolveCardinal(count);
}

QuantityCategory _resolveCardinal(int count) {
  var mod10 = count % 10;
  var mod100 = count % 100;
  if (mod100 < 20 && mod100 > 10) {
    return QuantityCategory.other;
  }
  switch (mod10) {
    case 1:
      return QuantityCategory.one;
    case 2:
      return QuantityCategory.two;
    case 3:
      return QuantityCategory.two;
    case 4:
      return QuantityCategory.two;
    case 5:
      return QuantityCategory.few;
  }
  return QuantityCategory.other;
}

QuantityCategory _resolveOrdinal(int count) {
  return QuantityCategory.other;
}
