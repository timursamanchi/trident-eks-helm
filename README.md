# trident-eks-helm
creating an EKS kubernetes cluster for a three tier app on aws cloud using terraform


# helm-redis-jekyll
creating three tier kubernetes app 

Component	Stack	                Port
Frontend	Jekyll + NGINX	        80  
Backend	    Flask + Redis (server)	8080  
Database	Redis (client) + PVC    6379  

| Component                              | Status    | Notes                        |
| -------------------------------------- | --------- | ---------------------------- |
| **Frontend** (`quote-frontend:jekyll`) | ✅ Running | Jekyll + NGINX               |
| **Backend** (`quote-backend:csv`)      | ✅ Running | Flask + Redis client         |
| **Database** (`quote-redis`)           | ✅ Running | Redis server + Docker volume |


🚦 Current Architecture Summary

[ Jekyll + NGINX (quote-frontend) ]
             ↓
     fetch("/quote") → [ Flask backend ]
                              ↓
                    [ Redis server + volume ]

