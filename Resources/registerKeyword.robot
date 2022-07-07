*** Settings ***
Documentation                                                           Keywords for noCommerce register
Library                                                                 SeleniumLibrary
Resource                                                                registerVariable.robot
Library                                                                 FakerLibrary



*** Keywords ***
Homepage Login
                      Open Browser                              ${URL}                     ${BROWSER}
                      Maximize browser window
                      wait until element is visible             ${HOMEPAGE_LOGIN}
                      click element                             ${HOMEPAGE_LOGIN}
                      #Close browser

Navigate to homepage and click on register
                      #Open Browser                              ${URL}                     ${BROWSER}
                      wait until element is visible             ${REGISTER_BUTTON}
                      Maximize browser window
                      Click element                             ${REGISTER_BUTTON}

Select user gender
                      wait until element is visible             ${REGISTER_GENDER_BUTTON}
                      click element                             ${REGISTER_GENDER_BUTTON}

Enter new user firstname
                     ${firstname}=      FakerLibrary.firstname
                     log   ${firstname}
                     Set Test variable    ${firstname}
                     wait until element is visible              ${REGISTER_FIRSTNAME}
                     Input Text                                 ${REGISTER_FIRSTNAME}              ${firstname}

Enter new user lastname
                     ${lastname}=      FakerLibrary.lastname
                     log   ${lastname}
                     Set Test variable    ${lastname}
                     wait until element is visible             ${REGISTER_LASTNAME}
                     Input Text                                ${REGISTER_LASTNAME}                ${lastname}

Select new user birth in day, month and year
                    wait until element is visible              ${REGISTER_DOB_DAY}
                    select from list by value                  ${REGISTER_DOB_DAY}                 11
                    wait until element is visible              ${REGISTER_DOB_MONTH}
                    select from list by index                  ${REGISTER_DOB_MONTH}               5
                    wait until element is visible              ${REGISTER_DOB_YEAR}
                    select from list by value                  ${REGISTER_DOB_YEAR}                1989

Enter new user email
                    ${email}=      FakerLibrary.email
                    log   ${email}
                    Set Test variable    ${email}
                    wait until element is visible              ${REGISTER_EMAILFIELD}
                    Input Text                                 ${REGISTER_EMAILFIELD}               ${email}

Enter new user password, confirm password and click register button
                    wait until element is visible              ${REGISTER_PASSWORDFIELD}
                    Input Text                                 ${REGISTER_PASSWORDFIELD}            testing
                    wait until element is visible              ${REGISTER_CONFIRM_PASSWORDFIELD}
                    Input Text                                 ${REGISTER_CONFIRM_PASSWORDFIELD}    testing
                    wait until element is visible              ${REGISTER_REGISTER_BUTTON}
                    Click element                              ${REGISTER_REGISTER_BUTTON}

Assert that page contains logout and close all browsers
                    wait until page contains                  Your registration completed
                    Page should contain                       Your registration completed
                    Sleep 5
                    wait until element is visible             ${REGISTER_CONTINUE_BUTTON}
                    click element                             ${REGISTER_CONTINUE_BUTTON}

Enter customer address
                    wait until element is visible             ${MY_ACCOUNT_BUTTON}
                    click element                             ${MY_ACCOUNT_BUTTON}
                    wait until element is visible             ${ADDRESS_BUTTON}
                    click element                             ${ADDRESS_BUTTON}
                    wait until element is visible             ${ADDRESS_ADDNEW_BUTTON}
                    click element                             ${ADDRESS_ADDNEW_BUTTON}

Enter customer address firstname
                    ${firstname}=      FakerLibrary.firstname
                    log   ${firstname}
                    Set Test variable    ${firstname}
                    wait until element is visible              ${ADDRESS_FIRSTNAME}
                    Input Text                                 ${ADDRESS_FIRSTNAME}              ${firstname}

Enter customer address lastname
                    ${lastname}=      FakerLibrary.lastname
                    log   ${lastname}
                    Set Test variable    ${lastname}
                    wait until element is visible              ${ADDRESS_LASTNAME}
                    Input Text                                 ${ADDRESS_LASTNAME}              ${lastname}

Enter customer address email
                    ${email}=      FakerLibrary.email
                    log   ${email}
                    Set Test variable    ${email}
                    wait until element is visible              ${ADDRESS_EMAIL}
                    Input Text                                 ${ADDRESS_EMAIL}                 ${email}

Select customer address country and enter city
                    wait until element is visible              ${ADDRESS_COUNTRY}
                    select from list by label                  ${ADDRESS_COUNTRY}               Finland
                    wait until element is visible              ${ADDRESS_CITY}
                    input text                                 ${ADDRESS_CITY}                  Helsinki

Enter customer address and postal code
                    [Arguments]    ${address1_address}
                    wait until element is visible              ${ADDRESS_ADDRESS}
                    input text                                 ${ADDRESS_ADDRESS}               ${address1_address}
                    wait until element is visible              ${ADDRESS_POSTAL_CODE}
                    input text                                 ${ADDRESS_POSTAL_CODE}           00000

Enter customer phone number and click on save button
                    wait until element is visible              ${ADDRESS_PHONE_NUMBER}
                    input text                                 ${ADDRESS_PHONE_NUMBER}          +35846000055
                    wait until element is visible              ${ADDRESS_SAVE_BUTTON}
                    click element                              ${ADDRESS_SAVE_BUTTON}

Add item or product to wishlist
                    wait until element is visible              ${ELEMENT_COMPUTER_BUTTON}
                    click element                              ${ELEMENT_COMPUTER_BUTTON}
                    wait until element is visible              ${COMPUTER_DESKTOPS_BUTTON}
                    click element                              ${COMPUTER_DESKTOPS_BUTTON}
                    wait until element is visible              ${PRODUCT_TEXT_LINK}
                    click element                              ${PRODUCT_TEXT_LINK}
                    wait until element is visible              ${COMPUTER_PROCESSOR_FIELD}
                    select from list by index                  ${COMPUTER_PROCESSOR_FIELD}           2
                    wait until element is visible              ${COMPUTER_RAM_FIELD}
                    select from list by index                  ${COMPUTER_RAM_FIELD}                 3
                    wait until element is visible              ${COMPUTER_HDD_BUTTON}
                    click element                              ${COMPUTER_HDD_BUTTON}
                    wait until element is visible              ${COMPUTER_OS_BUTTON}
                    click element                              ${COMPUTER_OS_BUTTON}
                    wait until element is visible              ${COMPUTER_SOFTWARE_BUTTON}
                    select checkbox                            ${COMPUTER_SOFTWARE_BUTTON}
                    wait until element is visible              ${ADD_TO_WISHLIST_BUTTON}
                    click element                              ${ADD_TO_WISHLIST_BUTTON}

Assert item is added to wishlist
                    wait until element is visible              ${ADDED_TO_WISHLIST_SUCCESS MESSAGE}
                    page should contain                        The product has been added to your wishlist
                    wait until element is visible              ${CLOSE_SUCCESS_MESSAGE}
                    click element                              ${CLOSE_SUCCESS_MESSAGE}

Delete item from the wishlist
                    wait until element is visible              ${WISHLIST_BUTTON}
                    click element                              ${WISHLIST_BUTTON}
                    wait until element is visible              ${DELETE_ITEM_IN_WISHLIST}
                    click element                              ${DELETE_ITEM_IN_WISHLIST}
                    wait until element is visible              ${DELETE_ITEM_SUCCESS_MESSAGE}
                    page should contain                        The wishlist is empty!

Adding camera and photo to shopping cart
                    wait until element is visible              ${ELECTRONICS_ELEMENT_BUTTON}
                    mouse over                                 ${ELECTRONICS_ELEMENT_BUTTON}
                    click element                              ${CAMERA & PHOTO}
                    wait until element is visible              ${NIKON_D500_DSLR}
                    click element                              ${NIKON_D500_DSLR}
                    wait until element is visible              ${ADD_TO_CART_NIKON_D500}
                    click element                              ${ADD_TO_CART_NIKON_D500}
                    wait until element is visible              ${CLOSE_SUCCESS_MESSAGE}
                    click element                              ${CLOSE_SUCCESS_MESSAGE}

Adding cell phones to shopping cart
                    wait until element is visible              ${ELECTRONICS_ELEMENT_BUTTON}
                    mouse over                                 ${ELECTRONICS_ELEMENT_BUTTON}
                    click element                              ${CELL_PHONES}
                    wait until element is visible              ${HTC_ONE_M8_ANDROID}
                    click element                              ${HTC_ONE_M8_ANDROID}
                    wait until element is visible              ${CLOSE_SUCCESS_MESSAGE}
                    click element                              ${CLOSE_SUCCESS_MESSAGE}

View items in shopping cart
                    wait until element is visible              ${SHOPPING_CART}
                    mouse over                                 ${SHOPPING_CART}
                    wait until element is visible              ${SHOPPING_GO_TO_CART}
                    click element                              ${SHOPPING_GO_TO_CART}
                    wait until element is visible              ${GIFT_RAPPING}
                    select from list by index                  ${GIFT_RAPPING}                 1
                    wait until element is visible              ${TERM_OF_SERVICE_BUTTON}
                    click element                              ${TERM_OF_SERVICE_BUTTON}

Checkout as a guest
                    wait until element is visible              ${CHECKOUT_BUTTON}
                    click element                              ${CHECKOUT_BUTTON}
                    wait until element is visible              ${CHECKOUT_AS_GUEST_BUTTON}
                    click element                              ${CHECKOUT_AS_GUEST_BUTTON}
                    wait until element is visible              ${SHIP_TO_SAME_ADDRESS}
                    unselect checkbox                          ${SHIP_TO_SAME_ADDRESS}

Enter customer billing address firstname
                    ${firstname}=      FakerLibrary.firstname
                    log   ${firstname}
                    Set Test variable    ${firstname}
                    wait until element is visible              ${BILLING_ADDRESS_FIRSTNAME}
                    Input Text                                 ${BILLING_ADDRESS_FIRSTNAME}               ${firstname}

Enter customer billing address lastname
                    ${lastname}=      FakerLibrary.lastname
                    log   ${lastname}
                    Set Test variable    ${lastname}
                    wait until element is visible              ${BILLING_ADDRESS_LASTNAME}
                    Input Text                                 ${BILLING_ADDRESS_LASTNAME}               ${lastname}

Enter customer billing address email
                    ${email}=      FakerLibrary.email
                    log   ${email}
                    Set Test variable    ${email}
                    wait until element is visible             ${BILLING_ADDRESS_EMAIL}

                    Input Text                                ${BILLING_ADDRESS_EMAIL}                 ${email}
Select customer billing address country and enter city
                    wait until element is visible             ${BILLING_ADDRESS_COUNTY}
                    select from list by label                 ${BILLING_ADDRESS_COUNTY}                 Finland
                    wait until element is visible             ${BILLING_ADDRESS_CITY}
                    input text                                ${BILLING_ADDRESS_CITY}                   Helsinki

Enter customer billing address and postal code
                    [Arguments]    ${address1_address}
                    wait until element is visible             ${BILLING_ADDRESS_ADDRESS}
                    input text                                ${BILLING_ADDRESS_ADDRESS}               ${address1_address}
                    wait until element is visible             ${BILLING_ADDRESS_POSTALCODE}
                    input text                                ${BILLING_ADDRESS_POSTALCODE}            00000

Enter customer billing phone number and click on continue button
                    wait until element is visible             ${BILLING_ADDRESS_PHONENUMBER}
                    input text                                ${BILLING_ADDRESS_PHONENUMBER}           +35846000055
                    wait until element is visible             ${BILLING_ADDRESS_CONTINUE_BUTTON}
                    click element                             ${BILLING_ADDRESS_CONTINUE_BUTTON}
                    wait until element is visible             ${BILLING_ADDRESS_CONTINUE_BUTTON2}
                    click element                             ${BILLING_ADDRESS_CONTINUE_BUTTON2}

Enter customer shipping method
                    wait until element is visible             ${SHIPPING_METHOD_BUTTON}
                    click element                             ${SHIPPING_METHOD_BUTTON}
                    wait until element is visible             ${SHIPPING_METHOD_CONTINUE_BUTTON}
                    click element                             ${SHIPPING_METHOD_CONTINUE_BUTTON}

Enter customer payment method
                    wait until element is visible             ${PAYMENT_METHOD_BUTTON}
                    click element                             ${PAYMENT_METHOD_BUTTON}
                    wait until element is visible             ${PAYMENT_METHOD_CONTINUE}
                    click element                             ${PAYMENT_METHOD_CONTINUE}

Enter credit details and confirm payment
                    wait until element is visible             ${CREDIT_CARD_TYPE}
                    select from list by index                 ${CREDIT_CARD_TYPE}                   1
                    wait until element is visible             ${CREDIT_CARD_HOLDER_NAME}
                    input text                                ${CREDIT_CARD_HOLDER_NAME}            Jones Jay
                    wait until element is visible             ${CREDIT_CARD_NUMBER}
                    input text                                ${CREDIT_CARD_NUMBER}                 5356870000367131
                    wait until element is visible             ${CREDIT_CARD_EMONTH}
                    select from list by index                 ${CREDIT_CARD_EMONTH}                 5
                    wait until element is visible             ${CREDIT_CARD_EYEAR}
                    select from list by value                 ${CREDIT_CARD_EYEAR}                  2026
                    wait until element is visible             ${CREDIT_CARD_CODE}
                    input text                                ${CREDIT_CARD_CODE}                   033
                    wait until element is visible             ${PAYMENT_METHOD_CONTINUE2}
                    click element                             ${PAYMENT_METHOD_CONTINUE2}
                    wait until element is visible             ${PAYMENT_CONFIRMATION_BUTTON}
                    click element                             ${PAYMENT_CONFIRMATION_BUTTON}

Assert order has been successfully placed and close all browsers
                    wait until element is visible             ${ORDER_SUCCESS_MESSAGE}
                    page should contain                       Your order has been successfully processed!
                    close browser


Homepage Login main
                      #Open Browser                              ${URL}                     ${BROWSER}
                      #Maximize browser window

Navigate to homepage and click on register main
                      Homepage Login
                      wait until element is visible             ${REGISTER_BUTTON}
                      Click element                             ${REGISTER_BUTTON}

Select user gender main
                      wait until element is visible             ${REGISTER_GENDER_BUTTON}
                      click element                             ${REGISTER_GENDER_BUTTON}

Enter new user firstname main
                     wait until element is visible              ${REGISTER_FIRSTNAME}
                     Input Text                                 ${REGISTER_FIRSTNAME}               Jones

Enter new user lastname main
                     wait until element is visible              ${REGISTER_LASTNAME}
                     Input Text                                 ${REGISTER_LASTNAME}                 Uche

Select new user birth in day, month and year main
                    wait until element is visible               ${REGISTER_DOB_DAY}
                    select from list by value                   ${REGISTER_DOB_DAY}                 11
                    wait until element is visible               ${REGISTER_DOB_MONTH}
                    select from list by index                   ${REGISTER_DOB_MONTH}               5
                    wait until element is visible               ${REGISTER_DOB_YEAR}
                    select from list by value                   ${REGISTER_DOB_YEAR}                1989

Enter new user email main
                    wait until element is visible               ${REGISTER_EMAILFIELD}
                    Input Text                                  ${REGISTER_EMAILFIELD}               iwalewa+22@gmail.com

Enter new user password, confirm password and click register button main
                    wait until element is visible               ${REGISTER_PASSWORDFIELD}
                    Input Text                                  ${REGISTER_PASSWORDFIELD}            testing
                    wait until element is visible               ${REGISTER_CONFIRM_PASSWORDFIELD}
                    Input Text                                  ${REGISTER_CONFIRM_PASSWORDFIELD}    testing
                    wait until element is visible               ${REGISTER_REGISTER_BUTTON}
                    Click element                               ${REGISTER_REGISTER_BUTTON}

Assert that page contains logout and close all browsers main
                    wait until page contains                    Your registration completed
                    Page should contain                         Your registration completed
                    capture page screenshot

Login with invalid login credentials should return correct message
                     [Arguments]          ${username}            ${password}                       ${errormessage}
                     open browser           ${URL}       ${BROWSER}
                     maximize browser window
                     click element                  ${HOMEPAGE_LOGIN}
                     input text                     ${HOMEPAGE_LOGIN_EMAILFIELD}                   ${username}
                     input text                     ${HOMEPAGE_LOGIN_PASSWORDFIELD}                ${password}
                     click element                  ${HOMEPAGE_LOGIN_BUTTON}
                     page should contain            ${errormessage}





Wait and input text
                    [Documentation]   wait for element to be visible and enabled before interaction
                    [Arguments]     ${selector}          ${text}            ${timeout}=10s
                    wait until element is enabled       ${selector}
                    input text          ${selector}             ${text}

Wait and click element
                    [Documentation]   wait for element to be visible and enabled before interaction
                    [Arguments]     ${selector}             ${timeout}=10s
                    wait until element is enabled           ${selector}
                    input text          ${selector}









