enum FlightType { fromSyria, toSyria, roundTrip }

enum FeedbackClassification {
  all,
  positive,
  negative,
  oneStar,
  twoStar,
  threeStar,
  fourStar,
  fiveStar,
}

enum PostStatus { pending, approved, rejected }

enum PostsFilter { all, approved, pending, rejected }

enum SearchTypes {
  event,
  trip,
  tourist,
  restaurant,
  hotel,
  article,
  company,
  post,
}

extension SearchTypesX on SearchTypes {
  String get asQueryParam {
    switch (this) {
      case SearchTypes.event:
        return "event";
      case SearchTypes.trip:
        return "trip";
      case SearchTypes.tourist:
        return "tourist";
      case SearchTypes.restaurant:
        return "restaurant";
      case SearchTypes.hotel:
        return "hotel";
      case SearchTypes.article:
        return "article";
      case SearchTypes.company:
        return "company";
      case SearchTypes.post:
        return "post";
    }
  }
}
