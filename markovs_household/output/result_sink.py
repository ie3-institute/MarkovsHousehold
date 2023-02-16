from datetime import timedelta, datetime

from markovs_household.data.household import Household


def create_timeseries(hh: Household, step_size: timedelta):
    timeseries: dict[datetime, float] = {}

    for appliance in hh.appliances:
        intervals = appliance.operation_intervals()

        for interval in intervals:
            appliance_series = appliance.appliance_type.get_time_series_for(step_size)
            date = interval.start

            for power in appliance_series:
                old_value = timeseries.get(date, 0.0)
                timeseries[date] = old_value + power

                date = date + step_size

            # set the value that follows the last of the appliance
            # time series values to 0, if it has not been set yet
            if timeseries.get(date) is None:
                timeseries[date] = 0.0

    return timeseries
