#! /bin/bash
PSQL="psql --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~~My Salon~~~~"

MAIN_MENU ()
{
if [[ $1 ]]
then
  echo -e "\n$1"
fi

echo -e "\nWhich service would you like to schedule?\n"

SERVICE_LIST=$($PSQL "SELECT service_id, name FROM services ORDER BY service_id")
echo "$SERVICE_LIST" | while read SERVICE_ID BAR NAME 
do
  echo "$SERVICE_ID) $NAME"
done
read SERVICE_ID_SELECTED
APPOINTMENTS $SERVICE_ID_SELECTED
}

APPOINTMENTS ()
{
if [[ ! $SERVICE_ID_SELECTED =~ ^[1-4]$ ]]
then
  MAIN_MENU "Please choose a valid number selection."
else
  echo "Please enter your phone number with dashes."
  read CUSTOMER_PHONE
  EXISTING_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
  
  if [[ -z $EXISTING_ID ]]
  then
    echo "Your phone number indicates you're a new customer.  What is your name?"
    read CUSTOMER_NAME
    NEW_CUSTOMER=$($PSQL "INSERT INTO customers (name, phone) VALUES ('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")
  fi
    CUST_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
    CUST_NAME=$($PSQL "SELECT name FROM customers WHERE PHONE='$CUSTOMER_PHONE'")
    echo "Please enter the time you want to schedule for your appointment in hh:mm."
    read SERVICE_TIME
    NEW_APPT=$($PSQL "INSERT INTO appointments (customer_id, service_id, time) VALUES ($CUST_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")
    SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED")
    
    echo "I have put you down for a$SERVICE_NAME at $SERVICE_TIME,$CUST_NAME."
fi
}
MAIN_MENU