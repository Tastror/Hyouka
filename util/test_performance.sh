COMPILER='../cmake-build-debug/compiler'
TEST_PATH='../testcase/performance'
LIB_PATH='../runtime_lib'
LOG_FILE='./log_performance.log'

AC=0
CE=0
WA=0

echo > $LOG_FILE

for source_file in $(ls $(find $TEST_PATH -name '*.sy'))
do
	if [ ${source_file%.*} == $TEST_PATH/sylib ];
	then
		continue
	fi
	$COMPILER ${source_file%.*}.sy -S -o ${source_file%.*}.s -O1
	if [ $? == 0 ];
	then
		arm-linux-gnueabihf-gcc -static $LIB_PATH/libsysy.a ${source_file%.*}.s -o ${source_file%.*}.tmp
		if [ -f ${source_file%.*}.in ];
		then
			stdout=$(qemu-arm ${source_file%.*}.tmp < ${source_file%.*}.in)
		else
			stdout=$(qemu-arm ${source_file%.*}.tmp)
		fi
		retval=$?
		if [ -n "$stdout" ];
		then
			echo -e "$stdout" > ${source_file%.*}.ans
			echo $retval >> ${source_file%.*}.ans
		else
			echo $retval > ${source_file%.*}.ans
		fi
		result=$(cat ${source_file%.*}.ans | tr "\n" " ")
		answer=$(cat ${source_file%.*}.out | tr "\n" " ")
		cmp -s ${source_file%.*}.out ${source_file%.*}.ans
		if [ $? == 0 ];
		then
			printf "\e[32m%-20s testcase: %-30s (result: %-10s | answer: %-10s).\e[0m\n" "[Accepted]" ${source_file%.*} "$result" "$answer"
			AC=$((AC + 1))
		else
			printf "\e[31m%-20s testcase: %-30s (result: %-10s | answer: %-10s).\e[0m\n" "[Wrong Answer]" ${source_file%.*} "$result" "$answer"
			echo -e "WA:   \c" >> $LOG_FILE
      echo ${source_file%.*} >> $LOG_FILE
			WA=$((WA + 1))
		fi
	else
		printf "\e[33m%-20s testcase: %-30s compilation failed.\e[0m\n" "[Compile Error]" ${source_file%.*}
		echo -e "CE:   \c" >> $LOG_FILE
    echo ${source_file%.*} >> $LOG_FILE
		CE=$((CE + 1))
	fi
done
echo -e "\e[32mAC: $AC/$((AC + WA + CE))          \e[31mWA: $WA/$((AC + WA + CE))          \e[33mCE: $CE/$((AC + WA + CE))\e\e[0m"