- [pugjs/pug](https://github.com/pugjs/pug)
- [html2pug online](https://html2pug.herokuapp.com/)
- [html2pug converter](https://github.com/donpark/html2jade)
```bash
npm install -g html2jade


### Command-line Usage
#### Outputs to stdout if input is URL
html2jade http://twitter.com
html2jade http://twitter.com > twitter.jade

#### Outputs to file if input is file
html2jade mywebpage.html # outputs mywebpage.jade
html2jade public/*.html  # converts all .html files to .jade

#### Convert HTML from stdin
cat mywebpage.html | html2jade -

#### To generate Scalate compatible output:
html2jade --scalate http://twitter.com
html2jade --scalate http://twitter.com > twitter.jade
html2jade --scalate mywebpage.html
html2jade --scalate public/*.html

```




