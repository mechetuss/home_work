#!/bin/bash

if [ $# -eq 0 ]; then
    echo "No project name provided"
    exit 1
fi

PROJECT_NAME=$1

mkdir -p "$PROJECT_NAME"

mkdir -p "$PROJECT_NAME/data"
mkdir -p "$PROJECT_NAME/scripts"
mkdir -p "$PROJECT_NAME/results"

touch "$PROJECT_NAME/data/raw_data.txt"
chmod 600 "$PROJECT_NAME/data/raw_data.txt"

cat > "$PROJECT_NAME/scripts/run_analysis.sh" << EOF
#!/bin/bash
echo "Hello from $PROJECT_NAME"
EOF

chmod +x "$PROJECT_NAME/scripts/run_analysis.sh"

