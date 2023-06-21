# Legacy documentation

## Operation modes
The legacy, MatLab-based routine offers two operation modes:
1. **Markovian chain-based sampling**

    Having a distinct household with several appliances, the time-discrete simulation proceeds in time and switches on different appliances based on the switch-on probabilities found in Markovian chains.
    If a device is switched on, a pre-defined time series for the appliance is replayed.
    The totality of time-series is then aggregated afterwards.

2. **Probability weighted aggregation**

    Once again, this mode is as well time-discrete.
    Based on the given switch-on probability, the rated apprent power of an appliance is weighted with this probability and the totality of consumed power is accumulated.

:::{admonition} Refactoring note
For the refactoring, we will foremost focus on operation mode 1 and maybe add 2 later.
:::

## Input Data
1. **Read probability**

Eingabeoberflaeche Wahrscheinlichkeit Leistung.xls
- Loadprofile for appliance classes from "Synergy Potential of Smart Appliances" (2008)
- Hourly switch-on-probability: $$p_{on,1h}$$ for appliance and season
- Usage probability (days/year) $$p_{use}$$ for appliance and season

$$\underbrace {\begin{bmatrix} p_{1, spring} & \dots &p_{1,winter}\\ \vdots &\vdots&\vdots \\ p_{96, spring} & \dots &p_{96,winter}\end{bmatrix}}_{\mathbf{M_{Wk}}}= \frac {p_{ein,1h}} {4} \cdot p_{use}$$

2. **Read input interface**

Eingabeoberflaeche Haushalte.xls
- Criteria: average household, number of residents, income, housetype
- number of households to be simulated
- number of appliaces according to criteria


3. **Define variables**

- configuration parameters
- timesteps per day
- number of days to be simulated