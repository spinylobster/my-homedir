Host github.com
  HostName github.com
  User git
  Port 22
  IdentityFile ~/.ssh/id_ed25519.prv
  TCPKeepAlive yes
