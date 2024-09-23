REM return to scons build following model of 
REM https://www.mail-archive.com/dev@serf.apache.org/msg01887.html

scons APR="%LIBRARY_PREFIX%" APU="%LIBRARY_PREFIX%" ^
    OPENSSL="%LIBRARY_PREFIX%" ZLIB="%LIBRARY_PREFIX%" ^
    PREFIX="%PREFIX%" CC="%CC%" ^
    TARGET_ARCH="x64"
REM    CFLAGS="%CFLAGS%" CPPFLAGS="%CPPFLAGS%" LINKFLAGS="%LDFLAGS%" 
IF ERRORLEVEL 1 EXIT 1

REM scons install
REM IF ERRORLEVEL 1 EXIT 1

REM dir /s  %SRC_DIR%
REM find in https://dev.azure.com/conda-forge/feedstock-builds/_build/results?buildId=513966&view=logs&j=171a126d-c574-5c8c-1269-ff3b989e923d&t=1183ba29-a0b5-5324-8463-2a49ace9e213

REM Copy files to model the Linux package (w/o tests, at least for now)
mkdir  %LIBRARY_INC%\auth
MOVE /Y %SRC_DIR%\auth\*.h %LIBRARY_INC%\auth\
MOVE /Y %SRC_DIR%\serf*.h %LIBRARY_INC%\
mkdir %LIBRARY_LIB%\pkgconfig
MOVE /Y %SRC_DIR%\serf-1.pc %LIBRARY_LIB%\pkgconfig\serf-1.pc
MOVE /Y %SRC_DIR%\serf-1.* %LIBRARY_LIB%\
MOVE /Y %SRC_DIR%\libserf-1.* %LIBRARY_BIN%\

