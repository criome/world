let
  registry = {
    universal = import (import ./npins).registry;
  };

  mkAtom = import registry.universal.make-atom;

in
mkAtom {
  inherit registry;
  args.atomSrc = ./.;
  system = "x86_64-linux";
}
