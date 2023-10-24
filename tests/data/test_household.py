from datetime import timedelta
from typing import Dict

from markovs_household.data.appliance import (
    Appliance,
    ApplianceCategory,
    ApplianceType,
    ApplianceTypeLoadProfile,
)
from markovs_household.data.household import Household, HouseholdIncome, HouseholdType
from markovs_household.data.probability import SwitchOnProbabilityKey
from markovs_household.data.timeseries import TimeSeries, TimeSeriesEntry
from markovs_household.input.appliances_input import HouseholdAppliancesInput
from markovs_household.utils.time import DayType, Season


class TestHouseholdAppliancesInput(HouseholdAppliancesInput):
    pc = ApplianceTypeLoadProfile(
        ApplianceCategory.PC,
        {SwitchOnProbabilityKey(Season.SPRING, DayType.WEEKDAY, 0): 0.1},
        TimeSeries(
            [TimeSeriesEntry(timedelta(), 50.0)],
            timedelta(hours=1),
        ),
    )

    video_recorder = ApplianceTypeLoadProfile(
        ApplianceCategory.VIDEO_RECORDER,
        {SwitchOnProbabilityKey(Season.SPRING, DayType.WEEKDAY, 0): 0.5},
        TimeSeries(
            [TimeSeriesEntry(timedelta(), 20.0)],
            timedelta(hours=1),
        ),
    )

    washing_machine = ApplianceTypeLoadProfile(
        ApplianceCategory.WASHING_MACHINE,
        {SwitchOnProbabilityKey(Season.SPRING, DayType.WEEKDAY, 0): 0.5},
        TimeSeries(
            [TimeSeriesEntry(timedelta(), 100.0)],
            timedelta(hours=1),
        ),
    )

    @classmethod
    def get_appliance_types(cls) -> Dict[ApplianceCategory, ApplianceType]:
        return {
            ApplianceCategory.PC: cls.pc,
            ApplianceCategory.VIDEO_RECORDER: cls.video_recorder,
            ApplianceCategory.WASHING_MACHINE: cls.washing_machine,
        }

    @classmethod
    def get_household_average_appliances(cls) -> Dict[ApplianceCategory, float]:
        return {ApplianceCategory.PC: 2.0, ApplianceCategory.VIDEO_RECORDER: 0}

    @classmethod
    def get_household_average_appliances_by_no_of_inhabitants(
        cls,
    ) -> Dict[int, Dict[ApplianceCategory, float]]:
        return {
            2: {
                ApplianceCategory.PC: 2.5,
            }
        }

    @classmethod
    def get_household_average_appliances_by_income(
        cls,
    ) -> Dict[HouseholdIncome, Dict[ApplianceCategory, float]]:
        return {
            HouseholdIncome.BELOW_2000: {
                ApplianceCategory.WASHING_MACHINE: 1.0,
                ApplianceCategory.PC: 2.0,
            }
        }

    @classmethod
    def get_household_average_appliances_by_household_type(
        cls,
    ) -> Dict[HouseholdType, Dict[ApplianceCategory, float]]:
        return {
            HouseholdType.FLAT: {
                ApplianceCategory.WASHING_MACHINE: 1.0,
                ApplianceCategory.PC: 3.0,
                ApplianceCategory.VIDEO_RECORDER: 1.0,
            },
            HouseholdType.HOUSE: {
                ApplianceCategory.WASHING_MACHINE: 2.0,
                ApplianceCategory.PC: 2.0,
                ApplianceCategory.VIDEO_RECORDER: 0,
            },
        }


def test_init_household_avg():
    household = Household.from_average_household(TestHouseholdAppliancesInput())

    # household should have only pcs, since video recorders have probability of 0
    assert len(household.appliances) == 2

    for appliance in household.appliances:
        assert appliance.appliance_type == TestHouseholdAppliancesInput.pc
        assert appliance.get_operation_intervals() == []


def test_init_household_by_no_of_inhabitants():
    household = Household.from_no_of_inhabitants(TestHouseholdAppliancesInput(), 2)

    # it's random, could be either
    assert len(household.appliances) == 2 or len(household.appliances) == 3

    for appliance in household.appliances:
        assert appliance.appliance_type == TestHouseholdAppliancesInput.pc
        assert appliance.get_operation_intervals() == []


def test_init_household_by_income():
    household = Household.from_income(TestHouseholdAppliancesInput(), 1900.0)

    assert len(household.appliances) == 3

    assert (
        Appliance(TestHouseholdAppliancesInput.washing_machine, [])
        in household.appliances
    )
    assert Appliance(TestHouseholdAppliancesInput.pc, []) in household.appliances


def test_init_household_by_household_type():
    household = Household.from_household_type(
        TestHouseholdAppliancesInput(), HouseholdType.FLAT
    )

    assert len(household.appliances) == 5

    assert (
        Appliance(TestHouseholdAppliancesInput.washing_machine, [])
        in household.appliances
    )
    assert Appliance(TestHouseholdAppliancesInput.pc, []) in household.appliances
    assert (
        Appliance(TestHouseholdAppliancesInput.video_recorder, [])
        in household.appliances
    )
