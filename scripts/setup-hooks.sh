#!/bin/sh
HOOKS_DIR=".git/hooks"

# Ensure the hooks directory exists
mkdir -p $HOOKS_DIR

# Create the post-checkout hook
cat > $HOOKS_DIR/post-checkout << 'EOL'
#!/bin/sh
if [ -f package.json ]; then
  command -v pnpm >/dev/null 2>&1 && pnpm install
fi
EOL

# Ensure the hook is executable
chmod +x $HOOKS_DIR/post-checkout
