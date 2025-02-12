let
  pkdjz = use.pkdjz.packages.${system};

  websiteSrcs = {
    goldragon = use.liGoldragonWebpage;
  };

  mkWebsite = name: src: pkdjz.mkHugoWebsite { inherit src; };

  websites = std.mapAttrs mkWebsite websiteSrcs;

in
{
  Packages.websites = websites;
  Packages.tests = mod.tests;
}
