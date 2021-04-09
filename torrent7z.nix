with import <nixpkgs> { };
stdenv.mkDerivation {
  name = "torrent7z";
  src = fetchFromGitHub {
    owner = "BubblesInTheTub";
    repo = "torrent7z";
    rev = "817405d1937e0dc679e455b15a7100a5aed10be4";
    sha256 = "Y2tr0+z9uij4Ifi6FfWRN24BwcDXUZKVLkLtKUiVjU4=";
  };
  patches = [
    (fetchpatch {
      name = "fixgcc.patch";
      url = "https://github.com/paulyc/torrent7z/commit/5958f42a364c430b3ed4ac68911bbbea1f967fc4.patch/";
      sha256 = "vJOv1sG9XwTvvxQiWew0H5ALoUb9wIAouzTsTvKHuPI=";
    })
  ];
  patchFlags = [ "-p2" ];
  postUnpack = "sourceRoot=\${sourceRoot}/linux_src/p7zip_4.65/CPP/7zip/Bundles/Alone/";
  buildPhase = "make clean; make"; 
  installPhase = "mkdir -p $out/bin; cp t7z $out/bin";
}
