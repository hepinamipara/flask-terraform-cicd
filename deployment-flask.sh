#!/bin/bash

set -e  # Exit if any command fails

# -----------------------------
# 💡  Function: Check Git is present or not
# -----------------------------
function check_git(){
if command -v git >/dev/null 2>&1;
then 
          echo "✅ Git is already installed."
else
          echo "❌  Git not found. Installing Git now...."
          sudo yum install git -y
fi
}
# -----------------------------
# 💡 Function: Clone the repo
# -----------------------------
clone_repo() {
    local repo_url="https://github.com/hepinamipara/flask-terraform-cicd.git"
    local dir_name="flask-terraform-cicd"

    echo "📁 Checking if project directory exists..."
    if [ -d "$dir_name" ]; then
        echo "✅ Directory '$dir_name' already exists — skipping git clone."
    else
        echo "⬇️ Cloning Flask app from GitHub..."
        git clone "$repo_url"
        echo "✅ Clone complete."
    fi
    cd $dir_name
}

# -----------------------------
# 💡  Function: check python3-pip present
# -----------------------------
check_python() {
    if ! command -v python3 &>/dev/null; then
        echo "❌ Python3 not found.  installing ..........."
        sudo yum install python3
    else
        echo "✅ Python3 found."
    fi

    if ! command -v pip >/dev/null 2>&1 && ! command -v pip3 >/dev/null 2>&1; then
        echo "❌ pip not found. Installing now..."
        yum install python3-pip -y
    
        echo "✅ pip installed successfully."
    else
        echo "✅ pip is already installed."
    fi
}


# -----------------------------
# 💡   Funcction: pip install requirement.txt
# -----------------------------
install_dependency() {
echo "📦 Installing requirement.txt..." 
pip install -r requirements.txt   >/dev/null 
echo "✅ requirements  installed successfully."
}

# -----------------------------
# 💡    Funcction: run the flask app
# -----------------------------
run_flask_app(){
echo " Starting Flask app on http://Public-ip:5000 ..."
python3 app.py>/dev/null 2>&1 &
#echo "application deploy successfully"
}


main() {
     check_git
     clone_repo
     check_python
     install_dependency 
     run_flask_app
}
main
