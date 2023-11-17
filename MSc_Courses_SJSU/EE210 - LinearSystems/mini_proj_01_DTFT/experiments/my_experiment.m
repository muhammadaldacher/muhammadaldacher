clc; clear all; close all;

x = [1 2 3 4 10 30 4 5];
h = [-1 3 10];

y1 = conv(x,h)
y2 = my_conv(x,h)