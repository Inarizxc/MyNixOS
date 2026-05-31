{ rustPlatform, fetchFromGitHub }:
rustPlatform.buildRustPackage (finalAttrs:{
  __structuredAttrs = true;

  pname = "todomgr";
  version = "0.1.2";
  src = fetchFromGitHub {
    owner = "Inarizxc";
    repo = "todomgr";
    tag = "v${finalAttrs.version}";
    hash = "sha256-9G/inrhaPR4uLUwgo/OOqMTtefbtNDYYOlbYBey1HfE=";
  };

  cargoHash = "sha256-MWCK3ICg1UahokMy+zaUaAFmUf3wp/50aHkzDFQZs+Y=";
})
