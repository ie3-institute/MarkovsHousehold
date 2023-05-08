import csv
import os
import tempfile
from datetime import datetime, timedelta

from markovs_household.data.appliance import Appliance
from markovs_household.data.household import Household
from markovs_household.output.result_sink import create_timeseries, write_timeseries
from markovs_household.utils.time import TimeInterval
from tests.common.test_data import PC, STOVE, VIDEO_RECORDER, WASHING_MACHINE


def test_create_timeseries():
    pc_start = datetime(year=2021, month=11, day=11, hour=11)
    video_recorder_start = datetime(year=2021, month=11, day=11, hour=11, minute=30)
    washing_machine_start = datetime(year=2021, month=11, day=11, hour=16, minute=15)
    stove_start = datetime(year=2021, month=11, day=11, hour=16, minute=30)

    appliances = [
        Appliance(PC, [TimeInterval(pc_start, pc_start + PC.get_operation_time())]),
        Appliance(
            VIDEO_RECORDER,
            [
                TimeInterval(
                    video_recorder_start,
                    video_recorder_start + VIDEO_RECORDER.get_operation_time(),
                )
            ],
        ),
        Appliance(
            WASHING_MACHINE,
            [
                TimeInterval(
                    washing_machine_start,
                    washing_machine_start + WASHING_MACHINE.get_operation_time(),
                )
            ],
        ),
        Appliance(
            STOVE,
            [
                TimeInterval(
                    stove_start,
                    stove_start + STOVE.get_operation_time(),
                )
            ],
        ),  # stove has a fine resolution of its time series, thus only first entry is used here
    ]
    hh = Household(appliances)

    timeseries = create_timeseries(hh, timedelta(minutes=15))

    expected = {
        datetime(year=2021, month=11, day=11, hour=11, minute=0): 50.0,
        datetime(year=2021, month=11, day=11, hour=11, minute=15): 50.0,
        datetime(year=2021, month=11, day=11, hour=11, minute=30): 70.0,
        datetime(year=2021, month=11, day=11, hour=11, minute=45): 70.0,
        datetime(year=2021, month=11, day=11, hour=12, minute=0): 20.0,
        datetime(year=2021, month=11, day=11, hour=12, minute=15): 20.0,
        datetime(year=2021, month=11, day=11, hour=12, minute=30): 0.0,
        datetime(year=2021, month=11, day=11, hour=16, minute=15): 100.0,
        datetime(year=2021, month=11, day=11, hour=16, minute=30): 200.0,
        datetime(year=2021, month=11, day=11, hour=16, minute=45): 100.0,
        datetime(year=2021, month=11, day=11, hour=17, minute=0): 100.0,
        datetime(year=2021, month=11, day=11, hour=17, minute=15): 100.0,
        datetime(year=2021, month=11, day=11, hour=17, minute=30): 100.0,
        datetime(year=2021, month=11, day=11, hour=17, minute=45): 0.0,
    }
    assert timeseries == expected


def test_write_timeseries():
    # disable automatic deletion, we handle this manually
    tmp_file = tempfile.NamedTemporaryFile(
        mode="w+", delete=False, prefix="mhh_write_result_", suffix=".csv"
    )
    # close it again right away (Windows does not like opening it a second time)
    tmp_file.close()

    timeseries = {
        datetime(year=2021, month=11, day=11, hour=11, minute=0): 50.0,
        datetime(year=2021, month=11, day=11, hour=11, minute=15): 60.0,
        datetime(year=2021, month=11, day=11, hour=11, minute=30): 70.0,
        datetime(year=2021, month=11, day=11, hour=11, minute=45): 100.0,
        datetime(year=2021, month=11, day=11, hour=12, minute=0): 20.0,
        datetime(year=2021, month=11, day=11, hour=12, minute=15): 20.0,
        datetime(year=2021, month=11, day=11, hour=12, minute=30): 0.0,
    }

    # write timeseries
    write_timeseries(timeseries, tmp_file.name)

    # open file again in read mode
    with open(tmp_file.name, mode="r", newline="") as read_file:
        csv_reader = csv.DictReader(read_file, delimiter=",")
        assert csv_reader.fieldnames == ["time", "power"]

        read_result: dict[datetime, float] = {}
        for row in csv_reader:
            datetime_obj = datetime.strptime(row["time"], "%Y-%m-%d %H:%M:%S")
            read_result[datetime_obj] = float(row["power"])

        assert read_result == timeseries

    # clean up: delete temporary file
    os.remove(tmp_file.name)