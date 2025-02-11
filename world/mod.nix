let
  pkdjz = use.pkdjz.packages.${system};

  websiteSrcs = {
    goldragon = use.liGoldragonWebpage;
  };

  mkWebsite = name: src: pkdjz.mkHugoWebsite { inherit src; };

  websites = std.mapAttrs mkWebsite websiteSrcs;

  tests = {
    simpleYamlRead = pkdjz.fromYAML ''
      title: Li Goldragon
      matrixID: "@li:matrix.org"
      twitterID: LiGoldragon
      youtubeID: "@ligoldragon"
      patreonID: LiGoldragon
    '';
  };

in
{
  Packages.website = websites;

  Packages.test = tests;
}
