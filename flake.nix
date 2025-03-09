{
  description = "World";

  inputs = {
    atom.url = "github:LiGoldragon/atom";
    system.url = "github:criome/system";

    typed-atom.url = "github:criome/typed-atom";
    typed-atom.inputs.rust-atom.follows = "rust-atom";
    rust-atom.url = "github:criome/rust-atom";

    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-atom.url = "github:criome/nixpkgs-atom";
    nixpkgs-atom.inputs.nixpkgs.follows = "nixpkgs";

    pkdjz.url = "github:criome/pkdjz";
    pkdjz.inputs.nixpkgs.follows = "nixpkgs";

    horizons.url = "github:criome/horizons";
    horizons.inputs.atom.follows = "atom";

    liGoldragonWebpage.url = "github:LiGoldragon/webpage";
    liGoldragonWebpage.flake = false;
  };

  outputs = inputs: inputs.atom.mkAtomicFlake inputs (./. + "/world@.toml");
}
