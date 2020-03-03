
run: 
	docker run   --mount source=spark_vol,target=/app/spark_vol  --rm -it -p 8888:8888/tcp ashikspark:latest

build:
	docker build --rm -f "Dockerfile" -t ashikspark:latest "." 

create: build
	docker volume create spark_vol