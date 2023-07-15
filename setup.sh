cd ~/repos
# you can change ~/repos to any directory you wish your project to be saved

read -p "Enter project name: " projectname

git clone "git@github.com:Your_nickname/$projectname.git"
#change Your_nickname to your github nick

cd "$projectname"

npm create vite@latest

cd App
#change App to the title you want your vite project to have(Don't recommend)
npm install -D tailwindcss postcss autoprefixer

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


cd src


sudo bash -c 'cat > index.css << EOL
@tailwind base;
@tailwind components;
@tailwind utilities;
EOL'


cd ..

npm run dev

# Add, commit, and push changes to GitHub
 git add .
git commit -m "Initial commit"
git push origin main
