from dataclasses import dataclass
from typing import Dict
import logging

from markovs_household.data.enum import Season, DayType


@dataclass(frozen=True)
class SwitchOnProbabilityKey:
    season: Season
    day_type: DayType


@dataclass(frozen=True)
class SwitchOnProbabilites:
    __probabilities: Dict[SwitchOnProbabilityKey, float]

    def getSeasonalProbability(self, key: SwitchOnProbabilityKey) -> float:
        try:
            return self.__probabilities[key]
        except KeyError as exc:
            logging.error(f"Couldn't find a switch on probability for key: {key}")
            raise exc
