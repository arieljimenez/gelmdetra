#!/bin/ash
cd /app
echo "-----------------------------------"
echo "Deleting old files"
rm 117*
echo "-----------------------------------"
if [ -d /app/node_modules ]; then
  echo "Skipping nodejs dependencies..."
else
  echo "Installing nodejs dependencies..."
  npm install
fi

echo "-----------------------------------"
if [ -d /app/elm-stuff ]; then
  echo "Skipping Elm dependencies..."
else
  echo "Installing Elm dependencies..."
  elm package install -y
fi

echo "-----------------------------------"
echo "Runing gELMdetra"
npm run watch
