let
  registry.universal = (import ./npins).registry;
  mkAtom = import registry.universal.make-atom;

  args = {
    atomSrc = ./.;
  };

in
mkAtom {
  inherit registry args;
}
