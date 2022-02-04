# Simulation Overview

The monte carlo simulation should stochastically calculate the power draw of a household.
The power draw of a house is the aggregate of the power draw of all appliances.
To calculate the power draw of all appliances we determine which one of these are turned on:

![Appliance State](../images/uml/appliance_state.svg)

Considering the appliances' state the power draw is conceptually calculated as follows:

![Household Power Calculation](../images/uml/power_calculation.svg)

For every appliance the power draw is determined by a power time series that is read in at the start of the simulation.
The time series can be either constant or variable with respect to the time since it started operating

