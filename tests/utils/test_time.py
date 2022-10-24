from datetime import datetime

from markovs_household.utils.time import Season, DayType


def test_get_season():
    spring = datetime(year=2021, month=3, day=16)
    summer = datetime(year=2021, month=6, day=16)
    autumn = datetime(year=2021, month=9, day=16)
    winter = datetime(year=2021, month=12, day=16)
    assert(Season.get_season(spring) is Season.SPRING)
    assert(Season.get_season(summer) is Season.SUMMER)
    assert(Season.get_season(autumn) is Season.AUTUMN)
    assert(Season.get_season(winter) is Season.WINTER)


def test_get_day_type():
    friday = datetime(year=2021, month=11, day=12)
    saturday = datetime(year=2021, month=11, day=13)
    sunday = datetime(year=2021, month=11, day=14)
    assert(DayType.get_day_type(friday) is DayType.WEEKDAY)
    assert(DayType.get_day_type(saturday) is DayType.SATURDAY)
    assert(DayType.get_day_type(sunday) is DayType.SUNDAY)

