from dataclasses import dataclass
from datetime import timedelta

from pandas import Series


@dataclass(frozen=True)
class TimeSeriesEntry:
    time: timedelta  # since start of time series
    value: float  # in kW


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

    @classmethod
    def from_quarter_hour_series(cls, series: Series):
        entries = []
        for idx, x in enumerate(series.dropna()):
            td = timedelta(minutes=idx)
            entries.append(TimeSeriesEntry(td, x))
        return TimeSeries(entries, timedelta(minutes=15 * len(series)))

    @classmethod
    def for_constant_running_load(cls, load: float):
        # todo: check how we ensure that this load is always on
        return TimeSeries([TimeSeriesEntry(timedelta(), load)], timedelta(hours=24))
