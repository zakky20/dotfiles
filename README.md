# 👾 Dotfiles
Welcome to my dotfiles built for efficiency and aesthetics.

<img width="1920" height="1080" alt="2025-12-04_00-30" src="https://github.com/user-attachments/assets/87cc6c69-397e-45e1-86eb-5c1d7ef5235d" />


## ✨ Features

- 🎨 **Nord Theme**: A perfect blend of frosted colors
- 🪟 **Qtile**: 10/10 Window manager for X11
- 🌟 **Zsh + starship**: Efficient shell setup with lots of aliases and tweaks.

## 🚀 Installation

To get started with this setup, follow these steps:

1. **Install NixOS**: If you haven't already installed NixOS, follow the [NixOS Installation Guide](https://nixos.org/manual/nixos/stable/#sec-installation) for detailed instructions.
2. **Clone the Repository**:

	```bash
    git clone https://github.com/zakky20/nixos-configs
    cd nixos-configs
    ```
	
3. **Put your `hardware-configuration.nix` file there**:

    ```bash
    cp /etc/nixos/hardware-configuration.nix ./
    ```

4. **Edit the `flake.nix` with your user, description, etc..**

5. **Rebuild**:

	```bash
    sudo nixos-rebuild switch --flake ~/NixOS#nixos (replace #nixos with ur hostname)
    ```
	
## 🤝 Contributions

Feel free to fork the repository and submit pull requests if you'd like to contribute improvements. Open issues if you encounter any problems with the config or have ideas for new features.
