#!bin/bash
#Create folder and copy file
mkdir tempdir
mkdir tempdir/templates
mkdir tempdir/static
cp sample_app.py tempdir/.
cp -r templates/* tempdir/templates/.
cp -r static/* tempdir/static/.
#Create Dockerfile
echo "FROM python" >> tempdir/Dockerfile #install Python
echo "RUN pip install flask" >> tempdir/Dockerfile #instal flask -python webapp framwork
echo "COPY ./static /home/myapp/static/" >> tempdir/Dockerfile #copy static folder to Docker container. Create /home/myapp as parent directory inside Docker container
echo "COPY ./templates /home/myapp/templates/" >> tempdir/Dockerfile #copy templates folder to Docker container
echo "COPY sample_app.py /home/myapp/" >> tempdir/Dockerfile #copy sample_app.py file to Doker container
echo "EXPOSE 8080" >> tempdir/Dockerfile #expose port 8080 for using by the webserver
echo "CMD python3 /home/myapp/sample_app.py" >> tempdir/Dockerfile #run sample_app.py in docker container
#build the docker container
cd tempdir
docker build -t sampleapp .
#start the container with name samplerunning from docker samepleapp image
docker run -t -d -p 8080:8080 --name samplerunning sampleapp
#show docker process
docker ps -a


