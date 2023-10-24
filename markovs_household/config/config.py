from dataclasses import dataclass
from datetime import datetime
from pathlib import Path

import yaml


@dataclass(frozen=True)
class Configuration:
    consider_load_shifting: bool
    simulate_typical_days: bool
    start: datetime
    end: datetime
    probabilities_path: str
    nr_houses: int

    @staticmethod
    def parse_config(path):
        path = Path(path).resolve()

        with open(path, "r") as ymlfile:
            config = yaml.safe_load(ymlfile)
        dt_fmt = "%Y-%m-%d %H:%M"
        start = datetime.strptime(config["start"], dt_fmt)
        end = datetime.strptime(config["end"], dt_fmt)
        return Configuration(
            consider_load_shifting=config["consider_load_shifting"],
            simulate_typical_days=config["simulate_typical_days"],
            probabilities_path=config["probabilities_path"],
            nr_houses=config["nr_houses"],
            start=start,
            end=end,
        )
