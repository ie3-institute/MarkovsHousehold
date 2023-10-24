import random
import sys
from datetime import timedelta

from markovs_household.config.config import Configuration
from markovs_household.data.household import Household
from markovs_household.input.appliances_input import (
    ApplianceInitStrategy,
    CsvHouseholdAppliancesInput,
)


def main():
    # Check if the path argument is provided
    if len(sys.argv) != 2:
        print("Usage: python -m markovs_household.main <path_to_config>")
        sys.exit(1)

    # Get the path from the command line arguments
    test_config_path = sys.argv[1]

    random.seed(42)
    config = Configuration.parse_config(test_config_path)
    hh_input = CsvHouseholdAppliancesInput(config.probabilities_path, ";")
    timestep = timedelta(minutes=15)

    init_strategy = ApplianceInitStrategy.AVERAGE
    print("Household initialization...")
    households = Household.initialize_households(
        hh_input, init_strategy, config.nr_houses
    )

    print("Running simulation...")
    time = config.start
    while time < config.end:
        # TODO: this can be parallelized
        for household in households:
            household.step(time)
        time += timestep

    print("Simulation done")


if __name__ == "__main__":
    main()
