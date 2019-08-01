[![CircleCI](https://circleci.com/gh/dstaflund/ml_microservice_operationalization.svg?style=svg)](https://circleci.com/gh/dstaflund/ml_microservice_operationalization)

## Project Description

In this project, I have been given an `sklearn` model pre-trained to predict housing prices in
Boston according to several measures, such as average rooms in a home and data about highway access,
teacher-to-pupil ratios, and so on. I expose the model as a Machine Learning Microservice API using
Python Flask, and operationalize its deployment using Docker and Kubernetes.


### Project Files

This project consists of the following:

* An `sklearn` model pre-trained to predict housing prices in Boston _(**housing.csv, boston_housing_prediction.joblib**)_
* A Python Flask application that acts as a Machine Learning Microservice API for the data _(**app.py, requirements.txt**)_
* A Linux Makefile to prepare the development environment, and to test and lint the source files _(**Makefile**)_
* A Dockerfile to create a Docker container of the Machine Learning Microservice API _(**Dockerfile**)_
* A shell script to automate generation of the Docker container _(**run_docker.sh**)_
* A shell script to automate uploading of the container to Docker Hub _(**upload_docker.sh, password.txt**)_
* A shell script to download the container from Docker Hub and deploy it into a Kubernetes environment _(**run_kubernetes.sh**)_

The project also contains the following:

* A configuration file that CircleCI uses to run QA tests every time the source code is checked into GitHub _(**config.yml**)_
* A **.gitignore** file
* Files showing expected output of the application _(**docker_out.txt, kubernetes_out.txt, kubernetes.out.txt**)_ 
* This **README.md** file


### Project Scripts

#### Clone the Git Repository

To clone the git repository, do the following:

1.  Download and install git on your operating system
1.  Clone the repository at https://github.com/dstaflund/ml_microservice_operationalization.git
1.  Open a command-prompt and go to the top-level directory of the repository


#### Generate the Docker container

To generate the Docker container, do the following _(NB:  These instructions assume you are running a Linux-based operating system)_:

1.  Download and install Docker for your operating system 
1.  Run the following command from your command-prompt:
```shell script
>  ./run_docker.sh
```

When you run this script, the following takes place:

* A Docker image called **dstaflund/prediction:1.0** is created based on the Dockerfile
* Your Docker images are listed with the new image among them
* The Machine Learning Microservice API is started and exposed for use on port 8000

To verify that the API works as expected, open another command-prompt and run the following:

```shell script
> ./make_prediction.sh
```

When you run this script, a call is sent to the API on port 8000, and the response is displayed in the
console.  The response looks something like the one found in _/output_text_files/kubernetes.out.txt_.

Output is also written to the console you used to run docker.  It's output is similar to that found in
_/output_text_files/docker_out.txt_.

When you're done testing Docker, press CTRL-C in the original console to stop the API.


#### Upload the container to Docker Hub

The docker upload script is custom-tailored to upload a container named **dstaflund/prediction:1.0** to my
personal Docker Hub, so you won't be able to run it as I have not provided the password.  However, were you to
upload this container to Docker Hub, you would do the following:

1.  Open a Docker Hub account
1.  Enter your password into the _password.txt_ file
1.  Open a command-prompt and enter the following:

```shell script
> ./upload_docker.sh
```

When executed, this script is uploads the above-named container into Docker Hub.

#### Deploy the container to Kubernetes

To run the Docker container in a local Kubernetes environment, do the following:

1.  Download and install **kubectl** for your operating system
1.  Download and install **minikube** for your operating system
1.  Open a command-prompt and enter the following:

```shell script
> ./run_kubernetes.sh
```

When you run this script, the following takes place:

* The Docker image is downloaded from Docker Hub and deployed to your Kubernetes cluster
* Your Kubernetes pods are listed with a new **prediction** pod among them
* The Machine Learning Microservice API is started and exposed for use on port 8000

Output of the run script is similar to that found in _kubernetes_out.txt_.

To verify that the API works as expected, open another command-prompt and run the following:

```shell script
> ./make_prediction.sh
```

When you run this script, a call is sent to the API on port 8000, and the response is displayed in the
console.  The response looks something like the one found in _/output_text_files/kubernetes.out.txt_.

When you're done testing docker, press CTRL-C in the original console to stop the API.
