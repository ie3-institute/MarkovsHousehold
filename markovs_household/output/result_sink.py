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

    # todo fill the rest with zeroes? or is it enough to set first values to 0 after a power != 0

    return timeseries
