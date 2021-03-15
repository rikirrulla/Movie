class Movie {
  final String id,
      seatsId,
      cinemaName,
      title,
      image,
      director,
      category,
      date,
      registerAt,
      updateAt,
      rating,
      price;

  Movie(
      {this.id,
      this.seatsId,
      this.cinemaName,
      this.title,
      this.image,
      this.director,
      this.category,
      this.date,
      this.registerAt,
      this.updateAt,
      this.rating,
      this.price});
}

List<Movie> movies = [];
