{pkgs, ...}: {
  nix = {
    settings = {
      # automatically link duplicate files to save space
      auto-optimise-store = true;

      experimental-features = [
        "nix-command" # enable unified `nix` utility instead of `nix-build`, `nix-shell`, etc
        "flakes"
      ];
    };

    # automatically remove any unreachable paths and generations older than month
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 30d";
    };

    # required to use flakes, same as pkgs.nixUnstable
    package = pkgs.nixFlakes;
  };

  nixpkgs.config.allowUnfree = true;

  time.timeZone = "Asia/Jerusalem";
}
