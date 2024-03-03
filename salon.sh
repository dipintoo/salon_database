#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\nWelcome to Dipintoo Salon! What service would you like to book?\n"

main_menu() {
  display_services_menu

  read -p "Input number to book: " SERVICE_ID_SELECTED

  if [[ ! $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]; then
    main_menu "I could not find that service. What would you like today?"
  else
    SERVICE_NAME_SELECTED=$(get_service_name $SERVICE_ID_SELECTED)

    if [[ -z $SERVICE_NAME_SELECTED ]]; then
      main_menu "Sorry, that is not a valid service. Please choose again."
    else
      get_customer_details
      book_appointment
      display_confirmation
    fi
  fi
}

display_services_menu() {
  $PSQL "SELECT service_id, name FROM services ORDER BY service_id" | while read SERVICE_ID _ SERVICE_NAME; do
    echo -e "$SERVICE_ID) $SERVICE_NAME"
  done
}

get_service_name() {
  $PSQL "SELECT name FROM services WHERE service_id = $1"
}

get_customer_details() {
  read -p "What is your phone number? " CUSTOMER_PHONE
  CUSTOMER_NAME=$(get_customer_name $CUSTOMER_PHONE)

  if [[ -z $CUSTOMER_NAME ]]; then
    read -p "We could not find a record with that phone number. What is your name? " CUSTOMER_NAME
    $PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE','$CUSTOMER_NAME')"
  fi
}

get_customer_name() {
  $PSQL "SELECT name FROM customers WHERE phone='$1'"
}

book_appointment() {
  read -p "What time would you like to book the $SERVICE_NAME_SELECTED service, $CUSTOMER_NAME? " SERVICE_TIME
  CUSTOMER_ID=$(get_customer_id $CUSTOMER_PHONE)
  $PSQL "INSERT INTO appointments(service_id, customer_id, time) VALUES ($SERVICE_ID_SELECTED,$CUSTOMER_ID,'$SERVICE_TIME')"
}

get_customer_id() {
  $PSQL "SELECT customer_id FROM customers WHERE phone='$1'"
}

display_confirmation() {
  echo -e "\nI have put you down for a $SERVICE_NAME_SELECTED at $SERVICE_TIME, $CUSTOMER_NAME."
}

# Menjalankan fungsi menu utama
main_menu
