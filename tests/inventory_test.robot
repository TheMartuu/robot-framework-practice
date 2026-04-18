*** Settings ***
Documentation   Inventory test cases
...             by Martuu
Library         SeleniumLibrary

*** Variables ***
${browser}    firefox
${URL}      https://www.saucedemo.com/
${inventory_URL}        https://www.saucedemo.com/inventory.html

***Test Cases***
001- Check item count in inventory
    Open browser        ${URL}      ${browser}
    Input Text      id=user-name    standard_user
    Input Text      id=password     secret_sauce
    Click Button    id=login-button
    ${count}=       Get Element Count       class=inventory_item
    Should Be Equal As Integers     ${count}       6
    Close browser

002- Sort items by A-Z and Z-A
    Open browser        ${URL}      ${browser}
    Input Text      id=user-name    standard_user
    Input Text      id=password     secret_sauce
    Click Button    id=login-button
    Select From List By Value       class=product_sort_container        az
    ${item_names_az}=       Get WebElements     class=inventory_item_name
    Select From List By Value       class=product_sort_container        za
    ${item_names_za}=       Get WebElements     class=inventory_item_name
    ${first_az}=        Get Text        ${item_names_az}[0]
    ${last_za}=         Get Text        ${item_names_za}[-1]
    Should Be Equal     ${first_az}     ${last_za}
    Close browser

003-Check cart badge when adding an item
    Open browser        ${URL}      ${browser}
    Input Text      id=user-name    standard_user
    Input Text      id=password     secret_sauce
    Click Button    id=login-button
    Click Button    id=add-to-cart-sauce-labs-backpack
    Element Should Contain      class=shopping_cart_badge        1
    Close browser

004- Check cart badge when removing all items
    Open browser        ${URL}      ${browser}
    Input Text      id=user-name    standard_user
    Input Text      id=password     secret_sauce
    Click Button    id=login-button
    Click Button    id=add-to-cart-sauce-labs-backpack
    Click Button      id=remove-sauce-labs-backpack
    Page Should Not Contain Element      class=shopping_cart_badge
    Close browser

005- Check all items contain name, description and price
    Open browser        ${URL}      ${browser}
    Input Text      id=user-name    standard_user
    Input Text      id=password     secret_sauce
    Click Button    id=login-button
    ${names}        Get Element Count       class=inventory_item_name
    ${descriptions}     Get Element Count       class=inventory_item_desc
    ${prices}       Get Element Count       class=inventory_item_price
    Should Be Equal As Integers        ${names}        6
    Should Be Equal As Integers        ${descriptions}        6
    Should Be Equal As Integers        ${prices}        6
    Close browser

006- Check that the cheapest item is displayed when ordering from lower to higher
    Open browser        ${URL}      ${browser}
    Input Text      id=user-name    standard_user
    Input Text      id=password     secret_sauce
    Click Button    id=login-button
    Select From List By Value       class=product_sort_container        lohi
    ${prices}       Get WebElements      class=inventory_item_price
    ${price_texts}=    Evaluate    [float(el.text.replace('$','')) for el in $prices]
    ${min_price}=    Evaluate    min($price_texts)
    ${first_price_text}=    Get Text    ${prices}[0]
    ${first_price}=    Evaluate    float('${first_price_text}'.replace('$',''))
    Should Be Equal As Numbers      ${first_price}      ${min_price}
    Close browser

007- Check that inventory is not visible when not logged in
    Open browser    ${inventory_URL}        ${browser}
    Element Should Contain      css=[data-test='error']      Epic sadface: You can only access '/inventory.html' when you are logged in.
    Close browser



