{
  outputs = _: let
    module = import ./module.nix;
  in {
    nixosModules.default = module;
    darwinModules.default = module;
  };
}
