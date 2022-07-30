class USers {
  final String username;
  final String uid;
  final String bio;
  final String email;
  final String photourl;
  final List followers;
  final List following;

  const USers({
    required this.username,
    required this.uid,
    required this.bio,
    required this.email,
    required this.photourl,
    required this.followers,
    required this.following,
  });
  Map<String, dynamic> toJson() => {
        'username': username,
        'uid': uid,
        'email': email..toLowerCase().trim(),
        'bio': bio,
        'followers': followers,
        'following': following,
        'profilePicture': photourl,
      };
}
