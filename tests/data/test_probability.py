from markovs_household.data.probability import SwitchOnProbabilityKey
from tests.common import test_data


def test_extract_from_datetime():
    timestamp = test_data.DATE_TIME_KEY_PAIR[0]
    expected = test_data.DATE_TIME_KEY_PAIR[1]
    actual = SwitchOnProbabilityKey.extract_from_datetime(timestamp)
    assert actual == expected
