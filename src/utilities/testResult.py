from selenium import webdriver
from robot.libraries.BuiltIn import BuiltIn
from hashlib import new
from os import access

def report_lambdatest_status(name, status):
    wd = webdriver.Chrome(executable_path="C:\\Users\\hong.le\\IdeaProjects\\RF-Mobile-Demo\\asset\\chromedriver.exe")
    wd.execute_script("")
    