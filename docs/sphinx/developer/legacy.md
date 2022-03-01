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