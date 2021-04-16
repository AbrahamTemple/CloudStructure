@echo on
@echo =============================================================
@echo $                                                           $
@echo $              Platform                  $
@echo $                                                           $
@echo $                                                           $
@echo $                                                           $
@echo $                                    $
@echo $                                  $
@echo $                                                           $
@echo =============================================================
@echo.
@echo off

@title ZLT Microservices-Platform
@color 0e

call mvn clean package -Dmaven.test.skip=true

pause