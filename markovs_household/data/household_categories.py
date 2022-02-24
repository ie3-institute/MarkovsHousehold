from enum import Enum


class HouseholdIncome(Enum):
    """
    Enumeration of household income levels
    """
    BELOW_900 = "below 900"
    BELOW_1300 = "from 900 to 1300"
    BELOW_1500 = "from 1300 to 1500"
    BELOW_2000 = "from 1500 to 2000"
    BELOW_2600 = "from 2000 to 2600"
    BELOW_3600 = "from 2600 to 3600"
    BELOW_5000 = "from 3600 to 5000"
    BELOW_18000 = "from 5000 to 18000"

    @classmethod
    def from_income(cls, income: float) -> "HouseholdIncome":
        if income < 900:
            return cls.BELOW_900
        elif income < 1300:
            return cls.BELOW_1300
        elif income < 1500:
            return cls.BELOW_1500
        elif income < 2000:
            return cls.BELOW_2000
        elif income < 2600:
            return cls.BELOW_2600
        elif income < 3600:
            return cls.BELOW_3600
        elif income < 5000:
            return cls.BELOW_5000
        else:
            return cls.BELOW_18000


class HouseholdType(Enum):
    """
    Enumeration of different household types
    """
    FLAT = "flat"
    HOUSE = "house"
