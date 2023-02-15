from markovs_household.data.household_categories import HouseholdIncome, HouseholdType
from markovs_household.input.appliances_input import CsvHouseholdAppliancesInput
from markovs_household.utils.appliance import ApplianceCategory
from tests.common.utils import TEST_RESOURCES_DIR


def test_csv_household_appliances_input():
    hh_input = CsvHouseholdAppliancesInput(TEST_RESOURCES_DIR, ";")
    assert len(hh_input.average_hh) == len(ApplianceCategory)
    assert len(hh_input.appliance_types) == len(ApplianceCategory)
    assert len(hh_input.by_income) == len(HouseholdIncome)
    assert len(hh_input.by_type) == len(HouseholdType)
