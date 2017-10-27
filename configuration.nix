# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the gummiboot efi boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot";
  boot.loader.grub.enable = false;
  #boot.loader.grub.device = "/dev/sda";
  #boot.loader.grub.extraEntries = ''
  #menuentry "Ubuntu" {
  #	chainloader (hd0,2)+1
  #}
  #'';

  # Update
  system.autoUpgrade.enable = true;
  system.autoUpgrade.channel = "https://nixos.org/channels/nixos-17.09";

  networking.hostName = "paulsilvap"; # Define your hostname.
  # networking.firewall.allowedTCPPorts = [3001 53 20 21 25 143];
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Select internationalisation properties.
   i18n = {
     consoleFont = "Lat2-Terminus16";
     consoleKeyMap = "us";
     defaultLocale = "en_US.UTF-8";
   };
   
  #hardware.enableAllFirmware = true;
  #hardware.enableRedistributableFirmware = true;

  # Set your time zone.
  time.timeZone = "America/Guayaquil";

  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [
    #all-cabal-hashes
    #bind
    cabal2nix
    cabal-install
    #codeblocks
    #codeblocksFull
    dhcp
    dnsutils
    #emacs
    file
    finger_bsd
    firefox-bin
    #firmwareLinuxNonfree
    fuse3
    gcc
    gdb
    ghc
    gimp
    #gitAndTools.gitFull
    gnumake
    haskellPackages.threepenny-gui
    #haskellPackages.threepenny-gui-contextmenu
    haskellPackages.threepenny-gui-flexbox
    #haskellPackages.happy
    #haskellPackages.network-uri
    #haskellPackages.yesod
    #haskellPackages.acid-state
    #haskellPackages.ghc-mod
    #haskellPackages.ghcjs-codemirror
    #haskellPackages.ghcjs-dom
    #haskellPackages.ghcjs-websockets
    #haskellPackages.ghc
    #haskellPackages.hasktags
    #haskellPackages.xmobar
    #haskellPackages.base-prelude
    #haskellPackages.polyparse
    #haskellPackages.hmatrix
    #haskellPackages.HUnit
    #haskellPackages.hspec
    #haskellPackages.nanospec
    #haskellPackages.storable-complex
    #(import (fetchFromGitHub {
    #  owner = "leksah";
    #  repo = "leksah";
    #  rev = "8ed4ea9ff78218c9fad5c3fd27d6632a125e5379";
    #  sha256 = "0wh7gx3gqjbvj15zs5n9v033zd33zl466w787pyfrzzz16jaxy8k";
    #  fetchSubmodules = true;
    #}) {})
    ipad_charge
    iw
    kodi
    libreoffice
    #linuxPackages.ndiswrapper
    lshw
    #ndjbdns
    #nix-prefetch-git
    nox
    oraclejdk8
    #patchelf
    pmutils
    pciutils
    python35
    R
    #speedtest-cli
    tcpdump
    transmission_gtk
    tree
    unetbootin
    usbutils
    virtualbox
    vlc
    wayland
    wirelesstools
    zeroad
    zuki-themes
   ];

  programs.man.enable = true;
  
  nixpkgs.config = {
  		allowUnfree = true;
  		allowBroken = true;
  		#firefox = {
  		#	enableAdobeFlash = true;
  		#	jre = false;
  		#};
  };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable the X11 windowing system.
    services.xserver = {
    	autorun = true;
        enable = true;
        layout = "latam";
        displayManager.auto = {
        	user = "paul";
        	enable = true;
        };
        libinput.enable = true;
        libinput.scrollMethod = "twofinger";
        desktopManager.gnome3 = {
        	enable = true;
        	sessionPath = with pkgs.gnome3; [ gpaste gtk gnome_shell gnome-shell-extensions gnome-characters gnome-backgrounds gnome_online_accounts gnome_themes_standard];
        };
     };
     
  # Make sure the only way to add users/groups is to change this file 
  # users.mutableUsers = false;
    
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.extraUsers.paul = {
     name =  "paul";
     group = "users";
     isNormalUser = true;
     home = "/home/paul";
     extraGroups = [ "wheel" "networkmanager" "disk" "video" "adm" 
     "utmp" 
     "audio" "systemd-journal" "systemd-network"];
   };
   
   	#users.extraUsers.willy = {
	#        isNormalUser = true;
	#	home = "/home/willy";
	#	extraGroups = ["networkmanager" "sound" "disk" "postfix" "dovecot2"];
	#};

	#	users.extraUsers.cheo = {
	#        isNormalUser = true;
	#	home = "/home/cheo";
	#	extraGroups = ["networkmanager" "sound" "disk" "postfix" "dovecot2"];
	#};
	#        users.extraUsers.jhon = {
	#        isNormalUser = true;
	#	home = "/home/jhon";
	#	extraGroups = ["networkmanager" "sound" "disk" "postfix" "dovecot2"];
	#};
   
  #users.extraUsers.guest = {
  #   name =  "guest";
  #   isNormalUser = true;
  #   extraGroups = [ "wheel" "networkmanager"];
  #   uid = 1000;
  #};
   
   	# Bind Server
	#services.bind = {
	#        enable = true;
	#	cacheNetworks = ["192.168.20.0/26" "127.0.0.0/24"];
	#	zones = [
	#	{
	#		name = "suit-yourself.com";
	#		master = true;
	#		file = "/services/dns/zones/suit-yourself.com.db";
	#		masters = [];
	#		slaves = [];
	#	}		
	#	];
	#
	#};
	
	# Postfix
	#services.postfix = {
	#   enable = true;
	#   setSendmail = true;
	#   networks = ["192.168.20.0/26" "127.0.0.1/24"];
	#   hostname = "mail.suit-yourself.com";
	#   domain = "suit-yourself.com";
	#   origin = "suit-yourself.com";
	#   postmasterAlias = "paul";
	#   destination = ["mail.suit-yourself.com" "suit-yourself.com" "localhost"];
	#   enableSubmission = true;
	#   extraAliases = "
	#   	willy willy@suit-yourself.com
    #   	paul paul@suit-yourself.com
	#	cheo cheo@suit-yourself.com
	#	jhon jhon@suit-yourself.com
	#    ";
	#   extraConfig = "";
	#};

	# Dovecot
	#services.dovecot2 = {
	#   enable = true;
	#};
	
	# nano configuration
	programs.nano.nanorc = ''
		set autoindent
		set mouse
		set tabsize 4
		set brackets ""')>]}"
		set matchbrackets "(>[{)>]}"
	'';
   
   #services.vsftpd.enable = true;
   #services.vsftpd.anonymousUser = true;
   
  # The NixOS release to be compatible with for stateful data such as databases.
  system.stateVersion = "17.09";

}
