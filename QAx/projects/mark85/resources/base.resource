*** Settings ***

Library        Browser

Resource       env.resource

Resource       pages/components/Header.resource
Resource       pages/components/Notice.resource
Resource       pages/components/Alert.resource

Resource       pages/SignupPage.resource
Resource       pages/LoginPage.resource
Resource       pages/TaskCreatePage.resource
Resource       pages/TasksPage.resource


*** Keywords ***
Start Session
    New Browser     browser=${BROWSER}    headless=False
    New Page        ${BASE_URL}

Do login
    [Arguments]        ${user}

    Submit login form           ${user}