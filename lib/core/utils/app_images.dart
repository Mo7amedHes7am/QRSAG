class AppImages {
  const AppImages._();
  static const Json = _Json();
  static const Logos = _Logos();
  static const Images = _Images();
  static const Gifs = _Gifs();
  static const Svgs = _Svgs();
}

class _Json {
  const _Json();
}

class _Logos {
  const _Logos();
}

class _Images {
  const _Images();
}

class _Svgs {
  const _Svgs();

  final String nodata = 'assets/Svgs/nodata.svg';
}

class _Gifs {
  const _Gifs();
  final String loading = "assets/Gifs/loading.gif";
  final String error = "assets/Gifs/error.gif";
}
