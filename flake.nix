{
  description = "World";

  inputs = {
    atom.url = "github:LiGoldragon/atom";

    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-atom.url = "github:criome/nixpkgs-atom";
    nixpkgs-atom.inputs.nixpkgs.follows = "nixpkgs";

    pkdjz.url = "github:criome/pkdjz";
    pkdjz.inputs.nixpkgs.follows = "nixpkgs";

    liGoldragonWebpage.url = "github:LiGoldragon/webpage";
    liGoldragonWebpage.flake = false;
  };

  outputs = inputs: inputs.atom.mkAtomicFlake inputs (./. + "/world@.toml");
}
