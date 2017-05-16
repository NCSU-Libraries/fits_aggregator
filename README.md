# fits_aggregator
A bash script to aggregate multiple fits XML files into a single file.

## Installation

Download **[fits_aggregator.sh](https://raw.githubusercontent.com/NCSU-Libraries/fits_aggregator/master/fits_aggregator.sh)** and move it to appropriate location on local machine.

## Usage
```
cd [path to directory where script is located]

bash fits_aggregator.sh [path to directory of fits files] [path to output file]
```

[path to directory of fits files] should be a full path (or relative from script location) to a directory containing only fits reports (XML).

[path to output file] should be the full path (or relative from script location) to the output file to be generated, and should include a '.xml' extension.
A filename such as 'fits\_combined\_reports.xml' is recommended.

If the script is re-run with the same output file path specified, any existing file with that path will be overwritten.

