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