#! /usr/bin/awk -f

BEGIN {
        givenName = ""
        sn = ""
        mail = ""
        paid = ""
        studentNo = ""
	personalMail = ""
}

/^First / {givenName=$3}
/^Surname: / {sn=$2}
/^Strathclyde / {mail=$4}
/^Have / {paid=$4}
/^Student / {studentNo=$3}
/^Personal / {personalMail=$4}
/^Do / {

	# if (givenName !="" && paid == "No") printf("\033[31m** Not Paid **\033[0m\t")
	#         else if (givenName !="") printf("\t\t")
	#         if(givenName != "" && studentNo != "") printf("%s %s, %s, %s, %s\n",givenName,sn,studentNo,mail,personalMail)
	#         else if(givenName != "") printf("%s %s, %s, %s\n",givenName,sn,mail, personalMail)
	
	printf("%s, %s, %s, %s, %s, ",givenName,sn,studentNo,mail,personalMail)
	if (givenName !="" && paid == "No") printf("Not Paid\n")
	else printf "Paid\n"

	givenName = ""
	sn = ""
	mail = ""
	paid = ""
	studentNo = ""
	personalMail = ""
}
