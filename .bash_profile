if [ -d "${HOME}/.bash.d" ] ; then
  for f in "${HOME}"/.bash.d/*.sh ; do
    . "$f"
  done
  unset f
fi
