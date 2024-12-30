*** Setting ***
Library  RequestsLibrary
Library  Collections
Library  RequestsLibrary
Library  Collections

*** Variables ***
${base_url}  https://reqres.in/

*** Test Case ***
Delete_user
    create session  Delete_user  ${base_url}
    ${response}=  delete request   Delete_user  api/users/2
    log to console  ${response.status_code}
    log to console  ${response.content}

    #VALIDATION
    ${status_code}=  convert to string  ${response.status_code}
    should be equal  ${status_code}  204