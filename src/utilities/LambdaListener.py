from selenium import webdriver
from robot.libraries.BuiltIn import BuiltIn
from hashlib import new
from os import access


class LambdaListener:
    ROBOT_LISTENER_API_VERSION = 2
    ROBOT_LIBRARY_SCOPE = "GLOBAL"
    
    def __init__(self) -> None:
        self.ROBOT_LIBRARY_LISTENER = self


    def start_suite(self, name, attributes):
        attributes['doc'] = 'Documentation set by listener'

    
    def end_test(self, name, attributes):
        report_lambdatest_status(name, attributes['status'])
        print(name)
        print(attributes['status'])


    def end_suite(self, name, attributes):
        print('=== ALREADY UPDATE TEST RESULT INTO LAMBDATEST ===')



# def report_lambdatest_status(name, status):
#     selenium = BuiltIn().get_library_instance('SeleniumLibrary')
#     # Mark test status pass/failed
#     lambda_status = "passed"  if status=="PASS" else "failed"
#     lambda_status_script = 'lambda-status={}'.format(lambda_status)
#     selenium.execute_javascript(lambda_status_script)
#     # Update test name
#     lambda_status_script = 'lambda-name={}'.format(name)
#     selenium.execute_javascript(lambda_status_script)

