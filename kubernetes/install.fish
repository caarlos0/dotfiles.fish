#!/usr/bin/env fish
curl -sL https://raw.githubusercontent.com/evanlucas/fish-kubectl-completions/master/completions/kubectl.fish -o ~/.config/fish/completions/kubectl.fish

abbr -a kx kubectx
abbr -a kn kubens

abbr -a k kubectl
abbr -a sk 'kubectl -n kube-system'
abbr -a kg 'kubectl get'
abbr -a kgp 'kubectl get po'
abbr -a kga 'kubectl get --all-namespaces'
abbr -a kd 'kubectl describe'
abbr -a kdp 'kubectl describe po'
abbr -a krm 'kubectl delete'
abbr -a ke 'kubectl edit'
abbr -a kex 'kubectl exec -it'
abbr -a kdebug 'kubectl run -i -t debug --rm --image=caarlos0/debug --restart=Never'
abbr -a knrunning 'kubectl get pods --field-selector=status.phase!=Running'
abbr -a kfails 'kubectl get po -owide --all-namespaces | grep "0/" | tee /dev/tty | wc -l'
abbr -a kimg "kubectl get deployment --output=jsonpath='{.spec.template.spec.containers[*].image}'"
abbr -a kvs "kubectl view-secret"
abbr -a kgno 'kubectl get no --sort-by=.metadata.creationTimestamp'
abbr -a kdrain 'kubectl drain --ignore-daemonsets --delete-local-data'
abbr -a kclear 'kubectl config unset current-context'
# TODO more from zsh