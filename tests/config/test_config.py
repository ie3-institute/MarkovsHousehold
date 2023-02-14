import os.path

from markovs_household.config.config import Configuration
from tests.common.utils import TEST_RESOURCES_DIR


def test_parse_config():
    test_config_path = os.path.join(TEST_RESOURCES_DIR, "config.yaml")
    config = Configuration.parse_config(test_config_path)
    assert config.consider_load_shifting is False
    assert config.simulate_typical_days is False
