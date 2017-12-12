- [Checkout a specific revision from Subversion from the command line](https://stackoverflow.com/questions/1429034/checkout-a-specific-revision-from-subversion-from-the-command-line)
```sh
svn checkout url://repository/path@1234     working-directory
svn checkout -r 1234 url://repository/path  working-directory

svn checkout -r 1234 url://repository/path  working-directory --username user01 --password  password01
```





