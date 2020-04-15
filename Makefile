dep:
	sudo apt update
	sudo apt install build-essential
	sudo apt install libreadline-dev libncurses-dev
	sudo apt install vim

sqlite3:
	git clone git@github.com:robdelacruz/compile-sqlite3.git
	cd compile-sqlite3
	make
	make install
	cd ..

go:
	wget https://dl.google.com/go/go1.14.2.linux-amd64.tar.gz
	tar -C /usr/local -xzf go1.14.2.linux-amd64.tar.gz

home:
	git clone git@github.com:robdelacruz/home.git
	cp home/.bashrc ~

install: sqlite3 go home

clean:
	rm -rf compile-sqlite3 home
	rm -rf *.gz *.zip


