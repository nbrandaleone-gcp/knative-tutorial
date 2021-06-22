# Use the go tool to create a go.mod manifest.
go mod init github.com/nbrandaleone/serving-samples/hello-world/helloworld-go

# Build the container on your local machine
docker build -t nbrand/helloworld-go .

# Push the container to docker registry
docker push nbrand/helloworld-go
