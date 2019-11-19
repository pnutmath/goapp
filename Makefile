build:
	docker build -t goapp . 
run:
	docker run -rm -p 8080:8080 goapp 