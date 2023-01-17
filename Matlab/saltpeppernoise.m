 % Function To generate Impulse Noise


function spnoise = saltpeppernoise(sprate,t, Fs)
spnoise = zeros(size(t));%Initializing Our noise vector
 
 [~,indx] = sort(rand(size(t))); %getting sorted Indiceis from set of random number and keeping only the first set                              
                                 %of indiceis correspondig to our salt and pepper noise                                  
 indx = indx(1:floor(sprate/Fs*length(t))) ;
 spnoise(indx) = randn(size(indx)); %define each value in SP noise to be randomly distributed number
 
 end 