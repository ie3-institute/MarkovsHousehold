from dataclasses import dataclass
from enum import Enum
from datetime import datetime, timedelta


class Season(Enum):
    """
    Enumeration of all seasons
    """

    SPRING = "spring"
    SUMMER = "summer"
    AUTUMN = "autumn"
    WINTER = "winter"

    @staticmethod
    def get_season(date_time: datetime):
        """
        Extracts the season of a datetime instance.
        :param date_time: datetime instance
        :return: a Season value
        """
        month: int = date_time.month
        if 3 <= month <= 5:
            return Season.SPRING
        elif 6 <= month <= 8:
            return Season.SUMMER
        elif 9 <= month <= 11:
            return Season.AUTUMN
        else:
            return Season.WINTER


class DayType(Enum):
    """
    Enumeration of all day types
    """

    WORKING_DAY = "working day"
    SATURDAY = "saturday"
    SUNDAY = "sunday"

    @staticmethod
    def get_day_type(date_time: datetime):
        """
        Extracts the DayType of a datetime instance.
        :param date_time: datetime instance
        :return: a DayType value
        """
        weekday = date_time.weekday()
        if weekday < 5:
            return DayType.WORKING_DAY
        if weekday == 5:
            return DayType.SATURDAY
        if weekday == 6:
            return DayType.SUNDAY


def get_quarterly_hour_of_day(date_time: datetime) -> int:
    """
    Calculates the current 15 minute interval of a datetime instance
    :param date_time: the datetime instance
    :return: the 15 minute interval
    """
    return (date_time.hour * 60 + date_time.minute) // 15


@dataclass(frozen=True)
class TimeInterval:
    """
    Operation interval consisting of a start and end
    """

    start: datetime
    end: datetime

    @classmethod
    def get_operation_interval(cls, start: datetime, duration: timedelta):
        """
        Get the time interval from its start datetime and its duration
        :param start: start of the time interval
        :param duration: duration of the time interval
        :return:
        """
        return TimeInterval(start, start + duration)
