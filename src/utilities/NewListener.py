from lib2to3.pgen2 import driver
from selenium import webdriver
from hashlib import new
from os import access


class NewListener:
    ROBOT_LISTENER_API_VERSION = 2
    ROBOT_LIBRARY_SCOPE = "GLOBAL"

    def end_test(self, name, attributes):
        print("Test Status", attributes['status'])
        status= attributes['status']
        driver = webdriver.Chrome(executable_path="C:\\Users\\hong.le\\IdeaProjects\\RF-Mobile-Demo\\asset\chromedriver.exe")
        driver.execute_script("lambda-status=failed")
        # driver.execute_script("lambda-status={}", status)
        

