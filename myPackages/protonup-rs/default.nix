{ fetchFromGitHub, rustPlatform, ... }:
rustPlatform.buildRustPackage rec{
  pname = "protonup-rs";
  version = "0.9.1";
  src = fetchFromGitHub {
    owner = "auyer";
    repo = "Protonup-rs";
    rev = "v${version}";
    sha256 = "sha256-FaWSiFTaYGK5Izbe+Xj3v1E1saDTgPWmLrIr8e6Atis=";
  };

  cargoHash = "sha256-8agfPwbcMjdnqqXZ3w+dUhS2XzZNgZg39pbb6z9tpMc=";

  checkFlags = [
    "--skip=downloads::tests::test_list_releases"
    "--skip=downloads::tests::test_get_release"
  ];
}
