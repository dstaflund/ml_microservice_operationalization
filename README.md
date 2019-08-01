[![CircleCI](https://circleci.com/gh/dstaflund/ml_microservice_operationalization.svg?style=svg)](https://circleci.com/gh/dstaflund/ml_microservice_operationalization)

## Project Description

In this project, I have been given an `sklearn` model pre-trained to predict housing prices in
Boston according to several measures, such as average rooms in a home and data about highway access,
teacher-to-pupil ratios, and so on. I expose the model as a Machine Learning Microservice API using
Python Flask, and operationalize its deployment using Docker and Kubernetes.


### Project Files

This project consists of the following:

* An `sklearn` model pre-trained to predict housing prices in Boston _(**housing.csv, boston_housing_prediction.joblib**)_
* A Python Flash application that acts as a Machine Learning Microservice API for the data _(**app.py, requirements.txt**)_
* A Linux Makefile to prepare the development environment, and to test and lint the source files _(**Makefile**)_
* A Dockerfile to create a Docker container of the Marking Learning Microservice API _(**Dockerfile**)_
* A shell script to automate generation of the Docker container _(**run_docker.sh**)_
* A shell script to automate uploading of the container to Docker Hub _(**upload_docker.sh, password.txt**)_
* A shell script to download the container from Docker Hub and deploy it into a Kubernetes environment _(**run_kubernetes.sh**)_

The project also contains the following:

* A configuration file that CircleCI uses to run QA tests against the source code every time it's checked into GitHub _(**config.yml**)_
* A **.gitignore** file
* Files showing expected output of the application _(**docker_out.txt, kubernetes_out.txt, kubernetes.out.txt**)_ 
* This **README.md** file


### Project Scripts

To run this application, you need to do the following:

1.  Clone the git repository at https://github.com/dstaflund/ml_microservice_operationalization.git
1.  Generate the Docker container for this project
1.  Upload the container to Docker Hub
1.  Deploy the container to Kubernetes


#### Clone the Git Repository

To clone the git repository, do the following:

1.  Download and install git on your operating system
1.  Clone the repository at https://github.com/dstaflund/ml_microservice_operationalization.git onto your system
1.  Open a command-prompt and to the top-level directory of the repository


#### Generate the Docker container

To generate the Docker container, do the following:

1.  Download and install Docker for your operating system _(NB:  This instructions assume you are running a Linux-based operating system)_
1.  Run the following command from your command-prompt:
```shell script
>  ./run_docker.sh
```

When you run this script, the following will occur:

* A Docker image called **dstaflund/prediction:1.0** will be created based on the Dockerfile
* Your Docker images will be listed with the new image appearing among them
* The Machine Learning Microservice API will be started and exposed for use on port 8000

To verify that the API works as expected, open another command-prompt and run the following:

```shell script
> ./make_prediction.sh
```

When you run this script, a call will be sent to the API on port 8000, and the response a be displayed in the
console.  The response will look something like the one found in _/output_text_files/kubernetes.out.txt_.

Output will also be seen in console you used to run docker.  It's output will be similar to that found in
_/output_text_files/docker_out.txt_.

When you're done testing docker, press CTRL-C in the original console to stop the API.


#### Upload the container to Docker Hub

The docker upload script is custom-tailored to upload a container named **dstaflund/prediction:1.0** to my
personal Docker Hub, so you won't be able to run it as I have not provided the password.  However, you would go
through the motions of uploading this container to Docker Hub, by doing the following:

1.  Open a Docker Hub account
1.  Enter your password into the _password.txt_ file
1.  Open a command-prompt and enter the following:

```shell script
> ./upload_docker.sh
```

When executed, this script would upload the above-named container into Docker Hub.

#### Deploy the container to Kubernetes

To run the Docker container in a local Kubernetes environment, do the following:

1.  Download and install **kubectl** for your operating system
1.  Download and install **minikube** for your operating system
1.  Open a command-prompt and enter the following:

```shell script
> ./run_kubernetes.sh
```

When you run this script, the following will occur:

* The Docker image will be downloaded from Docker Hub and deployed to your Kubernetes cluster
* Your Kubernetes pods will be listed with a new **prediction** pod appearing among them
* The Machine Learning Microservice API will be started and exposed for use on port 8000

Output of the run script will be similar to that found in _kubernetes_out.txt_.

To verify that the API works as expected, open another command-prompt and run the following:

```shell script
> ./make_prediction.sh
```

When you run this script, a call will be sent to the API on port 8000, and the response a be displayed in the
console.  The response will look something like the one found in _/output_text_files/kubernetes.out.txt_.

When you're done testing docker, press CTRL-C in the original console to stop the API.
