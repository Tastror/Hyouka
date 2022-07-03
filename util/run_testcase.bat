cd .\testcase\functional
for %%i in ("*.sy") do (
echo %%i
..\..\cmake-build-debug\compiler.exe "%%i" -S -o "../functional_out/%%~ni.s" -O2
)
pause