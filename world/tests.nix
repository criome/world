let
  pkdjz = use.pkdjz.packages.${system};

in
{
  simpleYamlRead = pkdjz.fromYAML ''
    title: Li Goldragon
    matrixID: "@li:matrix.org"
    twitterID: LiGoldragon
    youtubeID: "@ligoldragon"
    patreonID: LiGoldragon
  '';
}
