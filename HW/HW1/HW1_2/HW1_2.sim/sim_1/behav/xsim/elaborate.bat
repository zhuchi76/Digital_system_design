@echo off
REM ****************************************************************************
REM Vivado (TM) v2020.3 (64-bit)
REM
REM Filename    : elaborate.bat
REM Simulator   : Xilinx Vivado Simulator
REM Description : Script for elaborating the compiled design
REM
REM Generated by Vivado on Mon Oct 17 00:32:10 +0800 2022
REM SW Build 3173277 on Wed Apr  7 05:07:49 MDT 2021
REM
REM IP Build 3174024 on Wed Apr  7 23:42:35 MDT 2021
REM
REM usage: elaborate.bat
REM
REM ****************************************************************************
REM elaborate design
echo "xelab -wto b8f7f4cb0fcb4aa790cee9113fe9014f --incr --debug typical --relax --mt 2 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L unisims_ver -L secureip --snapshot t_HW1_delay_behav xil_defaultlib.t_HW1_delay xil_defaultlib.glbl -log elaborate.log"
call xelab  -wto b8f7f4cb0fcb4aa790cee9113fe9014f --incr --debug typical --relax --mt 2 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L unisims_ver -L secureip --snapshot t_HW1_delay_behav xil_defaultlib.t_HW1_delay xil_defaultlib.glbl -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0