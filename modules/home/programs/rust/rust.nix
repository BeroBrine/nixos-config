{pkgs , ...}: {

  home.packages = with pkgs; [
    rustc
    rustfmt
  ];

  programs.zsh.sessionVariables = {
    RUST_SRC_PATH = "${pkgs.rust.packages.stable.rustPlatform.rustLibSrc}";
  };
}
