%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% AUTUMN HACKATHON
%
% Data generation script
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc; clear;

nWeeks = 52;
daysPerWeek = 5;

weeks = 1:nWeeks;
weekDays = 1:daysPerWeek;

nEmployeesLund = 1e3;
nTeamsLund = 60;
employeesPerTeam = 8;

% parameters
noiseAmpl = 0.03;

%% Generate the matrix
dayId = (1:nWeeks*daysPerWeek).';
tmp = repmat(weeks, daysPerWeek, 1);
weekNVector = tmp(:);
dayNVector = repmat(weekDays, 1, nWeeks).';

%% First part of the data
endWeek = 8;
nDays = endWeek*daysPerWeek;
avgPercentage = 0.15;

avgEmployees = nEmployeesLund * avgPercentage;
avgEmployeesVector = avgEmployees * ones(nDays,1);

% Lazy fridays
avgEmployeesVector(5:5:nDays) = avgEmployees * 0.9;

% Noise
maxNoise = noiseAmpl * nEmployeesLund;
noise = sqrt(maxNoise) * randn(nDays, 1);

noise = ceil(noise);

presence_part1 = avgEmployeesVector + noise;

figure(1)
bar(1:nDays,presence_part1)
title('Part 1')

%% Second part of data
startWeek = 9;
endWeek = 17;
nDays = (endWeek - startWeek + 1) * daysPerWeek;

days = (daysPerWeek * startWeek - 1) + (1:nDays);
days_withoutOffset = 1:nDays;

startNEmployees = nEmployeesLund * 0.15;
endNEmployees = nEmployeesLund * 0.2;

avgEmployeesVector = (startNEmployees + 0.03 * days_withoutOffset.^2).';

% Lazy fridays
avgEmployeesVector(5:5:nDays) = avgEmployeesVector(5:5:nDays) * 0.9;

% Noise
maxNoise = noiseAmpl * nEmployeesLund;
noise = sqrt(maxNoise) * randn(nDays, 1);

noise = ceil(noise);

presence_part2 = avgEmployeesVector + noise;

figure(2)
bar(days,presence_part2)
title('Part 2')

%% Third part of data
startWeek = 18;
endWeek = 26;
nDays = (endWeek - startWeek + 1) * daysPerWeek;

days = (daysPerWeek * startWeek - 1) + (1:nDays);
days_withoutOffset = 1:nDays;

startNEmployees = nEmployeesLund * 0.2;
endNEmployees = nEmployeesLund * 0.33;

avgEmployeesVector = (startNEmployees + 0.07 * days_withoutOffset.^2).';

% Lazy fridays
avgEmployeesVector(5:5:nDays) = avgEmployeesVector(5:5:nDays) * 0.9;

% Noise
maxNoise = noiseAmpl * nEmployeesLund;
noise = sqrt(maxNoise) * randn(nDays, 1);

noise = ceil(noise);

presence_part3 = avgEmployeesVector + noise;

figure(3)
bar(days,presence_part3)
title('Part 3')

%% Fourth part of data
startWeek = 27;
endWeek = 52;
nDays = (endWeek - startWeek + 1) * daysPerWeek;

days = (daysPerWeek * startWeek - 1) + (1:nDays);
days_withoutOffset = 1:nDays;

startNEmployees = nEmployeesLund * 0.33;
endNEmployees = nEmployeesLund * 0.5;

avgEmployeesVector = (startNEmployees + 0.01 * days_withoutOffset.^2).';

% Lazy fridays
avgEmployeesVector(5:5:nDays) = avgEmployeesVector(5:5:nDays) * 0.9;

% Noise
maxNoise = noiseAmpl * nEmployeesLund;
noise = sqrt(maxNoise) * randn(nDays, 1);

noise = ceil(noise);

presence_part4 = avgEmployeesVector + noise;

figure(4)
bar(days,presence_part4)
title('Part 4')

%% TOTAL

presence = [presence_part1; presence_part2; presence_part3; presence_part4];

figure(4)
bar(dayId, presence);
title('Global presence')
xlabel('Day')
ylabel('Number of people in office')

output = [dayId weekNVector dayNVector presence];


