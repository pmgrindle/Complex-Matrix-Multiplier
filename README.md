# Complex-Matrix-Multiplier
Complex Matrix Multiplier in VHDL created for ESE 441 - Senior Design II at SBU

Created in Aldec Active-HDL Student Edition, configuration files as well as some waveform outputs are included. Current paradigm is sequential multiplication. Future edits will include:

- Parallel Calculation
- Customizable Matrix Sizes
- Successful Synthesis and Place+Route Output from Vivado
- Test Results from Running on Local FPGA
- Cloud Hosting (with any necessesary edits of files) via Amazon F1
- Web Interface to interact with cloud hosted project

## A Note on Autoconf

Please note that any local git config for this project should use autoconf = false. The Active-HDL software appears to create files, .mgf files especially, with Unix style 'lf' linebreak characters which git wants to convert to Windows style 'crlf' carriage return + linebreak characters via the default autoconf value of true. Why does a Windows-only HDL tool use Unix style linebreak characters? That is a great question for Aldec, but for now, turning off git's conversion of those characters keeps the file contents intact.
