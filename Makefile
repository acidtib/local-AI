# Docker container name
CONTAINER=ollama

# Default model to pull
MODEL=llama3.2:3b

# Default target if no target is provided
all: help

# Help command to show available commands
help:
	@echo "Available commands:"
	@echo "  make pull <model>             - Pull the specified model (default: llama3.2:3b)"
	@echo "  make run <model>              - Run the specified model (default: llama3.2:3b)"
	@echo "  make rm <model>               - Remove the specified model"
	@echo "  make exec                     - Open a bash shell in the Docker container"
	@echo "  make up                       - Start the Docker container"
	@echo "  make logs                     - View logs of the Docker container"

# Command to pull the specified model
pull:
	@MODEL=$(if $(filter-out $@,$(MAKECMDGOALS)),$(filter-out $@,$(MAKECMDGOALS)),$(MODEL)); \
	echo "Pulling model: $$MODEL"; \
	docker exec -it $(CONTAINER) ollama pull $$MODEL

# Command to run the specified model in the container
run:
	@MODEL=$(if $(filter-out $@,$(MAKECMDGOALS)),$(filter-out $@,$(MAKECMDGOALS)),$(MODEL)); \
	echo "Running model: $$MODEL"; \
	docker exec -it $(CONTAINER) ollama run $$MODEL

# Command to stop and remove the Docker container
rm:
	@MODEL=$(if $(filter-out $@,$(MAKECMDGOALS)),$(filter-out $@,$(MAKECMDGOALS))); \
	echo "Running model: $$MODEL"; \
	docker exec -it $(CONTAINER) ollama rm $$MODEL

# Command to execute a bash shell in the Docker container
exec:
	docker exec -it $(CONTAINER) /bin/bash

# Command to start the Docker container using docker compose
up:
	docker compose up -d

# Command to stop and remove the Docker container using docker compose
down:
	docker compose down

# Command to follow logs of the Docker container
logs:
	docker compose logs --follow --tail 420

# Prevent make from trying to interpret the arguments as targets
%:
	@:
