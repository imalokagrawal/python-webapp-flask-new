FROM ubuntu:14.04

# Update
RUN apt-get update && apt-get install -y python-pip python-dev && apt-get clean

# Install app dependencies
RUN pip install flask

RUN mkdir /code
WORKDIR /code
ADD requirements.txt /code/
RUN pip install -r requirements.txt
ADD . /code/

EXPOSE 8080 80 5555

CMD ["python", "runserver.py"]
