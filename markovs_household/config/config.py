from dataclasses import dataclass
import yaml


@dataclass(frozen=True)
class Configuration:
    consider_load_shifting: bool
    simulate_typical_days: bool
    calculate_switch_on_probabilities: bool
    switch_on_probabilities_folder: str

    usage_probability_washing_machine: float
    usage_probability_lighting: float
    usage_probability_dish_washer: float
    usage_probability_video_recorder: float
    usage_probability_telecommunication: float
    usage_probability_PC: float
    usage_probability_fridge: float
    usage_probability_television: float
    usage_probability_freezer: float
    usage_probability_dryer: float
    usage_probability_stove: float
    usage_probability_water_heating: float

    @staticmethod
    def parse_config(path):
        with open(path, "r") as ymlfile:
            config = yaml.safe_load(ymlfile)
        return Configuration(
            config["consider_load_shifting"],
            config["simulate_typical_days"],
            config["calculate_switch_on_probabilities"],
            config["switch_on_probabilities_folder"],

            config["usage_probability_washing_machine"],
            config["usage_probability_lighting"],
            config["usage_probability_dish_washer"],
            config["usage_probability_video_recorder"],
            config["usage_probability_telecommunication"],
            config["usage_probability_PC"],
            config["usage_probability_fridge"],
            config["usage_probability_television"],
            config["usage_probability_freezer"],
            config["usage_probability_dryer"],
            config["usage_probability_stove"],
            config["usage_probability_water_heating"]


        )
