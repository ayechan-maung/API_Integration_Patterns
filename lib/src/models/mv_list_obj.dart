class MvListObj {
  Dates? dates;
  int? page;
  List<MvResults>? results;
  int? totalPages;
  int? totalResults;

  MvListObj({this.dates, this.page, this.results, this.totalPages, this.totalResults});

  MvListObj.fromJson(Map<String, dynamic> json) {
    dates = json['dates'] != null ? Dates.fromJson(json['dates']) : null;
    page = json['page'];
    if (json['results'] != null) {
      results = <MvResults>[];
      json['results'].forEach((v) {
        results!.add(MvResults.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }
}

class Dates {
  String? maximum;
  String? minimum;

  Dates({this.maximum, this.minimum});

  Dates.fromJson(Map<String, dynamic> json) {
    maximum = json['maximum'];
    minimum = json['minimum'];
  }
}

class MvResults {
  String? backdropPath;
  int? id;
  String? originalTitle;
  String? posterPath;
  String? voteAverage;

  MvResults({this.backdropPath, this.id, this.originalTitle, this.posterPath, this.voteAverage});

  MvResults.fromJson(Map<String, dynamic> json) {
    backdropPath = json['backdrop_path'];
    id = json['id'];
    originalTitle = json['original_title'];
    posterPath = json['poster_path'];
    voteAverage = json['vote_average'].toString();
  }
}
