{ rustPlatform, fetchFromGitHub }:
rustPlatform.buildRustPackage (finalAttrs:{
  __structuredAttrs = true;

  pname = "todomgr";
  version = "0.1.4";
  src = fetchFromGitHub {
    owner = "Inarizxc";
    repo = "todomgr";
    tag = "v${finalAttrs.version}";
    hash = "sha256-6J+duOD2llINKICNW219clwsuxA9rhDSDCfFHSN8ih8=";
  };

  cargoHash = "sha256-1VVKR4cXmw98kRkWJR3qfhGkncWpheaScUwsxyAUORY=";
})
