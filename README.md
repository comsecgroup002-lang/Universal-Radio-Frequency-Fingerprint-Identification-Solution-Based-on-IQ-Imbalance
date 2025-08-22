USRP-based OFDM RF Fingerprinting Dataset
📖 Overview

This dataset contains orthogonal frequency-division multiplexing (OFDM) signals collected using a software-defined radio (SDR) platform for radio frequency fingerprint identification (RFFI) research. The dataset aims to provide high-quality, real-world RF signal captures with hardware-induced features suitable for machine learning–based device identification.

📡 Data Acquisition

Transmitters: Two USRP X310 devices controlled via GNU Radio

Carrier frequency: 10 MHz

Receiver: PicoScope 3206D digital oscilloscope (1 GS/s max sampling rate)

Environment: Indoor short-range (30 cm Tx–Rx distance), typical office environment with multipath and interference

Triggering: Edge-detection mode with adaptive thresholding

Captured duration: ~100 μs per sample (~100k points)

📊 Dataset Details

Sampling rate: 1 GS/s

Waveform format: Time–amplitude samples stored in text format

Number of devices: Multiple USRP transmitter instances

Samples per device: 64 captures

Total samples: ~12,800

Content: Randomized payloads to ensure signal variability

🔍 Applications

This dataset is designed for:

RF fingerprinting (RFFI)

Device identification and authentication

Robustness testing under multipath, mobility, and hardware impairments

Benchmarking machine learning models (CNNs, KANs, etc.)

📂 File Structure
/USRP-based OFDM
  /1G-10M-1
    20231012-0001_1.txt
    20231012-0001_2.txt
    ...
  /1G-10M-2
    ...
  ...

⚠️ Notes

All signals include transient and steady-state regions to preserve device-specific characteristics.

Data is provided as-is for academic research and reproducibility purposes.

Please cite our related paper if you use this dataset.
