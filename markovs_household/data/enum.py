from enum import Enum


class DayType(Enum):
    """
    Enumeration of all day types
    """

    WORKING_DAY = "working day"
    SATURDAY = "saturday"
    SUNDAY = "sunday"


class Season(Enum):
    """
    Enumeration of all seasons
    """
    SPRING = "spring"
    SUMMER = "summer"
    AUTUMN = "autumn"
    WINTER = "winter"
