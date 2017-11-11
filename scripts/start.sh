#!/bin/sh
cd /app
echo "-----------------------------------"
if [ ! -f /app/node_modules ]; then
  echo "Installing nodejs dependencies..."
  npm install
else
  echo "Skipping nodejs dependencies..."
fi

echo "-----------------------------------"
if [ ! -f /app/elm-stuff ]; then
  echo "Installing Elm dependencies..."
  elm package install -y
else
  echo "Skipping Elm dependencies..."
fi

echo "-----------------------------------"
echo "Runing gELMdetra"
npm run watch
