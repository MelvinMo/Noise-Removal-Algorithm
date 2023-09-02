# Noise-Removal-Algorithm

This project presents a noise removal algorithm implemented in MATLAB for audio files. The algorithm utilizes various signal processing techniques to filter out unwanted noise components, resulting in a cleaner audio output. This technical description provides a comprehensive overview of the code and its functionality.

The code begins by reading an audio file using the audioread function, extracting the audio signal and the sampling frequency. The audio signal is then processed using a series of steps to remove noise and enhance the audio quality.

Let's explore each step in detail:
- Time-Domain Analysis:
The original audio signal is plotted in the time domain using the stem function. This visualization provides insights into the waveform and structure of the audio signal.

- Frequency-Domain Analysis:
The code proceeds to analyze the audio signal in the frequency domain. The Fast Fourier Transform (FFT) is applied to obtain the amplitude spectrum of the signal. The spectrum is plotted using the plot function, displaying the distribution of signal energy across different frequencies. The single-sided amplitude spectrum is also visualized, giving a clearer representation of the positive frequency content.

- Filtering:
The noise removal process involves filtering the audio signal at specific frequency ranges. Two frequencies, f1 and f2, are targeted for filtering in this code.

  - a. Filtering f1: 1043Hz
A bandstop filter is designed using the Butterworth filter design method with a filter order of 2. The filter is configured to attenuate frequencies around 1043Hz, effectively removing noise at that frequency. Additionally, a bandpass filter is created to extract the filtered signal at f1. The filtered signal is plotted in the frequency domain.

  - b. Filtering f2: 1956Hz
Similar to the previous step, a bandstop filter is designed to attenuate frequencies around 1956Hz. The filtered signal from the previous step is further processed by this filter. A bandpass filter is also applied to extract the filtered signal at f2. The resulting signal is plotted in the frequency domain.

- Normalization:
To ensure consistent audio levels, the filtered signal is normalized by dividing it by the maximum magnitude. This step helps to maintain the dynamic range and prevent distortion in the processed audio.

- Post-processing Analysis:
The processed audio signal, after noise removal and normalization, is visualized in the time and frequency domains. The time-domain plot shows the clean audio waveform, while the frequency-domain plot represents the modified amplitude spectrum. These visualizations demonstrate the effectiveness of the noise removal algorithm.

- Audio Playback and Output:
The code enables the playback of the original audio signal (pOrig.play) and the processed audio signal (p.play). Additionally, the filtered signals at f1 (pf1.play) and f2 (pf2.play) can be played separately for further analysis. Finally, the processed audio signal is written to a new audio file using the audiowrite function, creating a file named "test_audio_processed.wav".
