# docker-mysql-node

Ref: https://learn.microsoft.com/en-us/visualstudio/docker/tutorials/tutorial-multi-container-app-mysql

Deploying the Node.js application container on docker with database in MySQL container in same network for persistance data storage

1. Create the network in the docker to attach application and database container

        docker network create todo-app
 
 2. Deploy the MySQL container using the below command
      
        docker run --name some-mysql --network todo-app --network-alias mysql -v todo-mysql-data:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=<secure-password> -e MYSQL_DATABASE=todos -d mysql:5.7
      
 3. You can exec into container and check the database structure using doc: https://dev.mysql.com/doc/mysql-getting-started/en/
 
        docker exec -it 89ae9c3666e2 mysql -p
        
     ( enter <secure-password> after this command in prompt)
  
 4. Clone this git repository
 5. Build the Dockerfile to generate docker image 
  
        docker build -t node-app .
        
 6. Create container from the image
 
        docker run -td -p 3000:3000 --network todo-app -e MYSQL_HOST=mysql -e MYSQL_USER=root -e MYSQL_PASSWORD=<secure-password> -e MYSQL_DB=todos node-app

 7. Open the IP-Address:Port in browser and add the items which will persist across container restart
