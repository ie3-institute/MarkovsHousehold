# Developer Documentation

## Rendering UML Diagrams to include  into documentation

To include UML diagrams within the documentation the diagrams have to be rendered to `.svg` files first.
This can be easily done by utilising the `plantuml` task within the `Makefile`.
This task is triggered by executing `make plantuml` in a terminal in the root directory of the project.

:::{important} 
This task will only convert files within the `docs/puml` directory and its subdirectories. 
All converted files will be located in `docs/images/uml`.
:::