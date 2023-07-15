#!/bin/bash

# Change directory to ~/repos
cd ~/repos

# Request project name from user
read -p "Enter project name: " projectname

# Clone the GitHub repository
git clone "git@github.com:RaevschiCatalin/$projectname.git"

# Change directory to the project
cd "$projectname"

# Create a new Vite project
npm create vite@latest

cd App

# Install tailwindcss, postcss, and autoprefixer as dev dependencies
npm install -D tailwindcss postcss autoprefixer

# Initialize tailwindcss configuration
npx tailwindcss init -p

cat > tailwind.config.js << EOL
/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    "./index.html",
    "./src/**/*.{js,ts,jsx,tsx}",
  ],
  theme: {
    extend: {},
  },
  plugins: [],
};
EOL

# Change directory to the App folder


# Change directory to the src folder
cd src

# Modify the index.css file with sudo
sudo bash -c 'cat > index.css << EOL
@tailwind base;
@tailwind components;
@tailwind utilities;
EOL'

# Go back to the App folder
cd ..

# Start the development server
npm run dev

# Add, commit, and push changes to GitHub
# git add .
# git commit -m "Initial commit"
# git push origin main
