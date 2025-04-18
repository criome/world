{ src }@arguments:

get.mkAtom {
  inherit registry system;
  args = {
    atomSrc = registry.rust-atom;
    inputs.src = { inherit (arguments) src; };
  };
}
