#!/bin/bash


DF=dotfiles
GH_DIR=Programming/github


### Install packages ###

sudo apt update && sudo apt upgrade && sudo apt install bison binutils-dev build-essential code \
conky docker.io gawk git gnuplot golang-go maven net-tools openjdk-8-jdk openjdk-11-jdk peek \
shellcheck sublime-text telegram-desktop tmux unetbootin valgrind vlc xfonts-terminus yakuake

### Configure Git ###

git config --global user.name "5aboteur"
git config --global user.email "5aboteur@protonmail.com"
git config --global core.editor "nano"

### Place dotfiles ###

mkdir -p ${GH_DIR}
git clone https://github.com/5aboteur/${DF}.git ${GH_DIR}
cd ${GH_DIR}/${DF} || exit

for df in *; do
	# skip .git directory
	if ! [ -d "${df}" ]; then
		cp "${df}" "${HOME}"
	fi
done

cd "${HOME}" || exit

### Install Intellij IDEA via snap

sudo snap install intellij-idea-community --classic
sudo ln -s /snap/intellij-idea-community/current/bin/idea.sh /usr/bin/idea

### Install VS Code extensions ###

code --install-extension aaron-bond.better-comments
code --install-extension DavidAnson.vscode-markdownlint
code --install-extension dbaeumer.vscode-eslint
code --install-extension formulahendry.code-runner
code --install-extension mathiasfrohlich.Kotlin
code --install-extension ms-azuretools.vscode-docker
code --install-extension ms-kubernetes-tools.vscode-kubernetes-tools
code --install-extension ms-python.python
code --install-extension ms-vscode.cpptools
code --install-extension ms-vscode.Go
code --install-extension Pivotal.vscode-spring-boot
code --install-extension redhat.java
code --install-extension redhat.vscode-xml
code --install-extension redhat.vscode-yaml
code --install-extension sleistner.vscode-fileutils
code --install-extension VisualStudioExptTeam.vscodeintellicode
code --install-extension vscjava.vscode-java-debug
code --install-extension vscjava.vscode-java-dependency
code --install-extension vscjava.vscode-java-pack
code --install-extension vscjava.vscode-java-test
code --install-extension vscjava.vscode-maven
code --install-extension vscjava.vscode-spring-initializr

### Check results ###

(zcat $(ls -tr /var/log/apt/history.log*.gz); cat /var/log/apt/history.log) 2>/dev/null | \
grep -E '^(Start-Date:|Commandline:)' | grep -v aptdaemon | grep -E '^Commandline:' && \
ls -la "${HOME}" && code --list-extensions
