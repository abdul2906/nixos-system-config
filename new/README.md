## nixos-sysconf

### Hierarchy
```
/etc/nixos
├─configuration.nix         ; Master configuration
├─username.nix              ; Specify user
├─users/
│ └─abdul.nix
├─hardware/ 
│ ├─workstation.nix
│ └─laptop.nix
├─environment/              ; Desktop environments
│ ├─hyprland/
│ │ ├─env.nix
│ │ └─...*
│ ├─gnome/
│ │ ├─env.nix
│ │ └─...*
│ └─sway/
│   ├─env.nix
│   └─...*
├─sets/                     ; Sets of packages 
│ ├─development/
│ │  ├─C/C++.nix
│ │  └─...*.nix
│ ├─games/
│ │ ├─steam.nix
│ │ └─...*.nix
│ └─...*/
├─overlays/                 ; Package overlays
│ ├─electron.nix
│ └─...*.nix
└─packages/                 ; Package specific options
  ├─neovim/
  │ ├─pkg.nix
  │ └─...*
  └─...*/
```
