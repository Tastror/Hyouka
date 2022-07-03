COMPILER='.ild/SysY'
TEST_PATH='./test'
passed=0
CE=0
WA=0
for source_file in $(ls $(find $TEST_PATH -name '*.c'))
do
	if [ ${source_file%.*} == $TEST_PATH/sylib ];
	then
		continue
	fi
	$COMPILER ${source_file%.*}.c > ${source_file%.*}.s
	if [ $? == 0 ];
	then
		arm-none-linux-gnueabihf-gcc ${source_file%.*}.s $TEST_PATH/sylib.c -o ${source_file%.*}.tmp -mcpu=cortex-a72 --static
		if [ -f ${source_file%.*}.in ];
		then
			stdout=$(qemu-arm ${source_file%.*}.tmp < ${source_file%.*}.in)
		else
			stdout=$(qemu-arm ${source_file%.*}.tmp)
		fi
		retval=$?
		if [ -n "$stdout" ];
		then
			echo -e "$stdout" > ${source_file%.*}.out
			echo $retval >> ${source_file%.*}.out
		else
			echo $retval > ${source_file%.*}.out
		fi
		result=$(cat ${source_file%.*}.out | tr "\n" " ")
		answer=$(cat ${source_file%.*}.ans | tr "\n" " ")
		cmp -s ${source_file%.*}.out ${source_file%.*}.ans
		if [ $? == 0 ];
		then
			printf "\e[32m%-20s testcase: %-30s (result: %-10s | answer: %-10s).\e[0m\n" "[PASSED]" ${source_file%.*} "$result" "$answer"
			passed=$((passed + 1))
		else
			printf "\e[31m%-20s testcase: %-30s (result: %-10s | answer: %-10s).\e[0m\n" "[WRONG ANSWER]" ${source_file%.*} "$result" "$answer"
			WA=$((WA + 1))
		fi
	else
		printf "\e[33m%-20s testcase: %-30s compilation failed.\e[0m\n" "[COMPILE ERROR]" ${source_file%.*}
		CE=$((CE + 1))
	fi
done
echo -e "\e[32mpassed: $passed/$((passed + WA + CE))          \e[31mWA: $WA/$((passed + WA + CE))          \e[33mCE: $CE/$((passed + WA + CE))\e\e[0m"