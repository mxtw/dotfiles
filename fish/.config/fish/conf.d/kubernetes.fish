# load kubeconfigs from .kube/conf.d
set -gx KUBECONFIG $HOME/.kube/config
for c in $HOME/.kube/conf.d/*
    set -gx KUBECONFIG $KUBECONFIG:$c
end

