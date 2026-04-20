*** Settings ***
Documentation   Performance test cases
...             by Martuu
Library         SeleniumLibrary

*** Variables ***
${browser}    firefox
${URL}      https://www.saucedemo.com/

***Test Cases***
001- Delayed login test
    Open browser        ${URL}      ${browser}
    Input Text      id=user-name    performance_glitch_user
    Input Text      id=password     secret_sauce
    Click Button    id=login-button
    Wait Until Element Is Visible         class=inventory_container        15
    Close browser

002- Compare login time between standard user and performace glitch user
    ${start}    Evaluate        time.time()    time
    Open browser        ${URL}      ${browser}
    Input Text      id=user-name    standard_user
    Input Text      id=password     secret_sauce
    Click Button    id=login-button
    Wait Until Element Is Visible         class=inventory_container
    ${end}    Evaluate        time.time()    time
    ${standard_elapsed_time}=    Evaluate    ${end}-${start}
    Close browser

    ${start}    Evaluate        time.time()    time
    Open browser        ${URL}      ${browser}
    Input Text      id=user-name    performance_glitch_user
    Input Text      id=password     secret_sauce
    Click Button    id=login-button
    Wait Until Element Is Visible         class=inventory_container
    ${end}    Evaluate        time.time()    time
    ${performace_glitch_elapsed_time}=    Evaluate    ${end}-${start}
    Close browser

    ${difference}=    Evaluate    ${performace_glitch_elapsed_time} - ${standard_elapsed_time}
    Should Be True    ${difference} > 2

003- Compare drop down menu display between standard user and performance glitch user 
    ${start}        Evaluate    time.time()    time
    Open browser        ${URL}      ${browser}
    Input Text      id=user-name    standard_user
    Input Text      id=password     secret_sauce
    Click Button    id=login-button
    Select From List By Value       class=product_sort_container        az
    Wait Until Element Is Visible         class=inventory_container
    ${end}        Evaluate    time.time()    time
    ${standard_elapsed_time}=       Evaluate       ${end}-${start}
    Close browser

    ${start}        Evaluate    time.time()    time
    Open browser        ${URL}      ${browser}
    Input Text      id=user-name    performance_glitch_user
    Input Text      id=password     secret_sauce
    Click Button    id=login-button
    Select From List By Value       class=product_sort_container        az
    Wait Until Element Is Visible         class=inventory_container
    ${end}        Evaluate    time.time()    time
    ${performace_glitch_elapsed_time}=       Evaluate       ${end}-${start}
    Close browser

    ${difference}=    Evaluate    ${performace_glitch_elapsed_time} - ${standard_elapsed_time}
    Should Be True    ${difference} > 2

