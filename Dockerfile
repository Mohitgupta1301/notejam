FROM python:2
ENV DockerHOME=/home/app/webapp  
RUN mkdir -p $DockerHOME  
WORKDIR $DockerHOME  
COPY . $DockerHOME  
RUN pip install -r requirements.txt  
RUN pip install psycopg2
CMD ./manage.py syncdb --noinput && ./manage.py runserver 0.0.0.0:8000
