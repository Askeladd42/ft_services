# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    setup.sh                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: plam <plam@student.42.fr>                  +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/03/08 19:27:25 by plam              #+#    #+#              #
#    Updated: 2021/03/08 19:44:42 by plam             ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# minikube deployment

minikube start && minikube kubectl -- get po -A
kubectl create deployment hello-minikube --image=k8s.gcr.io/echoserver:1.4
kubectl expose deployment hello-minikube --type=NodePort --port=8080
kubectl get services hello-minikube
kubectl port-forward service/hello-minikube 7080:8080

# MetalLB deployment
kubectl apply -f https://raw.githubusercontent.com/google/metallb/v0.7.3/manifests/metallb3.yaml