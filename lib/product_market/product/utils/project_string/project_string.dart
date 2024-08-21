enum ProjectString { beauty, fragrances, furniture, groceries }

extension ProjectStringExtension on ProjectString {
  String projectToString() {
    switch (this) {
      case ProjectString.beauty:
        return 'beauty';
      case ProjectString.fragrances:
        return 'fragrances';
      case ProjectString.furniture:
        return 'furniture';
      case ProjectString.groceries:
        return 'groceries';
    }
  }
}
