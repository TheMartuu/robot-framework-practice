*** Settings ***
Documentation   Test Cases in Firefox
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
    Wait Until Element Is Visible       class=inventory_container
    Close browser

002- Login with wrong credentials
    Open browser        ${URL}      ${browser}
    Input Text      id=user-name    not_valid
    Input Text      id=password     not_valid
    Click Button    id=login-button
    Wait Until Element Is Visible       class=error-button
    Close browser