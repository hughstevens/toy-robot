PROJECT	= toy-robot

.PHONY: build, run, test, shell

build:
	docker build --rm -t $(PROJECT) .

run:
	docker run --rm -it $(PROJECT)

test:
	docker run --rm -t $(PROJECT) rspec spec
