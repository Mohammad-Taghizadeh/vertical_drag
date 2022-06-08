class Profile {
  String? name;
  String? imagePath;
  String? country;
  String? city;
  int? follower;
  int? posts;
  int? following;

  Profile({
    this.name,
    this.imagePath,
    this.country,
    this.city,
    this.follower,
    this.following,
    this.posts,
});
}

final List<Profile> profiles = [
  Profile(
    name: "Steve Jobs",
    city: "San Francisco, California",
    country: "U.S",
    imagePath: "assets/image/steve.jpg",
    follower: 1500,
    following: 100,
    posts: 50
  ),
  Profile(
      name: "William Henry Gates",
      city: "Seattle, Washington",
      country: "U.S",
      imagePath: "assets/image/bill.jpg",
      follower: 800,
      following: 150,
      posts: 100
  ),
  Profile(
      name: "Elon Reeve Musk",
      city: "Pretoria, Transvaal",
      country: "South Africa",
      imagePath: "assets/image/elon.jpg",
      follower: 950,
      following: 60,
      posts: 10
  ),
];