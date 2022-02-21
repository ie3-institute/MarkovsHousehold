#! /bin/bash

# gets called by the plantuml task of the Makefile within the docs/sphinx directory to generate svgs from the puml files
JAR="assets/plantuml.jar"
if [ ! -f "$JAR" ]; then
echo "Downloading plantuml jar script"
curl -LJo $JAR https://github.com/plantuml/plantuml/releases/download/v1.2022.1/plantuml-1.2022.1.jar
fi
echo "Generating SVGs from puml files"
java -Djava.awt.headless=true -jar $JAR -tsvg -failfast2 "$@"
echou "Done"