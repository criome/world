let
  pkdjz = get.pkdjz.packages.${system};

  websiteSrcs = {
    goldragon = get.liGoldragonWebpage;
  };

  mkWebsite =
    name: src:
    let
      domain = name + ".criome.net";
    in
    pkdjz.mkMarkdownWebsite { inherit src domain; };

  websites = std.mapAttrs mkWebsite websiteSrcs;

in
{
  Packages.horizons = get.typed-atom.make get.horizons;
  Packages.websites = websites;
  Packages.tests = mod.tests;
}
