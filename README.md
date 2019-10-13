# millsoft/codeception Dockerfile

## What is this?

This is a Dockerfile which contains:
- [Codeception](https://codeception.com/) (default)
- [Robo](https://robo.li/)
- [webdevops/php-dev](https://dockerfile.readthedocs.io/en/latest/content/DockerImages/dockerfiles/php-dev.html) 7.3

## Why?
The [original](https://github.com/Codeception/Codeception) Dockerfile is using php:7.3-cli as base image. It is missing php mysql-pdo extension. You can use codeception to work with databases. If you try to work with mysql, codeception throws an error "file not found, missing PDO driver".

This image uses [webdevops/php-dev](https://dockerfile.readthedocs.io/en/latest/content/DockerImages/dockerfiles/php-dev.html) image. It contains everything you need as a php developer, including PDO mysql drivers.

I also work with parallel codeception testing. I use [robo](https://robo.li/) as a task runner. Installing this everytime on a CI server (eg. jenkins) takes a lot of time, so this image also includes robo.

## How to build this image?
Open the terminal and navigate to the directory of the Dockerfile

```
docker build -t millsoft/codeception .
```

## How to use this image?
Use it like a normal codeception image. For example:

```
docker run --rm  millsoft/codeception
```

this will start codeception.

### How to use Robo?
Use the same image but change the `entrypoint`:

```
docker run --rm --entrypoint robo  millsoft/codeception
```
