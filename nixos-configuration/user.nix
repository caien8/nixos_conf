
{ config, pkgs, ... }:

{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.caien = {
    isNormalUser = true;
    description = "caien";
    extraGroups = [ "networkmanager" "wheel" "libvirtd"];
    packages = with pkgs; [];
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
     neovim 
     wget
     kitty 
     git 
     #home-manager
     home-manager
     # virtualization
     qemu
     qemu_kvm
     libvirt
     virt-manager
  ];

  # VIRTUALIZATION
  virtualisation.libvirtd.enable = true;
  programs.dconf.enable = true;
  
  services.xserver.excludePackages = with pkgs; [ 
  xterm 
  konsole
  ];

  # i2c for https://github.com/mohamed-badaoui/asus-touchpad-numpad-driver
  hardware.i2c.enable = true;
  systemd.services.asus-touchpad-numpad = {
     description = "Activate Numpad inside the touchpad with top right corner switch";
     documentation = ["https://github.com/mohamed-badaoui/asus-touchpad-numpad-driver"];
     path = [ pkgs.i2c-tools ];
     script = ''
        cd ${pkgs.fetchFromGitHub {
            owner = "mohamed-badaoui";
            repo = "asus-touchpad-numpad-driver";
            # These needs to be updated from time to time
            rev = "d80980af6ef776ee6acf42c193689f207caa7968";
            sha256 = "sha256-JM2wrHqJTqCIOhD/yvfbjLZEqdPRRbENv+N9uQHiipc=";
         }}
         # In the last argument here you choose your layout.
         ${pkgs.python3.withPackages(ps: [ ps.libevdev ])}/bin/python asus_touchpad.py m433ia
        '';
        # Probably needed because it fails on boot seemingly because the driver
        # is not ready yet. Alternativly, you can use `sleep 3` or similar in the
        # `script`.
        serviceConfig = {
           RestartSec = "1s";
           Restart = "on-failure";
         };
        wantedBy = [ "multi-user.target" ];
   };


}
