@ECHO OFF
SETLOCAL

ECHO ----- Convert MonoGame.Framework.dll...

:: Change working directory.
cd Source\MonoGame


if not exist MonoGame.Framework\bin\Portable\AnyCPU mkdir MonoGame.Framework\bin\Portable\AnyCPU || GOTO error
ThirdParty\Dependencies\Piranha\Piranha.exe  make-portable-skeleton -i MonoGame.Framework\bin\Windows\AnyCPU\Release\MonoGame.Framework.dll -o MonoGame.Framework\bin\Portable\AnyCPU\MonoGame.Framework.dll -p ".NETPortable,Version=v4.0,Profile=Profile328" || GOTO error


rem Currently we do not build PCL versions of the MonoGame .Net and .Content.Pipeline DLLs! Commands below are not tested!
rem ECHO ----- Convert MonoGame.Framework.Net.dll...

rem copy /Y MonoGame.Framework\bin\Windows\AnyCPU\Release\MonoGame.Framework.Net.dll MonoGame.Framework\bin\Portable\AnyCPU\temp.dll || GOTO error
rem ThirdParty\Dependencies\Piranha\Piranha.exe workingdir="Source\MonoGame\MonoGame.Framework\bin\Portable\AnyCPU" commandline='make-portable-skeleton -i temp.dll -o MonoGame.Framework.Net.dll -p ".NETPortable,Version=v4.0,Profile=Profile328" || GOTO error
rem del MonoGame.Framework\bin\Portable\AnyCPU\temp.dll || GOTO error


rem ECHO ----- Convert MonoGame.Framework.Content.Pipeline.dll...

rem if not exist MonoGame.Framework.Content.Pipeline\bin\Portable\AnyCPU mkdir MonoGame.Framework.Content.Pipeline\bin\Portable\AnyCPU || GOTO error
rem copy /Y MonoGame.Framework\bin\Portable\AnyCPU\MonoGame.Framework.dll Source\MonoGame\MonoGame.Framework.Content.Pipeline\bin\Portable\AnyCPU\MonoGame.Framework.dll || GOTO error
rem copy /Y MonoGame.Framework.Content.Pipeline\bin\Windows\AnyCPU\Release\MonoGame.Framework.Content.Pipeline.dll MonoGame.Framework.Content.Pipeline\bin\Portable\AnyCPU\temp.dll || GOTO error
rem ThirdParty\Dependencies\Piranha\Piranha.exe  workingdir="Source\MonoGame\MonoGame.Framework.Content.Pipeline\bin\Portable\AnyCPU" commandline='make-portable-skeleton -i temp.dll -o MonoGame.Framework.Content.Pipeline.dll -p ".NETPortable,Version=v4.0,Profile=Profile328" || GOTO error
rem del MonoGame.Framework.Content.Pipeline\bin\Portable\AnyCPU\temp.dll || GOTO error


cd ..\..


ECHO.
ECHO SUCCESS - MonoGame PCL build successful.
PAUSE
EXIT

:error
ECHO.
ECHO ERROR - MonoGame PCL build failed.
PAUSE
EXIT /B 1
