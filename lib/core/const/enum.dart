enum SortOption { popular, bestSelling, bestScore, latest }

extension SortOptionExtension on SortOption {
  String get label {
    switch (this) {
      case SortOption.popular:
        return 'Popular';
      case SortOption.bestSelling:
        return 'Best Selling';
      case SortOption.bestScore:
        return 'Best Score';
      case SortOption.latest:
        return 'Latest';
      default:
        return 'Popular';
    }
  }

  String get value {
    switch (this) {
      case SortOption.popular:
        return 'popularity.desc';
      case SortOption.bestSelling:
        return 'revenue.desc';
      case SortOption.bestScore:
        return 'vote_average.desc';
      case SortOption.latest:
        return 'primary_release_date.desc';
      default:
        return 'Popular';
    }
  }
}
