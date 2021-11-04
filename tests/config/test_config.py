from markovs_household.config.config import Configuration


def test_parse_config():
    test_config_path = "tests/input/config.yaml"
    config = Configuration.parse_config(test_config_path)
    assert (config.consider_load_shifting is False)
    assert (config.consider_load_shifting is False)
