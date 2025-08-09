# trident-eks-helm
creating an EKS kubernetes cluster for a three tier app on aws cloud using terraform


# helm-redis-jekyll
creating three tier kubernetes app 

Component	Stack	                Port
Frontend	Jekyll + NGINX	        80  
Backend	    Flask + Redis (server)	8080  
Database	Redis (client) + PVC    6379  

| Component                              | Port      | Notes                        |
| -------------------------------------- | --------- | ---------------------------- |
| **Frontend** (`quote-frontend:jekyll`) | ✅ 80     | Jekyll + NGINX               |
| **Backend** (`quote-backend:csv`)      | ✅ 8080   | Flask + Redis client         |
| **Database** (`quote-redis`)           | ✅ 6379   | Redis server + Docker volume |


🚦 Current Architecture Summary
```
[ Jekyll + NGINX (quote-frontend) ]
             ↓
     fetch("/quote") → [ Flask backend ]
                              ↓
                    [ Redis server + volume ]
```

## remove images
```
docker rm -f quote-frontend quote-backend quote-redis
```

## 1️⃣ Start Redis with Preloaded Quotes
```
docker run -d \
  --name quote_redis \
  --network quote-net \
  -v quote-redis_data:/data \
  quote_redis:1000
```

## 2️⃣ Start Backend
```
docker run -d \
  --name quote-backend \
  --network quote-net \
  -p 8080:8080 \
  quote-backend:1000
```

## 3️⃣ Start Frontend
```
docker run -d \
  --name quote-frontend \
  --network quote-net \
  -p 80:80 \
  quote-frontend:1000
```

docker buildx build --no-cache -t timursamanchi/quote-redis:v123 ./docker/redis-database --push
docker buildx build --no-cache -t timursamanchi/quote-backend:v123 ./docker/backend-python --push
docker buildx build --no-cache -t timursamanchi/quote-frontend:v123 ./docker/frontend-nginx --push
