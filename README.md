# Local AI Setup with Ollama and Open WebUI

This repository contains a Docker Compose configuration for running a local AI setup using [Ollama](https://github.com/ollama/ollama) and [Open WebUI](https://github.com/open-webui/open-webui). The setup includes automatic model downloading and a user-friendly web interface.

You can find additional models to use with this setup by visiting [Ollama's model library](https://ollama.com/search).

## Components

The setup consists of three main services:

1. **Ollama**: The core LLM service that runs the models
2. **Open WebUI**: A user-friendly web interface for interacting with the models
3. **Model Downloader**: An initialization service that automatically downloads specified models

## Quick Start

1. Clone this repository
2. Start the services:
   ```bash
   docker compose up
   ```

The setup will automatically:
- Start the Ollama service
- Download the specified models (llama3.2:3b)
- Launch the Open WebUI interface

## Accessing the Services

- **Open WebUI**: Access the web interface at `http://localhost:8080`
- **Ollama API**: Available at `http://localhost:11434`

## Configuration

### Environment Variables

The model downloader service can be configured using the following environment variable:
- `MODELS`: Comma-separated list of models to download (llama3.2:3b,llama3.2:1b,llama3.2-vision:11b)

### Volumes

- Ollama data is persisted in a named volume: `ollama`
- Open WebUI data is stored in a named volume: `open-webui`

### GPU Support

The setup includes NVIDIA GPU support for Ollama. Make sure you have the NVIDIA Container Toolkit installed and configured properly.

## Stopping the Services

To stop all services:
```bash
docker compose down
```

To stop and remove all data (including downloaded models):
```bash
docker compose down -v
```

## Security Note

The services are exposed on their default ports. If you're running this in a production environment, make sure to:
- Configure appropriate firewall rules
- Set up authentication for the Open WebUI
- Consider using HTTPS for secure communication

## Troubleshooting

If you encounter any issues:

1. Check the logs:
   ```bash
   docker compose logs
   ```

2. Verify GPU access:
   ```bash
   docker compose exec ollama nvidia-smi
   ```

3. Ensure all services are running:
   ```bash
   docker compose ps
   ```
