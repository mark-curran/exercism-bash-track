# Exercism Solutions

A collection of solutions to the some exercises from [exericism.io](https://exercism.io).

## Configuring the cli to Download and Submit Solutions

Download the [exercism cli](https://exercism.org/docs/using/solving-exercises/working-locally) and run

`exercism config -w [PATH TO ROOT OF RESPOSITORY]`

The page for each individual exercise on the exercism website will contain a cli command to download the exercise. If the exercism cli is configured as above, then the exercise will be automatically downloaded to the correct subfolder.

## Configuring a devcontainer

The subfolder of each language track will contain a `.devcontainer` subfolder with a [devcontainer configuration](https://code.visualstudio.com/docs/devcontainers/containers) that is compatible with the Remote Containers VSCode extension. Alternatively, one can run build the docker container directly from the command line.

This container should contain all the necessary binaries to compile and test solutions for the given language track.

However, the `.devcontainer` folder [must be in the root directory of the repository in order to be recognized by VSCode](https://code.visualstudio.com/docs/devcontainers/containers#_create-a-devcontainerjson-file). If you would like to work on a specific language track, then symlink the `./[LANGUAGE]/.devcontianer` folder to `./.devcontainer` and then launch the Remote Containers extension.

## Language Tracks

### Bash

The bash subfolder contains solutions to the [exercism.io bash track](https://exercism.org/tracks/bash).

For this language track you can submit solutions by submitting the single shell script containing the solution.

### Scala

The scala subfolder contains solution to the [exercism.io scala track](https://exercism.org/tracks/scala).

For this language track you can submit solutions by submitting the single `.scala` file containing the solution.
