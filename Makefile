NODE_VER = 14
GO_VER = 1.17.2

setup-box: dep nodejs sqlite3 go home

dep:
	sudo apt update && apt upgrade
	sudo apt install build-essential
	sudo apt install libreadline-dev libncurses-dev
	sudo apt install vim
	sudo apt install curl software-properties-common

nodejs:
	curl -fsSL https://deb.nodesource.com/setup_$(NODE_VER).x | sudo bash -
	sudo apt install nodejs
	sudo npm install -g npx

sqlite3:
	git clone git@github.com:robdelacruz/compile-sqlite3.git
	cd compile-sqlite3
	make
	sudo make install
	cd ..

go:
	wget https://dl.google.com/go/go$(GO_VER).linux-amd64.tar.gz
	sudo rm -rf /usr/local/go
	sudo tar -C /usr/local -xzf go$(GO_VER).linux-amd64.tar.gz

home:
	git clone git@github.com:robdelacruz/home.git
	cp home/.bashrc ~

clean:
	rm -rf compile-sqlite3 home
	rm -rf *.gz *.zip


