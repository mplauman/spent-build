# Stolen from here:
# https://container-solutions.com/tagging-docker-images-the-right-way/

export NAME   := mplauman/spent-build
export TAG	  := $(shell git log -1 --pretty=%h)
export IMG	  := ${NAME}:${TAG}
export LATEST := ${NAME}:latest

.PHONY: image push

build:
	@docker build -t ${IMG} . --build-arg GIT_COMMIT=${TAG}
	@docker tag ${IMG} ${LATEST}

# The DOCKER_USER and DOCKER_PASS environment variables are sensitive
# and should be stored securely on the CI/CD system.
deploy:
	@docker login -u ${DOCKER_USER} -p ${DOCKER_PASS}
	@docker push ${NAME}

