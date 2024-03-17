build:
	docker build -t go-http-server .

run:
	docker run --rm -p 8080:8080 -p 40000:40000 go-delve-server
