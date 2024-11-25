PODs:

![Screenshot 2024-07-11 at 7 50 01 AM](https://github.com/user-attachments/assets/a12e34e0-f424-4259-9464-754c395d9586)

- A pod is a group of one or more containers with shared storage and network resources.
- In Docker we can deploy container alone but in K8's we can not deploy container alone we need to wrap up containers or container with POD in K8's.
	- eg: Lets say we need helper container to update config in a application for that we need a another container to support our main application container .
		- In this case if we node have pod wrapper the helper container might created in another worker node then it is hard to control or manage.
		- If we want to delete container we need to delete manually both some times we might forgot to delete child container if don't have pod.
		- If we have POD wrapper we can overcome those cases and we can manages easily   
- In Most cases we have one container inside of the POD.


- Pod Comands:
	- kubectl apply -f pod.yaml --> To create a pod from YAML file
	- kubectl get pods --> to list the pods
	- kubectl get pods -l app=nginx(label_1), team=spontan(label_2) --> filter the pods with labels
	- kubectl get pods -o wide --> To get more information of pod  (-o stands for output format)
	- kubectl get pods -o yaml --> To get output information in YAML format (-o stands for output format)
	- kubectl get pods --show-labels --> To show or get labels attached to pods
	- kubectl describe pod pod_name --> To get a detail information of specific pod
	- kubectl exec -it POD_NAME -- bash --> To log in to POD (If we have single container no need to mention container name)
	- kubectl exec -it POD_NAME -c CONTAINER_NAME -- bash --> To log in to specific container in POD. (When we have 2 container inside the POD)
	- kubectl port-forward nginx-pod1 9090(listening port):80(Container port) -->we can not access  pod directly form outside of the node using port forward we can access.
	- kubectl logs POD_NAME --> Get application logs
	- kubectl delete -f pod.yaml --> To delete the pods resources from YAML file 
	- kubectl delete pod POD_NAME --> To delete the pod  
	- kubectl port-forward POD-NAME 3001:3000 --> To access the application from outside 
