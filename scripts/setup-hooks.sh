#!/bin/sh
HOOKS_DIR=".git/hooks"

mkdir -p $HOOKS_DIR

# Create the post-checkout hook
cat > $HOOKS_DIR/post-checkout << 'EOL'
#!/bin/sh
if [ -f package.json ]; then
  command -v pnpm >/dev/null 2>&1 && pnpm install
fi
EOL

chmod +x $HOOKS_DIR/post-checkout
