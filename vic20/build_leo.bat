rem SYNTHESIS SCRIPT USING EXEMPLAR
@echo off
set name=vic20
set rom_path=roms\
echo use build_leo /xil to skip synthesis stage.

if not exist build mkdir build
if not exist build echo Could not create directory & goto :eof
pushd build

xcopy /y ..\source\*.vhd
xcopy /y ..\source\*.edf
xcopy /y ..\%rom_path%*.vhd
copy ..\%name%_leo.ucf %name%.ucf
copy ..\%name%.ut
copy ..\%name%.leo


if "%1"=="/xil" goto xilinx
spectrum -file %name%.leo -logfile leonardo.log

:xilinx
ngdbuild -nt on -uc %name%.ucf %name%.edf %name%.ngd
map -pr b %name%.ngd -o %name%.ncd %name%.pcf
par -w -l 4 %name%.ncd %name%.ncd %name%.pcf
trce -v 10 -o %name%.twr %name%.ncd %name%.pcf
bitgen %name%.ncd %name%.bit -w -f %name%.ut

popd
echo Done
