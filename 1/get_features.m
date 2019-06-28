function feat = get_features(audiofile, no_features)
%GET_FEATURES Summary of this function goes here
%   Detailed explanation goes here
% figure(1);
% plot(t, x, 'r');
% xp = x(:, 1);
% Np = length(xp);
% tp = (0:Np-1)/fs;
% figure(2);
% plot(tp, xp, 'b');
% spectrogram(x, 1024, 256*3, [], fs, 'yaxis');
% clear, clc, close all

% get a section of the sound file
[x, fs] = audioread(char(audiofile));   % load an audio file
x = x(:, 1);                        % get the first channel
N = length(x);                      % signal length
t = (0:N-1)/fs;                     % time vector

% % plot the signal waveform
% figure(1)
% plot(t, x, 'r')
% xlim([0 max(t)])
% ylim([-1.1*max(abs(x)) 1.1*max(abs(x))])
% grid on
% set(gca, 'FontName', 'Times New Roman', 'FontSize', 14)
% xlabel('Time, s')
% ylabel('Amplitude')
% title('The signal in the time domain')

% % plot the signal spectrogram
% figure(2)
% colormap(hot);
% spectrogram(x, 1024, 3/4*1024, [], fs, 'yaxis')
% box on
% set(gca, 'FontName', 'Times New Roman', 'FontSize', 14)
% xlabel('Time, s')
% ylabel('Frequency, Hz')
% title('Spectrogram of the signal')
% 
% h = colorbar;
% set(h, 'FontName', 'Times New Roman', 'FontSize', 14)
% ylabel(h, 'Magnitude, dB')

% spectral analysis
w = hanning(N, 'periodic');
[X, f] = periodogram(x, w, N, fs, 'power');
Xmap = containers.Map(X, f);
% plot(f, X);
Xs = sort(X);
feat = zeros(no_features, 1);   
j = 1;
for i = length(Xs):-1:1
    if(Xmap(Xs(i)) >= 2000)
        feat(j) = Xmap(Xs(i));
        j = j + 1;
    end
    if(j > no_features)
        break;
    end
end
% for i = 1:length(X)
%    plot(X(i), Xmap(X(i)));
% end
% Feat = zeros(50,1);
% j = 1;
% k = keys(Xmap);
% k = k';
% for i = 1:length(k)
%     if(j > 50) 
%         break; 
%     end
%     if(Xmap(cell2num(k(i))) >= 2000)
%         Feat(j) = Xmap(cell2num(k(i)));
%         j = j + 1;
%     end
% end
% X = 20*log10(sqrt(X)*sqrt(2));
end

