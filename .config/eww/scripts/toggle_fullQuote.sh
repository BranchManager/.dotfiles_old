full_quote_state=$(eww state | grep $1 | grep false)
echo $full_quote_state

#Above we check if the variable is set to false by checking for an empty variable and if it is false or the variable is empty
#update the eww widget to true
if [ -z "$full_quote_state" ]
then
	eww update $1="false"
	eww update $1="false"
else
	eww update $1="true"
fi

#full_quote_state=$(eww state | grep redd )
#echo $full_quote_state