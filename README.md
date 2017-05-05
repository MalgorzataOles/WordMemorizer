## About

WordMemorizer is a Shiny application which helps to memorize stuff. This stuff includes but is not limited to:

* words in foreign language
* proverbs
* opposites
* responses

It was created with the goal of learning German words, but it can be easily be modified to serve any other purpose. Just run the app, load your input file with a dictionary that's it!

## Quick start

```r
shiny::runGitHub(“MalgorzataOles/WordMemorizer”)
```

## Format of the input file

Input file should be a csv file, with the first line being the header. The default dictionary loaded on startup is named base.csv and is placed in words/ directory. I encourage you to store your collection of dictionaries in that directory.

## Further development

Although all the basic features are already implemented, there is room for improvement. If you particularly miss a feature, please open an issue with a short description and I will consider implementing it.
