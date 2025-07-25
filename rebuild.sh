#!/bin/bash

cd /root/containers/reverse-proxy || {
    echo "❌ Failed to change to project directory"
    exit 1
}

echo "🔄 Starting Docker Compose rebuild process..."

eval "$(ssh-agent -s)" || {
    echo "❌ Failed to start ssh-agent"
    exit 1
}

ssh-add /root/.ssh/slnnzmtl || {
    echo "❌ Failed to add SSH key"
    exit 1
}

echo "� Pulling latest changes from git..."
git pull origin master || {
    echo "❌ Failed to pull latest changes from git"
    exit 1
}

echo "�📦 Stopping and removing containers..."
docker compose down

echo "🔨 Building images without cache..."
docker compose build --no-cache

echo "🚀 Starting containers in detached mode..."
docker compose up -d

echo "✅ Docker Compose rebuild completed successfully!"
