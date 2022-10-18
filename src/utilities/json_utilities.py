import logging
from typing import Any
from jsonschema import validate
import json, jsonschema, os


def jsonify(data) -> Any:
    return json.dumps(data)


def load_json_from_string(input_string) -> Any:
    """
    == Description ==
    Get Json data from the input string
    == Arguments ==
    *${input_string}:* (string) (required) the input string
    == Returns ==
    Json data
    """
    return json.loads(str(input_string))


def convert_json_to_string(file_name) -> str:
    """
    == Description ==
    Convert Json data from the input file to string
    == Arguments ==
    *${file_name}:* (string) (required) the input path file
    == Returns ==
    String
    """
    file_path = ("%s/resources/%s.json" % (os.getcwd(), file_name))
    with open(file_path, mode='r') as read_file:
        data = json.dumps(read_file)
    return data


def load_resource_json(file_name, env_type='common') -> Any:
    """
    == Description ==
    Load Json data from the input resource file
    == Arguments ==
    *${file_name}:* (string) (required) the input resource file
    *${env_type}:* (string) (optional) the environment type
    == Returns ==
    Json data
    """
    file_path = ''
    if(env_type == 'common'):
        file_path = ("%s/resources/%s.json" % (os.getcwd(), file_name))
    else:
        file_path = ("%s/resources/%s/%s.json" % (os.getcwd(), env_type, file_name))
    with open(file_path, mode='r') as read_file:
        data = json.load(read_file)
    return data


def load_json_from_file_path(file_path) -> Any:
    """
    == Description ==
    Load Json data from the input file path
    == Arguments ==
    *${file_path}:* (string) (required) the input file path
    == Returns ==
    Json data
    """
    with open(file_path, mode='r') as read_file:
        data = json.load(read_file)
    return data


def verify_schema(json_data, schema_file) -> bool:
    """
    == Description ==
    Verify whether Json data is valid or not
    == Arguments ==
    *${json_data}:* (json) (required) the input Json data
    *${schema_file}:* (string) (required) the input schema file name
    == Returns ==
    *True* if the input Json data is valid
    *False* if the input Json data is invalid
    """
    try:
        validate(instance=load_json_from_string(json_data), schema=load_resource_json(schema_file))
    except jsonschema.exceptions.ValidationError as err:
        logging.info(err.message)
        return False
    return True


def save_json(json_data, file_name) -> None:
    """
    == Description ==
    Save Json data from the input file name
    == Arguments ==
    *${json_data}:* (string) (required) the input Json data
    *${file_name}:* (string) (required) the input file name
    """
    file_path = ("%s/resources/%s.json" % (os.getcwd(), file_name))
    file_object = open(file_path, 'w')
    json.dump(json_data, file_object)