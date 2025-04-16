{
  description = "World";

  inputs = {
    make-atom.url = "github:criome/make-atom/testing";

    system.url = "github:criome/system";

    typed-atom.url = "github:criome/typed-atom";
    typed-atom.inputs.rust-atom.follows = "rust-atom";
    rust-atom.url = "github:criome/rust-atom";

    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    pkdjz.url = "github:criome/pkdjz";
    pkdjz.inputs.nixpkgs.follows = "nixpkgs";

    horizons-rs.url = "github:criome/horizons-rs";
    horizons-rs.flake = false;

    liGoldragonWebpage.url = "github:LiGoldragon/webpage";
    liGoldragonWebpage.flake = false;
  };

  outputs =
    inputs:
    inputs.make-atom.mkAtom {
      args.atomSrc = ./.;

      system = inputs.system.value;

      registry = {
        local = {
          inherit (inputs)
            make-atom
            typed-atom
            nixpkgs
            pkdjz
            horizons
            liGoldragonWebpage
            ;
        };
      };
    };
}
