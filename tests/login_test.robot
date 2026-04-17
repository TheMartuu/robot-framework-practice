*** Settings ***
Documentation   Log in test cases
...             by Martuu
Library         SeleniumLibrary

*** Variables ***
${browser}    firefox
${URL}      https://www.saucedemo.com/

***Test Cases***
001- Correct login test
    Open browser        ${URL}      ${browser}
    Input Text      id=user-name    standard_user
    Input Text      id=password     secret_sauce
    Click Button    id=login-button
    Page Should Contain Element       class=inventory_container
    Close browser

002- Login with wrong credentials
    Open browser        ${URL}      ${browser}
    Input Text      id=user-name    not_valid
    Input Text      id=password     not_valid
    Click Button    id=login-button
    Wait Until Element Is Visible       class=error-button
    Close browser

003- Login with empty credentials
    Open browser        ${URL}      ${browser}
    Input Text      id=user-name    ${EMPTY}
    Click Button    id=login-button
    Wait Until Element Is Visible       css=[data-test='error']
    Element Should Contain      css=[data-test='error']      Epic sadface: Username is required
    Input Text      id=user-name    standard_user
    Input Text      id=password     ${EMPTY}
    Click Button    id=login-button
    Wait Until Element Is Visible       css=[data-test='error']
    Element Should Contain      css=[data-test='error']      Epic sadface: Password is required
    Close browser

004- Login with locked user
    Open browser        ${URL}      ${browser}
    Input Text      id=user-name    locked_out_user
    Input Text      id=password     secret_sauce
    Click Button    id=login-button
    Element Should Contain       css=[data-test="error"]     Epic sadface: Sorry, this user has been locked out.
    Close browser

005- Logout test
    Open browser        ${URL}      ${browser}
    Input Text      id=user-name    standard_user
    Input Text      id=password     secret_sauce
    Click Button    id=login-button
    Wait Until Element Is Visible       class=inventory_container
    Click Button    id=react-burger-menu-btn
    Wait Until Element Is Visible    id=logout_sidebar_link
    Click Element    id=logout_sidebar_link
    Page Should Contain Element    id=login-button
    Close browser