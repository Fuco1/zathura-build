compile () {
  dir=$1
  echo "Installing $dir"
  cd $dir
  target="$dir"-"$(git tag -l | tail -n 1)"
  make COLOR=1
  PREFIX="/usr/local/stow/$target" make install
  cd /usr/local/stow
  stow -v $target
}

(compile girara)
(compile zathura)
(compile zathura-pdf-poppler)
(compile zathura-ps)
(compile zathura-cb)
(compile zathura-djvu)
