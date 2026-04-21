*** Settings ***
Documentation   Workflow test cases
...             by Martuu
Library         SeleniumLibrary

*** Variables ***
${browser}    firefox
${URL}      https://www.saucedemo.com/

***Test Cases***
001- Complete Workflow test
    Open browser        ${URL}      ${browser}
    Input Text      id=user-name    standard_user
    Input Text      id=password     secret_sauce
    Click Button    id=login-button
    Click Element    id=add-to-cart-sauce-labs-backpack
    Click Element    id=add-to-cart-sauce-labs-bike-light
    Click Element    id=add-to-cart-sauce-labs-bolt-t-shirt
    Click Element    css=[data-test='shopping-cart-link']
    Click Button    id=checkout
    Input Text    id=first-name        first nametest
    Input Text    id=last-name        last nametest
    Input Text    id=postal-code        1234
    Click Button    id=continue
    Click Button    id=finish 
    Element Should Contain        css=[data-test='complete-header']      Thank you for your order!
    Element Should Contain        css=[data-test='complete-text']        Your order has been dispatched, and will arrive just as fast as the pony can get there!
    Close browser

001- Test sum of products
    Open browser        ${URL}      ${browser}
    Input Text      id=user-name    standard_user
    Input Text      id=password     secret_sauce
    Click Button    id=login-button
    Click Element    id=add-to-cart-sauce-labs-backpack
    Click Element    id=add-to-cart-sauce-labs-bike-light
    Click Element    id=add-to-cart-sauce-labs-bolt-t-shirt
    ${price_elements}=    Get WebElements    class=inventory_item_price
    ${first_three_prices}=    Evaluate    sum([float(el.text.replace('$','')) for el in $price_elements[:3]])
    Click Element    css=[data-test='shopping-cart-link']
    Click Button    id=checkout
    Input Text    id=first-name        first nametest
    Input Text    id=last-name        last nametest
    Input Text    id=postal-code        1234
    Click Button    id=continue
    ${subtotal_element}=    Get WebElement    class=summary_subtotal_label
    ${subtotal_price}=    Evaluate    float('${subtotal_element.text}'.replace('Item total: $',''))
    Should Be Equal As Numbers    ${subtotal_price}    ${first_three_prices}
    Close browser
