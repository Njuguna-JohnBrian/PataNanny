enum LottieAnimation {
  secure(name: 'secure'),
  faceid(name: "face_id"),
  loading(name: "loading");

  final String name;

  const LottieAnimation({
    required this.name,
  });
}
