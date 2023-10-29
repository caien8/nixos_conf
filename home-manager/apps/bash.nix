{
  programs.bash = {
  enable = true;
  enableCompletion = true;      #* enable completion for interactive bash shells
  enableVteIntegration = true;  #* lets terminal track current working directory
  historyFile = "/~";           #* location of the bash history file
  historyFileSize = 8000;       #* no of lines in the bash history file
  shellAliases = {
    l = "ls -alh";
    ls = "ls --color=tty";
    ll = "ls -l";
    hm = "home-manager";
    hms = "home-manager switch";
    ".." = "cd ..";
  };
};
}