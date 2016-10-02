## Author: user <user@DELL>
## Created: 2016-10-01

function [WeatherDay1,WeatherDay2,WeatherDay3,WeatherDay4,WeatherDay5,WeatherDay6,WeatherDay7] = loadWeeklyWeather ()
load("WeatherDay1.txt","-ascii");
load("WeatherDay2.txt","-ascii");
load("WeatherDay3.txt","-ascii");
load("WeatherDay4.txt","-ascii");
load("WeatherDay5.txt","-ascii");
load("WeatherDay6.txt","-ascii");
load("WeatherDay7.txt","-ascii");
endfunction