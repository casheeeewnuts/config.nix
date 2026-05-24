{ pkgs, ...}:
{
  description = "Shu Nonaka";
  isNormal = true;
  groups = [ "wheel" "networkmanager" ];

  packages = with pkgs; [
    foot
    neovim
  ];
}
