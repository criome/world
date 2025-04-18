let
  pkdjz = get.pkdjz.packages;

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
  Packages.horizons = mod.mkRustAtom { src = registry.horizons-rs; };
  Packages.websites = websites;
  Packages.tests = mod.tests;
}
