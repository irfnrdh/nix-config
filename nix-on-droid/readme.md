# Config Nix Android 

- nix flake init
- nix run .#homeConfigurations.irfnrdh.activationPackage
- nix flake update

```
git init
git add .
git commit -m "Initial commit with Nix Flake, Home Manager, and dotfiles"
````


- nix flake init --template github:nix-community/nix-on-droid#advanced


- nix-on-droid switch --flake ~/config/nix-on-droid/flake.nix