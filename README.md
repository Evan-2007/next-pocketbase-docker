# NextJS + Pocketbase + Docker
A simple boilerplate for using Pocketbase as a backend and NextJS static export as a frontend

## Building the image localy 
1. Clone the github repo \
``git clone https://github.com/Evan-2007/next-pocketbase-docker.git``
2. Go to thefolder using  
``cd next-pocketbase-docker``
3. Build the docker image using  
``docker-compose up --build``

- The pocketbase admin ui is avalable at http://localhost:8090/_/   
- The nextjs application is at http://localhost:8090
- An example hook is avalable at http://localhost:8090/hello/yourname 

### Folders
- All data is stored in the pb_data directory inside the container. Make sure you map it to a directory outside the container if you want data to persist through reboots

- Hooks put into pb_hooks will be copied into the container at build time. You can change the name of the folder on line 16 of the Dockerfile