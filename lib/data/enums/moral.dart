enum Moral {
  honesty,
  courage,
  perseverance,
  humility,
  compassion,
  generosity,
  gratitude,
  forgiveness,
  loyalty,
  patience,
  respect,
  responsibility,
  tolerance,
  justice,
  fairness,
  caring,
  kindness,
  optimism,
  trustworthiness,
  wisdom,
}

extension MoralExtension on Moral {
  String get value {
    switch (this) {
      case Moral.honesty:
        return 'Honesty';
      case Moral.courage:
        return 'Courage';
      case Moral.perseverance:
        return 'Perseverance';
      case Moral.humility:
        return 'Humility';
      case Moral.compassion:
        return 'Compassion';
      case Moral.generosity:
        return 'Generosity';
      case Moral.gratitude:
        return 'Gratitude';
      case Moral.forgiveness:
        return 'Forgiveness';
      case Moral.loyalty:
        return 'Loyalty';
      case Moral.patience:
        return 'Patience';
      case Moral.respect:
        return 'Respect';
      case Moral.responsibility:
        return 'Responsibility';
      case Moral.tolerance:
        return 'Tolerance';
      case Moral.justice:
        return 'Justice';
      case Moral.fairness:
        return 'Fairness';
      case Moral.caring:
        return 'Caring';
      case Moral.kindness:
        return 'Kindness';
      case Moral.optimism:
        return 'Optimism';
      case Moral.trustworthiness:
        return 'Trustworthiness';
      case Moral.wisdom:
        return 'Wisdom';
    }
  }
}
