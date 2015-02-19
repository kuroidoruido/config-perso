#!/bin/sh

# month
COLOR_MONTH='FFFFFF'
SIZE_MONTH=15
# week number
COLOR_WEEK_NUMBER='FFFFFF'
# days of week
COLOR_PAST_DAY='FFFFFF'
COLOR_CURRENT_DATE='000000'
# days of month
COLOR_FUTURE_DAY='FFFFFF'
COLOR_WEEK_END='A0A0A0'
COLOR_WEEK_DAY='FFFFFF'



# init date variables
firstDayOfMonth='01'
currentDay=$(date +%d)
previousDay=$(($currentDay-1))
nextDay=$(($currentDay+1))
lastDayOfMonth=$(date -d "-$currentDay days +1 month" +%d)

# print month line

	monthName=$(date +%B)
	monthName=$(echo $(echo ${monthName:0:1} | tr '[a-z]' '[A-Z]')${monthName:1})
	echo -en "\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0"'${color '${COLOR_MONTH}'}${font bold:size='${SIZE_MONTH}'}'$monthName'${font}${color}'

# print week number of year line
echo ''

	#~ weekNumber=-1
	#~ curWeekNumber=$(date +%W)
	#~ curYearMonth=$(date +%Y%m)
	#~ for d in $(seq -w $firstDayOfMonth $lastDayOfMonth); do
		#~ tmp=$(date -d "${curYearMonth}$d" +%W)
		#~ if [[ $(if [[ ${tmp:0:1} = '0' ]];then echo ${tmp:1};else echo $tmp;fi;) > $weekNumber ]]; then
			#~ weekNumber=$tmp
			#~ if [[ $weekNumber == $curWeekNumber ]];then
				#~ colorS='${color '${COLOR_CURRENT_DATE}'}'
				#~ colorE='${color}'
			#~ else
				#~ colorS=''
				#~ colorE=''
			#~ fi
			#~ echo -ne "\u00A0\u00A0"$colorS$(($weekNumber+1))$colorE
		#~ else
			#~ echo -en "\u00A0\u00A0\u00A0\u00A0";
		#~ fi
	#~ done

# print days of week line
echo ''

	# init days of week list
	initDate=1
	for i in 4 5 6 7 1 2 3; do
		daysWeekName[$i]=$(date -d "1970010$initDate" +%a)
		daysWeekName[$i]=${daysWeekName[$i]:0:3}
		initDate=$(($initDate+1))
	done

	cursorDayOfWeek=$(date -d $(date +%Y%m01) +%u)

	function nextDay () {
		tmp=$(($1+1))
		if [[ $tmp > 7 ]]; then
			echo 1
		else
			echo $tmp
		fi
	}

	function colorWeekEnd () {
		# $1 => day of week
		# $2 => 1 = start ; 2 = end
		if [[ $1 == 6 && $2 == 1 ]]; then
				echo -n '${color '${COLOR_WEEK_END}'}'
		elif [[ $1 == 7 && $2 == 2 ]]; then
				echo -n '${color '${COLOR_WEEK_DAY}'}'
		fi
	}
	
	echo -n '${color '${COLOR_WEEK_DAY}'}'
	
	for d in $(seq -w $firstDayOfMonth $previousDay); do
		echo -n $(colorWeekEnd $cursorDayOfWeek 1)${daysWeekName[$cursorDayOfWeek]}$(colorWeekEnd $cursorDayOfWeek 2)' '
		cursorDayOfWeek=$(nextDay $cursorDayOfWeek)
	done;

	echo -n '${color '$COLOR_CURRENT_DATE'}'${daysWeekName[$cursorDayOfWeek]}'${color}'$(colorWeekEnd $cursorDayOfWeek 1)' '
	cursorDayOfWeek=$(nextDay $cursorDayOfWeek)

	for d in $(seq -w $nextDay $lastDayOfMonth); do
		echo -n $(colorWeekEnd $cursorDayOfWeek 1)${daysWeekName[$cursorDayOfWeek]}$(colorWeekEnd $cursorDayOfWeek 2)' '
		cursorDayOfWeek=$(nextDay $cursorDayOfWeek)
	done;
	
	echo -n '${color}'
	
# print days of month line
echo ''

	echo -n '${color '${COLOR_PAST_DAY}'}'
	
	# display days line
	for d in $(seq -w $firstDayOfMonth $previousDay); do
		echo -ne '\u00A0'$d'\u00A0'
	done;

	echo -ne '\u00A0${color '${COLOR_CURRENT_DATE}'}'$currentDay'${color '${COLOR_FUTURE_DAY}'}\u00A0'

	for d in $(seq -w $nextDay $lastDayOfMonth); do
		echo -ne '\u00A0'$d'\u00A0'
	done;
	
	echo -n '${color}';
