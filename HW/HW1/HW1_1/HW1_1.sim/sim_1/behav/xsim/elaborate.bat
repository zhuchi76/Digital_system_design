@echo off
REM ****************************************************************************
REM Vivado (TM) v2020.3 (64-bit)
REM
REM Filename    : elaborate.bat
REM Simulator   : Xilinx Vivado Simulator
REM Description : Script for elaborating the compiled design
REM
REM Generated by Vivado on Sun Oct 16 20:56:17 +0800 2022
REM SW Build 3173277 on Wed Apr  7 05:07:49 MDT 2021
REM
REM IP Build 3174024 on Wed Apr  7 23:42:35 MDT 2021
REM
REM usage: elaborate.bat
REM
REM ****************************************************************************
REM elaborate design
echo "xelab -wto e27e2e72b1e741b688a46e07eb2e3707 --incr --debug typical --relax --mt 2 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L unisims_ver -L secureip --snapshot t_HW1_comb_behav xil_defaultlib.t_HW1_comb xil_defaultlib.glbl -log elaborate.log"
call xelab  -wto e27e2e72b1e741b688a46e07eb2e3707 --incr --debug typical --relax --mt 2 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L unisims_ver -L secureip --snapshot t_HW1_comb_behav xil_defaultlib.t_HW1_comb xil_defaultlib.glbl -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
