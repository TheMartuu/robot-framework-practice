*** Settings ***
Documentation   Test Cases in Firefox
...             by Martuu
Library         SeleniumLibrary

*** Variables ***
${browser}    firefox
${URL}      https://www.saucedemo.com/

***Test Cases***
001- Login with locked user
    Open browser        ${URL}      ${browser}
    Input Text      id=user-name    locked_out_user
    Input Text      id=password     secret_sauce
    Click Button    id=login-button
    Element Should Contain       css=[data-test="error"]     Epic sadface: Sorry, this user has been locked out.
    Close browser