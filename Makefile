setup-box: dep sqlite3 go home

dep:
	sudo apt update
	sudo apt install build-essential
	sudo apt install libreadline-dev libncurses-dev
	sudo apt install vim
	sudo apt install curl software-properties-common
	curl -sL https://deb.nodesource.com/setup_13.x | sudo bash -
	sudo apt install nodejs
	sudo npm install -g npx

sqlite3:
	git clone git@github.com:robdelacruz/compile-sqlite3.git
	cd compile-sqlite3
	make
	sudo make install
	cd ..

go:
	wget https://dl.google.com/go/go1.14.2.linux-amd64.tar.gz
	sudo tar -C /usr/local -xzf go1.14.2.linux-amd64.tar.gz

home:
	git clone git@github.com:robdelacruz/home.git
	cp home/.bashrc ~

clean:
	rm -rf compile-sqlite3 home
	rm -rf *.gz *.zip


