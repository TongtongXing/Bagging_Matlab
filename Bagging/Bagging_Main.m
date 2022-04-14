% Main() for bagging
clear
clc
close all
%% Load data
load UCIDB.mat
%% Divide data into training and validation sets
ho = 0.2;% Ratio of validation data
HO = cvpartition(labels,'HoldOut',ho); % Divide data into training and validation sets
opts.Model = HO; 
%% Bagging
tic
bag_results = Bagging(data,labels,opts);
bag_time = toc;
