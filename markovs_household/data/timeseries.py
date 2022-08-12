from collections import namedtuple
from dataclasses import dataclass
from datetime import timedelta

TimeSeriesEntry = namedtuple("TimeSeriesEntry", "time, value")


@dataclass(frozen=True)
class TimeSeries:
    """
    Data class to represent time series. The time series is configured in an event-discrete way. A value that is set
    at a certain second value is valid until the start second value of the following entry.
    :values: a mapping from a time in seconds (from operation start) to power in kW
    :length: the total length of the time series
    """
    values: list[TimeSeriesEntry]
    length: timedelta
