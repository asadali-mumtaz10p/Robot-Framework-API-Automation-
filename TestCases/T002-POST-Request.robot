*** Setting ***
Library  RequestsLibrary
Library  Collections

*** Variable ***
${Base_Url}  https://reqres.in/

*** Test Case ***
Create_New_User
    create session  Create_New_User  ${Base_Url}
    ${body}=  create dictionary  name=Asad.ALi  job=Test Engineer
    ${header}=  create dictionary  Content-Type=application/json

    ${response}=  post request  Create_New_User  /api/users  data=${body}  headers=${header}
    #${response}=  POST On Session    Create_New_User  /api/users  data={"name":"Asad" , "job":"Test Engineer"}  headers=${header}
    log to console  ${response.status_code}
    log to console  ${response.content}
