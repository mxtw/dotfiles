# ls
alias ls "eza -lh --git --sort modified"

# vim
alias vim "nvim"
abbr --add v "vim"

# tmux
alias t "sesh connect (sesh list -tz | fzf)" # quickly start tmux session

# kubernetes
abbr --add k   "kubectl"
abbr --add kg  "kubectl get"
abbr --add kgp "kubectl get pods"
abbr --add ke  "kubectl exec -it"
abbr --add ka  "kubectl apply -f"
abbr --add kd  "kubectl delete -f"
abbr --add kl  "kubectl logs"

# docker
abbr --add d   "docker"
abbr --add de  "docker exec -it"
abbr --add dr  "docker run --rm -it"
abbr --add ddf "docker system df"

abbr --add dc  "docker compose"
abbr --add dcu "docker compose up -d"
abbr --add dcl "docker compose logs"
abbr --add dcd "docker compose down"

# git
abbr --add lg "lazygit"

# tofu
abbr --add tf  "tofu"
abbr --add tfa "tofu apply"
abbr --add tfd "tofu destroy"
abbr --add tfp "tofu plan"
