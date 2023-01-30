#!/usr/bin/env fish
alias --save kx=kubectx
alias --save kn=kubens

alias --save k=kubectl
alias --save sk='kubectl -n kube-system'
alias --save kg='kubectl get'
alias --save kgp='kubectl get po'
alias --save kga='kubectl get --all-namespaces'
alias --save kd='kubectl describe'
alias --save kdp='kubectl describe po'
alias --save krm='kubectl delete'
alias --save ke='kubectl edit'
alias --save kex='kubectl exec -it'
alias --save kdebug='kubectl run -i -t debug --rm --image=caarlos0/debug --restart=Never'
alias --save knrunning='kubectl get pods --field-selector=status.phase!=Running'
alias --save kfails='kubectl get po -owide --all-namespaces | grep "0/" | tee /dev/tty | wc -l'
alias --save kimg="kubectl get deployment --output=jsonpath='{.spec.template.spec.containers[*].image}'"
alias --save kvs="kubectl view-secret"
alias --save kgno='kubectl get no --sort-by=.metadata.creationTimestamp'
alias --save kdrain='kubectl drain --ignore-daemonsets --delete-local-data'
