image-name = dev-java8
container-name = $(image-name)

build:
	docker build -t $(image-name) .

run:
	docker run \
	-it \
	--name $(container-name) \
	-v /:/root/host \
	$(image-name)

stoprm:
	-docker stop $(container-name)
	-docker rm $(container-name)

exec:
	docker exec -it $(container-name)

iter: stoprm build run
