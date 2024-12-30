*** Setting ***
Library  RequestsLibrary
Library  Collections

*** Variables ***
${base_url}  https://reqres.in/

*** Test Case ***
Update_user
    create session  Update_user  ${base_url}
    ${body}=  create dictionary  name=Ali  job=Engineer
    ${header}=  create dictionary  Content-Type=application/json

    ${response}=  put request  Update_user  /api/users/2 data=${body}  headers=${header}
    log to console  ${response.status_code}
    log to console  ${response.content}