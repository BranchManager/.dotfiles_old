full_quote_state=$(eww state | grep redd | grep true)
echo $full_quote_state

#Above we check if the variable is set to true by checking for an empty variable and if it is true or the variable is empty
#update the eww widget to false
if [ -z "$full_quote_state" ]
then
	eww update redd="true"
	#eww update redd="true"
else
	eww update redd="false"
fi

full_quote_state=$(eww state | grep redd )
echo $full_quote_state