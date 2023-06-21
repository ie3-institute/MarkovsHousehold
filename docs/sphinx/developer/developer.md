# Developer's guide

In this section you will find any kind of information, that you might want to be equipped with as a developer.
If you don't feel like a developer, you might as well get a look under the hood.

```{eval-rst}
.. toctree::
   :maxdepth: 2
   :caption: Contents:

   legacy.md
```

## Rendering UML Diagrams to include  into documentation

To include UML diagrams within the documentation the diagrams have to be rendered to `.svg` files first.
This can be easily done by utilising the `plantuml` task within the `Makefile`.
This task is triggered by executing `make plantuml` in a terminal in the `docs/sphinx` directory of the project or `make -C docs/sphinx plantuml` from the root directory of the project.

:::{important} 
This task will only convert files within the `docs/puml` directory and its subdirectories. 
All converted files will be located in `docs/images/uml`.
:::