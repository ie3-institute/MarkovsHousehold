from enum import Enum


class ApplianceCategory(Enum):
    """
    Enumeration of all considered appliance types
    """

    DISH_WASHER = "dish_washer"
    WASHING_MACHINE = "washing_machine"
    DRYER = "dryer"
    STOVE = "stove"
    FRIDGE = "fridge"
    FREEZER = "freezer"
    TELEVISION = "television"
    VIDEO_RECORDER = "video_recorder"  # what year is it?
    PC = "pc"
    TELECOMMUNICATION = "telecommunication"
    LIGHTING = "lighting"
    WATER_HEATING = "water_heating"
    OTHER_LOAD = "other_load"
