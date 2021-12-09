[d,r] = audioread('she_cut_with_her_knife_original.wav')

[F,M] = swsmodel(d,r);

subplot(211)
plot(F') % see 4 formant line, and another line with dramatic freq change, what's that. 4 formants in spectrogram below 
subplot(212)
plot(M')

dr = synthtrax(F,M,r);


sound(dr,r)
audiowrite('she_cut_with_her_knife_sws.wav', dr, r)

% [a,g] = lpcfit(d);
% dl = lpcsynth(a,g);
% sound(dl,r)
% % The LPC reconstruction is based on more or less the same information 
% % as the sinewave replica, but it sounds less 'weird'
% Compare the spectrograms
subplot(311)
specgram(d,256,r);
title('Original');
subplot(312)
specgram(dr,256,r);
title('Sine wave replica');
% subplot(313)
% specgram(dl,256,r);
% title('Noise-excited LPC reconstruction');