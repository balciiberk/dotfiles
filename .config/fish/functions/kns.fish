function kns
    kubectl config set-context --current --namespace=$argv[1]
end
