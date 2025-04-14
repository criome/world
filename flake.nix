{
  description = "World";

  inputs = {
    make-atom.url = "github:criome/make-atom";

    atom.url = "github:LiGoldragon/atom/atomicFlake-v1";

    typed-atom.url = "github:criome/typed-atom";
    typed-atom.inputs.rust-atom.follows = "rust-atom";
    rust-atom.url = "github:criome/rust-atom";

    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    pkdjz.url = "github:criome/pkdjz";
    pkdjz.inputs.nixpkgs.follows = "nixpkgs";

    horizons-rs.url = "github:criome/horizons-rs";
    horizons-rs.flake = false;
    horizons.url = "github:criome/horizons";
    horizons.inputs.atom.follows = "atom";
    horizons.inputs.horizons-rs.follows = "horizons-rs";

    liGoldragonWebpage.url = "github:LiGoldragon/webpage";
    liGoldragonWebpage.flake = false;
  };

  outputs =
    inputs:
    inputs.make-atom.mkAtom {
      args.atomSrc = ./.;

      system = "x86_64-linux";

      registry = {
        local = {
          inherit (inputs)
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
