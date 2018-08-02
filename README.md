
# Wordpress on ECS

Practical example on how to get a Wordpress running under an Amazon ECS Cluster using different technologies.

## Technologies

* [Wordpress](https://wordpress.org/)
* [Packer](https://www.packer.io/)
* [Docker](https://www.docker.com/)
* [Ansible](https://www.ansible.com/)
* [Terraform](https://www.terraform.io/)
* [Amazon ECS](https://aws.amazon.com/ecs/)
* [Amazon RDS](https://aws.amazon.com/es/rds/)

## Requirements

To use this example you will need an [AWS](https://aws.amazon.com/es/) account and:

* [Packer](https://www.packer.io/downloads.html)
* [Terraform](https://www.terraform.io/downloads.html)
* [Docker](https://docs.docker.com/engine/installation/)

## Usage

1. Build the Wordpress container.

Packer will use a [base Docker image with Ansible](https://github.com/Mistawes/terraform-ecs/blob/master/Dockerfile) to provision all the applications needed to run a Wordpress. The result will be saved into a container named `mistawes/wp-packer` with a version tag `4.5`.

**Note**: If you want to change the image tag you have to change it in `wp-packer.json` and `wordpress.json`.

```
# packer build wp-packer.json
```

2. Push the container to [Dockerhub](https://hub.docker.com/)

Check that the image is ready.

```
# docker images

REPOSITORY                 TAG                 IMAGE ID            CREATED             SIZE
mistawes/wp-packer        4.5               1b4bb32f167a        2 hours ago         138.2 MB
```

Then you can push it to Dockerhub.

```
# docker login
# docker push mistawes/wp-packer:4.5
```

3. Deploy all the infrastructure needed on AWS using Terraform.

```
# terraform apply
```

Once deployed, Terraform will display the ECS Container Instances public IPs and the [ELB](https://aws.amazon.com/es/elasticloadbalancing/) URL that will distribute the traffic across the different Wordpress container instances.

The RDS connection parameters will be passed on runtime to the Wordpress containers via environment variables.

4. Once not needed, we can remove all the AWS infrastructure:


```
# terraform destroy
```
