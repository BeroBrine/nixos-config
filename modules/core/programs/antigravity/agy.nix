{
  pkgs,
  agy-nix,
  ...
}:
{

  # CRITICAL: Antigravity is proprietary Google software,
  # so NixOS will refuse to build it unless this is allowed:
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = [
    # 1. The CLI tool (provides the 'agy' command)
    agy-nix.packages.${pkgs.system}.google-antigravity-cli

    # 2. The Base App (Agent Orchestration) — optional
    # antigravity-nix.packages.${pkgs.system}.default

    # 3. The Legacy IDE — optional
    # antigravity-nix.packages.${pkgs.system}.google-antigravity-ide
  ];
}
