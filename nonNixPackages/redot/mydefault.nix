{ stdenv, fetchzip,
	libdecor,
  libGL,
  libpulseaudio,
  libX11,
  libXcursor,
  libXext,
  libXfixes,
  libXi,
  libXinerama,
  libxkbcommon,
  libXrandr,
  libXrender,
  fontconfig,
  vulkan-loader,
  wayland,
  wayland-scanner,
	}:
stdenv.mkDerivation rec {
	pname = "Redot";
	version = "4.3";
	src = fetchzip {
		url = "https://github.com/Redot-Engine/redot-engine/releases/download/redot-${version}-stable/Redot_v${version}-stable_linux.x86_64.zip";
		sha256 = "sha256-i9TFL6Zzv7VmyevI2kg/REw3Ylr6rUhBfxDsPuONZf4=";
	};

	installPhase = ''
		mkdir -p $out/bin
		cp $src/Redot_v${version}-stable_linux.x86_64 $out/bin
	'';
}
