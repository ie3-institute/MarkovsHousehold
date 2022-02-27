from dataclasses import dataclass
import yaml

@dataclass(frozen=True)
class Configuration:
    consider_load_shifting: bool
    simulate_typical_days: bool

    @staticmethod
    def parse_config(path):
        with open(path, "r") as ymlfile:
            config = yaml.safe_load(ymlfile)
        return Configuration(
            config["consider_load_shifting"],
            config["simulate_typical_days"]
        )
