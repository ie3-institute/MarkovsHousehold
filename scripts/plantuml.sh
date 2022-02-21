#! /bin/bash
java -Djava.awt.headless=true -jar assets/plantuml.jar -tsvg -failfast2 "$@"