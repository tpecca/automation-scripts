cat <<'EOF' >> ~/.bashrc
function cd() {
	builtin cd "$@" && ls -F
}
EOF

source ~/.bashrc
