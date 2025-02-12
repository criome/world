let
  pkdjz = use.pkdjz.packages.${system};

  websiteSrcs = {
    goldragon = use.liGoldragonWebpage;
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
  Packages.websites = websites;
  Packages.tests = mod.tests;
}
