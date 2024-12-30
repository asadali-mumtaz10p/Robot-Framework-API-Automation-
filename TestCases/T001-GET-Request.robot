*** Settings ***

Library  RequestsLibrary
Library  Collections
Library  RequestsLibrary
Library  Collections
*** Variables ***
${Base_Url}    https://reqres.in/

*** Test Cases ***
Get_Users_Details
    create session  Get_Users_Details  ${Base_Url}
    ${response}=  GET On Session    Get_Users_Details  api/users
    log to console  ${response.status_code}
    #log to console  ${response.content}
    #log to console  ${response.headers}

    #VALIDATIONS
    #To validate Status code
    ${status_code}=  convert to string    ${response.status_code}
    should be equal    ${status_code}    200

    #To validate Response body contains user i.e George
    ${body}=  convert to string  ${response.content}
    should contain  ${body}  George

    #To validate Headers contains Content-Type as application/json
    ${contentTypeValue}=    get from dictionary    ${response.headers}    Content-Type
    should be equal    ${contentTypeValue}    application/json; charset=utf-8

    ${connectionValue}=    get from dictionary    ${response.headers}    Connection
    should be equal    ${connectionValue}    keep-alive

