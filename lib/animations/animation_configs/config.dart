enum LottieAnimation {
  secure(name: 'secure'),
  faceid(name: "face_id"),
  loading(name: "loading"),
  success(name: "success"),
  soon(name: "soon");

  final String name;

  const LottieAnimation({
    required this.name,
  });
}
