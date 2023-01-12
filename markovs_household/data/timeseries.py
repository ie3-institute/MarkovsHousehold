from dataclasses import dataclass
from typing import Dict


@dataclass(frozen=True)
class TimeSeries:
    """
    Data class to represent time series
    :values: a mapping from a time step to its value
    :type values: dict[int, float]
    """

    values: Dict[int, float]
