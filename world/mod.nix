let
  pkdjz = get.pkdjz.packages;

  websiteSrcs = {
    goldragon = registry.liGoldragonWebpage;
  };

  mkWebsite =
    name: src:
    let
      # TODO module-out
      domain = name + ".criome.net";
    in
    pkdjz.mkMarkdownWebsite { inherit src domain; };

  websites = std.mapAttrs mkWebsite websiteSrcs;

  horizonsRs = mod.mkRustAtom { src = registry.horizons-rs; };
  horizonsRsCrates = horizonsRs.crates;

in
{
  Packages = {
    inherit (horizonsRsCrates) horizons-cli;
    inherit websites;
    inherit (mod) tests;
  };
}
