## Processing API and Sublime Text Package Syntax Comparator

This Ruby program scrapes the published API keywords from the [Processing reference](http://processing.org/reference "Processing Reference") and compares it to the [Processing Sublime Text Package](http://github.com/ybakos/processing-sublime) syntax file. It essentially displays a diff of the two, to show you what exists in the API and is not in the package; and what is in the package syntax but no longer exists in the API.

### Usage

    p5_st_package_check compare PATH/TO/Processing.tmLanguage

The program will display the relative complements of the two sets of syntax keywords.

### License

Released under the MIT License.  See the [LICENSE](LICENSE.md) file for further details.
