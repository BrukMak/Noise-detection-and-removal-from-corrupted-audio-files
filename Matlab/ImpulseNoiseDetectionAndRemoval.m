
% Creating Impulse Noise %


Fs=44100;% Sampling rate
T=22; % duration
t = 0:1/Fs:T; % Sampling range

sprate = 20;%Impulse noise rate

[yfd,fd] = audioread('The homeless wonderer at 44-1p.mp3'); %Reading audio signal from file

resamp =interp1(0:1/fd:(length(yfd)-1)/fd,yfd(:,1),t); % Resampling The audio signal to 44.1KHz Sampling rate

rng(0); %Initialize random number generator

spnoise = saltpeppernoise(sprate,t,Fs); %Call Function saltpeppernoise which generates the impulse noise

noisySound = resamp + spnoise; % Impulse noised Audio signal



% Noise Detection and Removal of Impulse Noise
         %Using Meadian Filter
         

filtered = [];
filtered(1) = median([0 0 noisySound(1) noisySound(2) noisySound(3)]);
filtered(2) = median([0 noisySound(1) noisySound(2) noisySound(3) noisySound(4)]);

for i=3:length(t) - 2
  filtered(i) = median([noisySound(i-2) noisySound(i-1) noisySound(i) noisySound(i+1) noisySound(i+2)]);
end


% Ploting The Sound signals

figure(1);
subplot(2,2,1);
plot(spnoise,'g')
title('Impulse noise');


subplot(2,2,2);
plot(resamp,'y')
title('Audio Signal');


subplot(2,2,3);
plot(noisySound,'r'); %Plot Noisy Signal
title('Noisy Audio Signal');



hold on;
subplot(2,2,4);
plot(filtered,'b', 'linewidth' , 1); %Plot Filtered Signal
title('Filtered Audio Signal');
   

   %To hear The Sounds UnComment the below Commands

%soundsc(noisySound,Fs)    % Uncomment to hear Noisey Sound
%soundsc(filtered,Fs)     % Uncomment to hear Filtered Sound

