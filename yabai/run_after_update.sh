# Run this with sudo.
export YABAI_CERT=
brew services stop yabai
codesign -fs 'yabai-cert' $(which yabai)
yabai --uninstall-sa
yabai --install-sa
yabai --load-sa
brew services start yabai