class Orders {
  final String id,
      user,
      movie,
      cinema,
      seat,
      time,
      order,
      price,
      code;

  Orders({
    this.id,
    this.user,
    this.movie,
    this.cinema,
    this.seat,
    this.time,
    this.order,
    this.price,
    this.code,
  });
}

List<Orders> orders = [];
