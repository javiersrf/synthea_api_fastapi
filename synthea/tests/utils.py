import datetime


def as_str(value):
    if isinstance(value, datetime.datetime):
        return value.isoformat()
