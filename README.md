# CI/CD for Docker Images

This repository contains recipes for custom Docker images. Each directory in the root of the repository represents a separate image. When you update a Dockerfile and push to the `main` branch, GitHub Actions will automatically build and push the image to Docker Hub.

## Directory Structure

- Each top-level directory (e.g., `cmp/`) should contain a `Dockerfile` and any supporting files for that image.

## Local Development

To build and test an image locally:

1. Navigate to the image directory:
   ```sh
   cd cmp
   ```
2. Build the Docker image (replace `mytag` as needed):
   ```sh
   docker build -t <your-dockerhub-username>/cmp:mytag .
   ```
3. Run the image (example):
   ```sh
   docker run --rm -it <your-dockerhub-username>/cmp:mytag
   ```

## CI/CD with GitHub Actions

- On every push to `main`, the workflow will build and push the image to Docker Hub.
- You must set the following secrets in your repository settings:
  - `DOCKERHUB_USERNAME`
  - `DOCKERHUB_TOKEN`

## Adding a New Image

1. Create a new directory at the root (e.g., `myimage/`).
2. Add a `Dockerfile` and any needed files.
3. Commit and push to `main`.

---

For more details, see the `.github/workflows/docker-build-push.yml` file.
