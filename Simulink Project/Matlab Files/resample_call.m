function reSampled = resample_call(input_signal)
freqIn = 38192;
freqOut = 32768;
reSampled = resample(input_signal, freqOut, freqIn);
