# Four lines of code that make your Colab a VSCode Server
```
!wget -O ./vscode-cli.tar.gz "https://code.visualstudio.com/sha/download?build=stable&os=cli-alpine-x64"
!tar -xf vscode-cli.tar.gz
!rm vscode-cli.tar.gz
!./code tunnel --accept-server-license-terms
```