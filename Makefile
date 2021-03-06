.PHONY: brew iterm symlink shell

brew:
	brew bundle

iterm:
	# source: http://stratus3d.com/blog/2015/02/28/sync-iterm2-profile-with-dotfiles-repository/
	# Specify the preferences directory
	defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "~/dotfiles/iterm2-profile"
	# Tell iTerm2 to use the custom preferences in the directory
	defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true

symlink:
	# gitignore
	sudo rm -f ~/.gitignore
	ln -sf ~/dotfiles/.gitignore ~/.gitignore
	# Remove old dot files
	sudo rm -rf ~/.config
	# Create symlinks in the home folder
	ln -sf ~/dotfiles/.config ~/.config
	# Remove old bins
	sudo rm -rf /usr/local/bin/kubectl
	sudo rm -rf /usr/local/bin/openstack
	sudo rm -rf /usr/local/bin/helm
	sudo rm -rf /usr/local/bin/helm3
	sudo rm -rf /usr/local/bin/terraform
	sudo rm -rf /usr/local/bin/terragrunt
	sudo rm -rf /usr/local/bin/fly
	sudo rm -rf /usr/local/go/bin/go
	# Symlink new bins
	ln -sf ~/dotfiles/bin/kubectl /usr/local/bin/kubectl
	ln -sf ~/dotfiles/bin/openstack /usr/local/bin/openstack
	ln -sf ~/dotfiles/bin/helm /usr/local/bin/helm
	ln -sf ~/dotfiles/bin/helm3 /usr/local/bin/helm3
	ln -sf ~/dotfiles/bin/terraform /usr/local/bin/terraform
	ln -sf ~/dotfiles/bin/terragrunt /usr/local/bin/terragrunt
	ln -sf ~/dotfiles/bin/fly /usr/local/bin/fly
	ln -sf ~/dotfiles/bin/go /usr/local/go/bin/go

shell:
	# Set fish as the default shell
	chsh -s /usr/local/bin/fish
