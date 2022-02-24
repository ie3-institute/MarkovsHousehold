from typing import Dict

from markovs_household.input.appliances_input import Input
from markovs_household.data.appliance import ApplianceCategory, ApplianceType, ApplianceTypeConstantPower, Appliance
from markovs_household.data.household import Household, HouseholdType, HouseholdIncome
from markovs_household.data.probability import SwitchOnProbabilities, SwitchOnProbabilityKey
from markovs_household.utils.time import Season, DayType


class TestInput(Input):
    pc = ApplianceTypeConstantPower(
        ApplianceCategory.PC,
        SwitchOnProbabilities(
            {
                SwitchOnProbabilityKey(Season.SPRING, DayType.WORKING_DAY, 0): 0.1
            }
        ),
        50.0
    )

    video_recorder = ApplianceTypeConstantPower(
        ApplianceCategory.VIDEO_RECORDER,
        SwitchOnProbabilities(
            {
                SwitchOnProbabilityKey(Season.SPRING, DayType.WORKING_DAY, 0): 0.5
            }
        ),
        20.0
    )

    washing_machine = ApplianceTypeConstantPower(
        ApplianceCategory.WASHING_MACHINE,
        SwitchOnProbabilities(
            {
                SwitchOnProbabilityKey(Season.SPRING, DayType.WORKING_DAY, 0): 0.5
            }
        ),
        100.0
    )

    @classmethod
    def get_appliance_types(cls) -> Dict[ApplianceCategory, ApplianceType]:
        return {
            ApplianceCategory.PC: cls.pc,
            ApplianceCategory.VIDEO_RECORDER: cls.video_recorder,
            ApplianceCategory.WASHING_MACHINE: cls.washing_machine
        }

    @classmethod
    def get_household_average_appliances(cls) -> Dict[ApplianceCategory, float]:
        return {
            ApplianceCategory.PC: 2.0,
            ApplianceCategory.VIDEO_RECORDER: 0
        }

    @classmethod
    def get_household_average_appliances_by_no_of_inhabitants(cls) -> dict[int, dict[ApplianceCategory, float]]:
        return {
            2: {
                ApplianceCategory.PC: 2.5,
            }
        }

    @classmethod
    def get_household_average_appliances_by_income(cls) -> dict[HouseholdIncome, dict[ApplianceCategory, float]]:
        return {
            HouseholdIncome.BELOW_2000: {
                ApplianceCategory.WASHING_MACHINE: 1.0,
                ApplianceCategory.PC: 2.0
            }
        }

    @classmethod
    def get_household_average_appliances_by_household_type(cls) -> dict[HouseholdType, dict[ApplianceCategory, float]]:
        return {
            HouseholdType.FLAT: {
                ApplianceCategory.WASHING_MACHINE: 1.0,
                ApplianceCategory.PC: 3.0,
                ApplianceCategory.VIDEO_RECORDER: 1.0
            },
            HouseholdType.HOUSE: {
                ApplianceCategory.WASHING_MACHINE: 2.0,
                ApplianceCategory.PC: 2.0,
                ApplianceCategory.VIDEO_RECORDER: 0
            }
        }


def test_init_household_avg():
    household = Household.from_average_household(TestInput())

    # household should have only pcs, since video recorders have probability of 0
    assert (len(household.appliances) == 2)

    for appliance in household.appliances:
        assert (appliance.appliance_type == TestInput.pc)
        assert (appliance.operation_intervals == [])


def test_init_household_by_no_of_inhabitants():
    household = Household.from_no_of_inhabitants(TestInput(), 2)

    # it's random, could be either
    assert (len(household.appliances) == 2 or len(household.appliances) == 3)

    for appliance in household.appliances:
        assert (appliance.appliance_type == TestInput.pc)
        assert (appliance.operation_intervals == [])


def test_init_household_by_income():
    household = Household.from_income(TestInput(), 1900.0)

    assert (len(household.appliances) == 3)

    assert (Appliance(TestInput.washing_machine, []) in household.appliances)
    assert (Appliance(TestInput.pc, []) in household.appliances)


def test_init_household_by_household_type():
    household = Household.from_household_type(TestInput(), HouseholdType.FLAT)

    assert (len(household.appliances) == 5)

    assert (Appliance(TestInput.washing_machine, []) in household.appliances)
    assert (Appliance(TestInput.pc, []) in household.appliances)
    assert (Appliance(TestInput.video_recorder, []) in household.appliances)
